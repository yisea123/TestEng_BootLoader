/**
  ******************************************************************************
  * @file    command.c  burn in system
  * @author  h&h
  * @version 
  * @date    
  * @brief   command.c
  ******************************************************************************
  * 
  *
  */ 

#include "include.h"
#include "port.h"


uint16_t cmd_lock_reg[CMD_LOCK_LENGTH];
uint8_t  cmd_lock_st = TRUE;
#define CMD_LOCK_ST cmd_lock_st

void cmd_check_lock(void)
{
    if((cmd_lock_reg[0] == 0xDEAD) && (cmd_lock_reg[1] == 0xBEEF))
        cmd_lock_st = FALSE;
    else
        cmd_lock_st = TRUE;
}


uint16_t cmd_potentiometer_res_old[CMD_PO_RES_LENGTH];
uint16_t cmd_potentiometer_res[CMD_PO_RES_LENGTH];

void cmd_write_potentiometer(void)
{
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        if(cmd_potentiometer_res_old[0] != cmd_potentiometer_res[0])
        {        
            ret = MAX5478_write_potentiometer((uint8_t)cmd_potentiometer_res[0]);
            cmd_potentiometer_res_old[0] = cmd_potentiometer_res[0];
        }
        else
        {

        }
    }
    else
    {
    
    }
}

uint16_t cmd_vcc_en_old[CMD_VCC_EN_LENGTH];
uint16_t cmd_vcc_en[CMD_VCC_EN_LENGTH];
void cmd_write_vcc_en(void)
{
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        if(cmd_vcc_en[0] != cmd_vcc_en_old[0])
        {
            if(0xABCD == cmd_vcc_en[0])
            {
                Enable_sw_vs1();
                Delay_ms(10);
            }
            else
            {
                Disable_sw_vs1();
            }
            cmd_vcc_en_old[0] = cmd_vcc_en[0];
        }
    }
    else
    {
    
    }
}

uint16_t cmd_max7312_en_old[CMD_MAX7312_LENGTH];
uint16_t cmd_max7312_en[CMD_MAX7312_LENGTH];
void cmd_write_switches(void)
{
    uint8_t ret, i, res_port1, res_port2;
    uint16_t res=0;

    if(CMD_LOCK_ST == FALSE)
    {
        for(i=0; i<2; i++)
        {
            if(cmd_max7312_en_old[i] != cmd_max7312_en[i])
            {

                Max7312_Set_All_Port_Output(0);
                Max7312_Set_All_Port_Output(1);

                res = cmd_max7312_en[i];
                res_port1 = res & 0x00FF;
                res_port2 = (res & 0xFF00)>>8;
                ret = Max7312_Set_Port1_HiLo(i, res_port1);
                ret = Max7312_Set_Port2_HiLo(i, res_port2);
                cmd_max7312_en_old[i] = cmd_max7312_en[i];
            }
            else
            {
                /*do nothing*/
            }
        }
    }
    else
    {
        /*do nothing*/
    }   
}

#define LTC2620_CHIP_NUM 4
#define LTC2620_CHIP_CHN 8

uint8_t  cmd_cur_dac_cs[LTC2620_CHIP_NUM]=
{
    LTC2620_CHIP_ID_1,
    LTC2620_CHIP_ID_2,
    LTC2620_CHIP_ID_3,
    LTC2620_CHIP_ID_4,
};

uint16_t cmd_pwrdn_dac_old[CMD_PWRDN_DAC_LENGTH];
uint16_t cmd_pwrdn_dac[CMD_PWRDN_DAC_LENGTH];
uint32_t cmd_pwrdn_current_st;
uint32_t cmd_pwrdn_update_ch_st;

#define cmd_is_chp_pwrdn_updated(i) ((cmd_pwrdn_update_ch_st & ((uint32_t)0xFF)<<(i*LTC2620_CHIP_CHN))?1u:0u)
#define cmd_is_chn_pwrdn_updated(i) ((cmd_pwrdn_update_ch_st & (1u<<i))?1u:0u)
#define cmd_is_ch_pwrdn(i) ((cmd_pwrdn_current_st & (1u<<i))?1u:0u)


