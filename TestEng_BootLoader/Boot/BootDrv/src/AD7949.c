/**
  ******************************************************************************
  * @file    AD7949.c  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   AD7949 driver
  ******************************************************************************
**/ 




#include "include.h"

#define CFG_KEEP                0x0
#define CFG_OVERWRITE           0x2000

#define INCC_BIPOLAR_DIFFERENTIAL_PAIRS     0x0
#define INCC_BIPOLAR                        0x800
#define INCC_TEMPERATURE_SENSOR             0xC00
#define INCC_UNIPOLAR_DIFFERENTIAL_PAIRS    0x1000
#define INCC_UNIPOLAR_TO_COM                0x1800
#define INCC_UNIPOLAR_TO_GND                0x1C00

#define IN0                                    0x0
#define IN1                                    0x80
#define IN2                                    0x100
#define IN3                                    0x180
#define IN4                                    0x200
#define IN5                                    0x280
#define IN6                                    0x300
#define IN7                                    0x380

#define BW_0_25                                0x0
#define BW_FULL                                0x40

#define REF_IN_2V5                            0x0
#define REF_IN_4V096                          0x8
#define REF_EX_TEM_ENABLE                     0x10
#define REF_EX_IN_BUFFER_TEM_ENABLE           0x18
#define REF_EX_TEM_DISABLE                    0x30
#define REF_EX_IN_BUFFER_TEM_DISABLE          0x38

#define SEQ_DISABLE                                 0x0
#define SEQ_UPDATA_CONFIGURATION_DURING_SEQUENCE    0x2
#define SEQ_SCAN_TEM                                0x4
#define SEQ_SCAN                                    0x6

#define RB_DISABLE                                   0x1
#define RB_ENABLE                                    0x0

#define AD7949_CMD(overwrite, ch)  ((overwrite | INCC_UNIPOLAR_TO_COM | ch | BW_FULL | REF_IN_2V5 | SEQ_DISABLE | RB_DISABLE)<<2)
#define AD7949_CMD_CH(overwrite,X)  AD7949_CMD(overwrite,IN##X)

#define AD7949_CH_NUM 8
const uint16_t AD7949_cmd_ch_ca[AD7949_CH_NUM][2] = 
{
    {AD7949_CMD_CH(CFG_OVERWRITE,0),AD7949_CMD_CH(CFG_KEEP,0)},
    {AD7949_CMD_CH(CFG_OVERWRITE,1),AD7949_CMD_CH(CFG_KEEP,1)},
    {AD7949_CMD_CH(CFG_OVERWRITE,2),AD7949_CMD_CH(CFG_KEEP,2)},
    {AD7949_CMD_CH(CFG_OVERWRITE,3),AD7949_CMD_CH(CFG_KEEP,3)},
    {AD7949_CMD_CH(CFG_OVERWRITE,4),AD7949_CMD_CH(CFG_KEEP,4)},
    {AD7949_CMD_CH(CFG_OVERWRITE,5),AD7949_CMD_CH(CFG_KEEP,5)},
    {AD7949_CMD_CH(CFG_OVERWRITE,6),AD7949_CMD_CH(CFG_KEEP,6)},
    {AD7949_CMD_CH(CFG_OVERWRITE,7),AD7949_CMD_CH(CFG_KEEP,7)},
};

#define AD7949_CMD_OVERWRITE 0
#define AD7949_CMD_KEEP      1

#define AD7949_READ_CHECK_ENA 1
#define AD7949_READ_CHECK_DIS 0

#define AD7949_READ_CHECK AD7949_READ_CHECK_DIS
#define AD7949_READ_CHECK_MSK  0x000F

#define AD7949_SPI_PORT SPI2

#define AD7949_CNV_LOW() Enable_cs_ad()
#define AD7949_CNV_HIG() Disable_cs_ad()
#define AD7949_choose_mux(ch) Choose_MUX_Channel(ch)

#define AD7949_ISAMP_16 0
#define AD7949_ISAMP_32 1
#define AD7949_MPD_16   2
#define AD7949_MPD_32   3
#define AD7949_VSAMP_16 4
#define AD7949_VSAMP_32 5
#define AD7949_THERMO_1 6
#define AD7949_THERMO_2 7


#define AD7949_CH_0     0
#define AD7949_CH_1     1
#define AD7949_CH_2     2
#define AD7949_CH_3     3
#define AD7949_CH_4     4
#define AD7949_CH_5     5
#define AD7949_CH_6     6
#define AD7949_CH_7     7

typedef struct
{
    uint16_t AD7949_isamp_buf[32];
    uint16_t AD7949_mpd_buf[32];
    uint16_t AD7949_vsamp_buf[32];
    uint16_t AD7949_thermo_buf0[1];
    uint16_t AD7949_thermo_buf1[1];
}AD7949_data_st;

AD7949_data_st   AD7949_databuf_st;

static void AD7949_Spi_Io_Init(void);
static void AD7949_Spi_Io_DeInit(void);
static uint8_t AD7949_Spi_Access(uint16_t RegisterData, uint16_t * ReceiveData);
static uint8_t AD7949_read_data(uint16_t chn, uint16_t *value);
static uint8_t AD7949_read_data_chk(uint16_t ch, uint16_t *rdata);



