/**
  ******************************************************************************
  * @file    command.h  burn in system
  * @author  h&h
  * @version 
  * @date    
  * @brief   
  ******************************************************************************
**/ 
#ifndef _COMMAND_H
#define _COMMAND_H

#define CMD_LOCK_OFFSET 0
#define CMD_LOCK_LENGTH 2
extern uint16_t cmd_lock_reg[CMD_LOCK_LENGTH];

#define CMD_PO_RES_OFFSET 2
#define CMD_PO_RES_LENGTH 1
extern uint16_t cmd_potentiometer_res[CMD_PO_RES_LENGTH];

#define CMD_PWRDN_DAC_OFFSET 3
#define CMD_PWRDN_DAC_LENGTH 2
extern uint16_t cmd_pwrdn_dac[CMD_PWRDN_DAC_LENGTH];

#define CMD_VCC_EN_OFFSET 5
#define CMD_VCC_EN_LENGTH 1
extern uint16_t cmd_vcc_en[CMD_VCC_EN_LENGTH];

#define CMD_MAX7312_OFFSET 6
#define CMD_MAX7312_LENGTH 2
extern uint16_t cmd_max7312_en[CMD_MAX7312_LENGTH];

#define CMD_CUR_DAC_OFFSET 8
#define CMD_CUR_DAC_LENGTH 32
extern uint16_t cmd_cur_dac[CMD_CUR_DAC_LENGTH];

#define CMD_EEP_OFFSET 40
#define CMD_EEP_ADDR_LENGTH 2
#define CMD_EEP_LENG_LENGTH 2
#define CMD_EEP_RDWR_LENGTH 2
#define CMD_EEP_DATA_LENGTH 8
#define CMD_EEP_DATA_OFFSET (CMD_EEP_ADDR_LENGTH+CMD_EEP_LENG_LENGTH+CMD_EEP_RDWR_LENGTH)
#define CMD_EEP_LENGTH (CMD_EEP_ADDR_LENGTH+CMD_EEP_LENG_LENGTH+CMD_EEP_RDWR_LENGTH+CMD_EEP_DATA_LENGTH)
extern uint16_t cmd_eep[CMD_EEP_LENGTH];
extern uint16_t cmd_rd_eep[CMD_EEP_DATA_LENGTH];

#define CMD_MOBUS_HOLD_REG_LENGTH (CMD_EEP_OFFSET + CMD_EEP_LENGTH)

#define CMD_TSAMP_OFFSET 4
#define CMD_TSAMP_LENGTH 2

#define CMD_ISAMP_OFFSET 8
#define CMD_ISAMP_LENGTH 32

#define CMD_MSAMP_OFFSET 40
#define CMD_MSAMP_LENGTH 32

#define CMD_VSAMP_OFFSET 72
#define CMD_VSAMP_LENGTH 32

#define CMD_EEP_RD_OFFSET 104
#define CMD_EEP_RD_LENGTH 8
#define CMD_MOBUS_INPUT_REG_LENGTH (CMD_EEP_RD_OFFSET+CMD_EEP_RD_LENGTH)

extern uint16_t cmd_adc_iout[];
extern uint16_t cmd_adc_mout[];
extern uint16_t cmd_adc_vout[];
extern uint16_t cmd_adc_tout[];



extern void cmd_stage_fast_proc(void);
extern void cmd_stage_slow_proc(void);

#endif

/*(C) COPYRIGHT 2013  *****END OF FILE****/