#define LTC2620_MAX_VALUE 0xFFFFu
#define LTC2620_MIN_VALUE 0x0000u
uint16_t cmd_cur_dac_old[CMD_CUR_DAC_LENGTH];
uint16_t cmd_cur_dac[CMD_CUR_DAC_LENGTH];
uint32_t cmd_cur_dac_upd_ch_st;

#define cmd_is_chp_value_updated(i) ((cmd_cur_dac_upd_ch_st & ((uint32_t)0xFF)<<(i*LTC2620_CHIP_CHN))?1u:0u)
#define cmd_is_chn_value_updated(i) ((cmd_cur_dac_upd_ch_st & (1u<<i))?1u:0u)


void cmd_powerdown_cur_dac(void)
{
    uint8_t i, j;
    uint8_t ch;
    uint8_t ret;

    if(CMD_LOCK_ST == TRUE)
        return;

    if( (cmd_pwrdn_dac_old[0] != cmd_pwrdn_dac[0]) || 
        (cmd_pwrdn_dac_old[1] != cmd_pwrdn_dac[1]) )
    {
        cmd_pwrdn_dac_old[0] = cmd_pwrdn_dac[0];
        cmd_pwrdn_dac_old[1] = cmd_pwrdn_dac[1];
        cmd_pwrdn_update_ch_st = cmd_pwrdn_current_st;
        cmd_pwrdn_current_st = ((uint32_t)cmd_pwrdn_dac_old[1]<<16) | (uint32_t)cmd_pwrdn_dac_old[0];
        cmd_pwrdn_update_ch_st ^= cmd_pwrdn_current_st;
    }
    else
    {
        cmd_pwrdn_update_ch_st = 0;
    }

    for(i=0; i<LTC2620_CHIP_NUM; i++)
    {
        if(cmd_is_chp_pwrdn_updated(i))
        {
            DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
            Delay_us(1);
            DRV_SPI_CS_LTC2620(cmd_cur_dac_cs[i]);
            Delay_us(5);

            for(j=0; j<LTC2620_CHIP_CHN; j++)
            {
                ch = i*LTC2620_CHIP_CHN +j;
                if(cmd_is_chn_pwrdn_updated(ch))
                {
                    if(cmd_is_ch_pwrdn(ch))
                    {
                        ret = LTC2620_Powerdown_n(j);
                    }
                    else
                    {
                        ret = LTC2620_Write_n_Updata_n(j,cmd_cur_dac_old[ch]);
                    }
                }
                else
                {
                }
            }
            
        }
    }
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
}


void cmd_write_cur_dac(void)
{
    uint8_t i, j;
    uint8_t ch;
    uint8_t ret;

    if(CMD_LOCK_ST == TRUE)
        return;
    
    cmd_cur_dac_upd_ch_st = 0;
    
    for(i=0; i<LTC2620_CHIP_NUM; i++)
    {
        for(j=0; j<LTC2620_CHIP_CHN; j++)
        {
            ch = i*LTC2620_CHIP_CHN +j;
            if(cmd_cur_dac_old[ch] != cmd_cur_dac[ch])
            {
                cmd_cur_dac_old[ch] = cmd_cur_dac[ch];
                if(cmd_cur_dac_old[ch] > LTC2620_MAX_VALUE)
                    cmd_cur_dac_old[ch] = LTC2620_MAX_VALUE;
                if(cmd_cur_dac_old[ch] < LTC2620_MIN_VALUE)
                    cmd_cur_dac_old[ch] = LTC2620_MIN_VALUE;

                cmd_cur_dac_upd_ch_st |= 1u<<ch;
            }
            else
            {
            }
        }
    }

    for(i=0; i<LTC2620_CHIP_NUM; i++)
    {
        if(cmd_is_chp_value_updated(i))
        {
            for(j=0; j<LTC2620_CHIP_CHN; j++)
            {
                DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
                Delay_us(1);
                DRV_SPI_CS_LTC2620(cmd_cur_dac_cs[i]);
                Delay_us(5);

                ch = i*LTC2620_CHIP_CHN + j;
                if(cmd_is_chn_value_updated(ch) && !cmd_is_ch_pwrdn(ch) )
                {
                    ret = LTC2620_Write_n_Updata_n(j,cmd_cur_dac_old[ch]);
                    Delay_ms(1);
                }
                else
                {
                }
            }
        }
    }
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
}