static uint8_t AD7949_read_ISAMP(uint16_t ch, uint16_t *rdata);
static uint8_t AD7949_read_MPD(uint16_t ch, uint16_t *rdata);
static uint8_t AD7949_read_VSAMP(uint16_t ch, uint16_t *rdata);
static uint8_t AD7949_read_THERMO(uint16_t ch, uint16_t *rdata);




void AD7949_init(void)
{

}



void AD7949_read_all_data(void)
{

    uint8_t i;
    AD7949_Spi_Io_Init();
    
    for(i=0; i<16; i++)
    {
        AD7949_choose_mux(i);
        Delay_ms(1);
        AD7949_read_ISAMP(AD7949_ISAMP_16, &AD7949_databuf_st.AD7949_isamp_buf[i]);
        AD7949_read_ISAMP(AD7949_ISAMP_32, &AD7949_databuf_st.AD7949_isamp_buf[i+16]);
        AD7949_read_MPD(AD7949_MPD_16, &AD7949_databuf_st.AD7949_mpd_buf[i]);
        AD7949_read_MPD(AD7949_MPD_32, &AD7949_databuf_st.AD7949_mpd_buf[i+16]);
        AD7949_read_VSAMP(AD7949_VSAMP_16, &AD7949_databuf_st.AD7949_vsamp_buf[i]);
        AD7949_read_VSAMP(AD7949_VSAMP_32, &AD7949_databuf_st.AD7949_vsamp_buf[i+16]);
    }
    AD7949_read_THERMO(AD7949_THERMO_1, &AD7949_databuf_st.AD7949_thermo_buf0[0]);
    AD7949_read_THERMO(AD7949_THERMO_2, &AD7949_databuf_st.AD7949_thermo_buf1[0]);
    AD7949_Spi_Io_DeInit();


}


uint8_t AD7949_read_ISAMP_ch(uint16_t ch, uint16_t *rdata)
{
    uint8_t ret = ERROR;

    if((void *)0 == rdata)
        return ERROR;
    if(ch >= ISAMP_MAX_CH)
        return ERROR;
    
    *rdata = AD7949_databuf_st.AD7949_isamp_buf[ch];
    ret = SUCCESS;

    return ret;
}

uint8_t AD7949_read_MPD_ch(uint16_t ch, uint16_t *rdata)
{
    uint8_t ret = ERROR;

    if((void *)0 == rdata)
        return ERROR;
    if(ch >= MPDSAMP_MAX_CH)
        return ERROR;
    
    *rdata = AD7949_databuf_st.AD7949_mpd_buf[ch];
    ret = SUCCESS;

    return ret;
}

uint8_t AD7949_read_VSAMP_ch(uint16_t ch, uint16_t *rdata)
{
    uint8_t ret = ERROR;

    if((void *)0 == rdata)
        return ERROR;
    if(ch >= VSAMP_MAX_CH)
        return ERROR;
    
    *rdata = AD7949_databuf_st.AD7949_vsamp_buf[ch];
    ret = SUCCESS;

    return ret;
}

uint8_t AD7949_read_THERMO_ch(uint16_t ch, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    if((void *)0 == rdata)
        return ret;
    if(THERMO_1 == ch)
    {
        *rdata = AD7949_databuf_st.AD7949_thermo_buf0[0];
        ret = SUCCESS;
    }
    else if(THERMO_2 == ch)
    {
        *rdata = AD7949_databuf_st.AD7949_thermo_buf1[0];
        ret = SUCCESS;
    }
    else
    {
    }

    return ret; 
}

static uint8_t AD7949_read_ISAMP(uint16_t ch, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    uint8_t ad_ch;
    if((void *)0 == rdata)
        return ERROR;
    
    if(AD7949_ISAMP_16 == ch)
    {
        ad_ch = AD7949_CH_0;
    }
    else if(AD7949_ISAMP_32 == ch)
    {
        ad_ch = AD7949_CH_1;
    }
    else
    {
    }
    ret = AD7949_read_data_chk(ad_ch, rdata);

    return ret;
}


static uint8_t AD7949_read_MPD(uint16_t ch, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    uint8_t ad_ch;
    if((void *)0 == rdata)
        return ERROR;
    
    if(AD7949_MPD_16 == ch)
    {
        ad_ch = AD7949_CH_2;
    }
    else if(AD7949_MPD_32 == ch)
    {
        ad_ch = AD7949_CH_3;
    }
    else
    {
    }
    ret = AD7949_read_data_chk(ad_ch, rdata);

    return ret;
}




static uint8_t AD7949_read_VSAMP(uint16_t ch, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    uint8_t ad_ch;
    if((void *)0 == rdata)
        return ERROR;
    
    if(AD7949_VSAMP_16 == ch)
    {
        ad_ch = AD7949_CH_4;
    }
    else if(AD7949_VSAMP_32 == ch)
    {
        ad_ch = AD7949_CH_5;
    }
    else
    {
    }
    ret = AD7949_read_data_chk(ad_ch, rdata);

    return ret;
}