uint16_t cmd_eep_old[CMD_EEP_LENGTH];
uint16_t cmd_eep[CMD_EEP_LENGTH];
uint16_t cmd_rd_eep[CMD_EEP_DATA_LENGTH];

uint32_t cmd_eep_addr;
uint32_t cmd_eep_lenth;
uint32_t  cmd_eep_rd_wr_st;

#define  CMD_OPERATION_NEW 1
#define  CMD_OPERATION_NUL 0

void cmd_rd_wr_eep(void)
{
    uint8_t i;
    uint8_t  cmd_eep_operation_st = CMD_OPERATION_NUL;

    if(CMD_LOCK_ST == FALSE)
    {
        for(i=0; i<CMD_EEP_LENGTH; i++)
        {
            if(cmd_eep[i] != cmd_eep_old[i])
            {
                cmd_eep_operation_st = CMD_OPERATION_NEW;
                break;
            }
        }

        if(CMD_OPERATION_NEW == cmd_eep_operation_st)
        {
            cmd_eep_addr = ((uint32_t)cmd_eep[1]<<16) | cmd_eep[0];
            cmd_eep_lenth = ((uint32_t)cmd_eep[3]<<16) | cmd_eep[2];
            cmd_eep_rd_wr_st = ((uint32_t)cmd_eep[5]<<16) | cmd_eep[4];
            if(cmd_eep_lenth > CMD_EEP_DATA_LENGTH * 2)
                cmd_eep_lenth = CMD_EEP_DATA_LENGTH * 2;

            /*write operation*/
            if(cmd_eep_rd_wr_st == 0xCC98CC98)
            {
                AT24HC02C_wr_n_bytes(0, cmd_eep_addr, cmd_eep_lenth, (uint8_t*)&cmd_eep[CMD_EEP_DATA_OFFSET]);
            }
            else if(cmd_eep_rd_wr_st == 0xAA55AA55)/*read operation*/
            {
                AT24HC02C_rd_n_bytes(0, cmd_eep_addr, cmd_eep_lenth, (uint8_t*)&cmd_rd_eep[0]);
            }
            else
            {
                for(i=0; i<CMD_EEP_DATA_LENGTH; i++)
                {
                    cmd_rd_eep[i] = 0;
                }

            }
            for(i=0; i<CMD_EEP_LENGTH; i++)
            {
                cmd_eep_old[i] = cmd_eep[i];
            }
            
            cmd_eep_operation_st = CMD_OPERATION_NUL;
        }

    }
    else
    {
    
    }


}


uint16_t cmd_adc_tout[CMD_TSAMP_LENGTH];
void cmd_read_thmo(void)
{
    uint8_t i;
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        for(i=0; i<CMD_TSAMP_LENGTH; i++)
        {
            ret = AD7949_read_THERMO_ch(i, &cmd_adc_tout[i]);
        }
    }
    else
    {
    
    }
}


uint16_t cmd_adc_iout[CMD_ISAMP_LENGTH];
void cmd_read_iout(void)
{
    uint8_t i;
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        for(i=0; i<CMD_ISAMP_LENGTH; i++)
        {
            ret = AD7949_read_ISAMP_ch(i, &cmd_adc_iout[i]);
        }
    }
    else
    {
    
    }
}


uint16_t cmd_adc_mout[CMD_MSAMP_LENGTH];
void cmd_read_mout(void)
{
    uint8_t i;
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        for(i=0; i<CMD_MSAMP_LENGTH; i++)
        {
            ret = AD7949_read_MPD_ch(i, &cmd_adc_mout[i]);
        }
    }
    else
    {
    
    }
}