static uint8_t AD7949_read_THERMO(uint16_t ch, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    uint8_t ad_ch;
    if((void *)0 == rdata)
        return ERROR;
    
    if(AD7949_THERMO_1 == ch)
    {
        ad_ch = AD7949_CH_6;
    }
    else if(AD7949_THERMO_2 == ch)
    {
        ad_ch = AD7949_CH_7;
    }
    else
    {
    }
    ret = AD7949_read_data_chk(ad_ch, rdata);

    return ret;
}


static uint8_t AD7949_read_data_chk(uint16_t ch, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    uint16_t adc_data0 = 0;
#if(AD7949_READ_CHECK == AD7949_READ_CHECK_ENA)
    uint16_t adc_data1 = 0;
    uint16_t adc_abs=0;
#endif    
    if((void *)0 == rdata)
        return ERROR;

    ret = AD7949_read_data(ch, &adc_data0);
#if(AD7949_READ_CHECK == AD7949_READ_CHECK_ENA)
    /*read twice to check ADC results*/
    if(SUCCESS == ret)
    {
        ret = AD7949_read_data(ch, &adc_data1);
        adc_abs = abs(adc_data0 - adc_data1);
        if( adc_abs < AD7949_READ_CHECK_MSK)
        {
            *rdata = (uint16_t)(((uint32_t)adc_data0 + (uint32_t)adc_data1)>>1);
            ret = SUCCESS;
        }
        else
        {
            *rdata = 0;
            ret = ERROR;
        }
    }
    else
    {
        *rdata = 0;
        ret = ERROR;
    }
#else    
    if(SUCCESS == ret)
    {
        *rdata = adc_data0;
        ret = SUCCESS;
    }
    else
    {
        *rdata = 0;
        ret = ERROR;
    } 
#endif
    return ret;

}


void AD7949_SDI_HIG(void)
{
    GPIOB->BSRR |= GPIO_Pin_15;
}


void AD7949_SDI_LOW(void)
{
    GPIOB->BRR |= GPIO_Pin_15;
}


void AD7949_CLK_HIG(void)
{
    GPIOB->BSRR |= GPIO_Pin_13;
}


void AD7949_CLK_LOW(void)
{
    GPIOB->BRR |= GPIO_Pin_13;
}

static void AD7949_Spi_Io_Init(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_14;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;  
    GPIO_Init(GPIOB, &GPIO_InitStructure);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13|GPIO_Pin_15;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  
    GPIO_Init(GPIOB, &GPIO_InitStructure);
    
    AD7949_CLK_LOW();
    AD7949_SDI_LOW();
    AD7949_CNV_LOW();

}

static void AD7949_Spi_Io_DeInit(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13| GPIO_Pin_14 | GPIO_Pin_15;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
}

static uint8_t AD7949_Spi_Access(uint16_t RegisterData, uint16_t * ReceiveData)
{
    uint16_t ReceiveData_tmp = 0;
    uint16_t i = 0;

    for(i=0; i<14; i++)
    {
        if(0x8000 == (RegisterData & 0x8000))
        {
            AD7949_SDI_HIG();
        }
        else
        {
            AD7949_SDI_LOW();
        }
        Delay_us(1);
        AD7949_CLK_HIG();
        Delay_us(1);
        
        if(GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_14))
        {
            ReceiveData_tmp |= 1;
        }

        AD7949_CLK_LOW();
        Delay_us(1);
        ReceiveData_tmp <<= 1;
        RegisterData <<= 1;
    }
    *ReceiveData = ReceiveData_tmp;
    return SUCCESS;
}

static uint8_t AD7949_read_data(uint16_t chn, uint16_t *value)
{
    uint16_t RegisterData;
    uint16_t SampleTimes = 0;
    uint16_t AdcValue = 0;
    uint32_t SumValue = 0;

    AD7949_CNV_LOW();
    Delay_us(1);
    AD7949_CNV_HIG();
    Delay_us(10);
    AD7949_CNV_LOW();
    Delay_us(1);
    RegisterData = AD7949_cmd_ch_ca[chn][AD7949_CMD_OVERWRITE];
    AD7949_Spi_Access(RegisterData, &AdcValue);

    AD7949_CNV_HIG();
    Delay_us(10);
    AD7949_CNV_LOW();
    Delay_us(1);
    RegisterData = AD7949_cmd_ch_ca[chn][AD7949_CMD_KEEP];
    AD7949_Spi_Access(RegisterData, &AdcValue);

    while(SampleTimes<8)
    {
        AD7949_CNV_HIG();
        Delay_us(10);
        AD7949_CNV_LOW();
        Delay_us(1);

        AD7949_Spi_Access(RegisterData, &AdcValue);
        SumValue += AdcValue;
        SampleTimes++;
    }
    *value = SumValue/SampleTimes;

    return SUCCESS;

}



/******************* (C) COPYRIGHT 2018 *****END OF FILE****/