uint16_t cmd_adc_vout[CMD_VSAMP_LENGTH];
void cmd_read_vout(void)
{
    uint8_t i;
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        for(i=0; i<CMD_VSAMP_LENGTH; i++)
        {
            ret = AD7949_read_VSAMP_ch(i, &cmd_adc_vout[i]);
        }
    }
    else
    {
    
    }
}


void cmd_stage_fast_proc(void)
{
    cmd_check_lock();
    cmd_write_potentiometer();
    cmd_write_vcc_en();
    cmd_write_switches();
    cmd_rd_wr_eep();
    cmd_powerdown_cur_dac();
    cmd_write_cur_dac();
    cmd_read_thmo();
    cmd_read_iout();
    cmd_read_mout();
    cmd_read_vout();

}
void cmd_stage_slow_proc(void)
{
    AD7949_read_all_data();
}

#if 0
uint16_t cmd_stage1_vol_dac_old[CMD_STAGE1_VOL_DAC_LENGTH];
uint16_t cmd_stage1_vol_dac[CMD_STAGE1_VOL_DAC_LENGTH];
#define  CMD_STAGE1_VOL_DAC_OFF 8
void cmd_stage1_write_vol_dac(void)
{
    uint8_t i;
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        for(i=0; i<CMD_STAGE1_VOL_DAC_LENGTH;i++)
        {
            if(cmd_stage1_vol_dac[i] > LTC2620_MAX_VALUE)
                cmd_stage1_vol_dac[i] = LTC2620_MAX_VALUE;
            if(cmd_stage1_vol_dac[i] < LTC2620_MIN_VALUE)
                cmd_stage1_vol_dac[i] = LTC2620_MIN_VALUE;

            if(cmd_stage1_vol_dac_old[i] != cmd_stage1_vol_dac[i])
            {
                ret = LTC2620_Write_n_Updata_n( i+CMD_STAGE1_VOL_DAC_OFF,cmd_stage1_vol_dac[i]);
                cmd_stage1_vol_dac_old[i] = cmd_stage1_vol_dac[i];
            }
            else
            {

            }       
        }
    }
    else
    {
    
    }   
}

uint16_t cmd_stage2_pn6v_old[CMD_STAGE2_PV6V_LENGTH];
uint16_t cmd_stage2_pn6v[CMD_STAGE2_PV6V_LENGTH];

void cmd_stage2_write_pn6v(void)
{
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        if(cmd_stage2_pn6v_old[0] != cmd_stage2_pn6v[0])
        {        
            ret = Max7312_Set_Port1_HiLo(1, cmd_stage2_pn6v[0]);
            cmd_stage2_pn6v_old[0] = cmd_stage2_pn6v[0];
        }
        else
        {

        }       
    }
    else
    {
    
    }   
}

uint16_t cmd_stage3_vout_old[CMD_STAGE3_VOUT_LENGTH];
uint16_t cmd_stage3_vout[CMD_STAGE3_VOUT_LENGTH];

void cmd_stage3_write_vout(void)
{
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        if(cmd_stage3_vout_old[0] != cmd_stage3_vout[0])
        {        
            ret = Max7312_Set_Port1_HiLo(0, cmd_stage3_vout[0]);
            cmd_stage3_vout_old[0] = cmd_stage3_vout[0];
        }
        else
        {

        }       
    }
    else
    {
    
    }   
}

uint16_t cmd_stage3_iout_old[CMD_STAGE3_IOUT_LENGTH];
uint16_t cmd_stage3_iout[CMD_STAGE3_IOUT_LENGTH];

void cmd_stage3_write_iout(void)
{
    uint8_t ret;

    if(CMD_LOCK_ST == FALSE)
    {
        if(cmd_stage3_iout_old[0] != cmd_stage3_iout[0])
        {        
            ret = Max7312_Set_Port2_HiLo(0, cmd_stage3_iout[0]);
            cmd_stage3_iout_old[0] = cmd_stage3_iout[0];
        }
        else
        {

        }       
    }
    else
    {
    
    }   
}

#endif
/******************* (C) COPYRIGHT 2018 *****END OF FILE****/
