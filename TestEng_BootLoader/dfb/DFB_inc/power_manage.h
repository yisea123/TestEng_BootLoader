/**
  ******************************************************************************
  * @file    power_manage.h  burn in system
  * @author  h&h
  * @version 
  * @date    
  * @brief   
  ******************************************************************************
**/ 
#ifndef _power_manage_H
#define _power_manage_H

extern volatile uint16_t globle_flag_power_status;
extern volatile uint16_t globle_flag_dfb_current_status;
extern volatile uint16_t globle_flag_dfb_voltage_status;

#define P_N_5V_ON 0x1
#define CURRENT_SOURCE_3V3_ON 0x2
#define ALL_2974_CH_ON 0x4

#define DFB_CH1_CURRENT_ON 0x1
#define DFB_CH2_CURRENT_ON 0x2
#define DFB_CH3_CURRENT_ON 0x4
#define DFB_CH4_CURRENT_ON 0x8
#define DFB_CH5_CURRENT_ON 0x10
#define DFB_CH6_CURRENT_ON 0x20
#define DFB_CH7_CURRENT_ON 0x40
#define DFB_CH8_CURRENT_ON 0x80
#define DFB_ALL_CH_CURRENT_ON 0xFF

#define DFB_CH1_VOLTAGE_ON 0x01
#define DFB_CH2_VOLTAGE_ON 0x02
#define DFB_CH3_VOLTAGE_ON 0x04
#define DFB_CH4_VOLTAGE_ON 0x08
#define DFB_CH5_VOLTAGE_ON 0x10
#define DFB_CH6_VOLTAGE_ON 0x20
#define DFB_CH7_VOLTAGE_ON 0x40
#define DFB_CH8_VOLTAGE_ON 0x80
#define DFB_ALL_CH_VOLTAGE_ON 0xFF




void all_sys_power_on(void);
void all_sys_power_off(void);

uint8_t check_power_status(uint16_t power_kind);
void set_power_status(uint16_t power_kind);
void clear_power_status(uint16_t power_kind);

uint8_t check_current_source_status(uint16_t dfb_current_ch);
void set_current_source_status(uint16_t dfb_current_ch);
void clear_current_source_status(uint16_t dfb_current_ch);

uint8_t check_voltage_source_status(uint16_t dfb_voltage_ch);
void set_voltage_source_status(uint16_t dfb_voltage_ch);
void clear_voltage_source_status(uint16_t dfb_voltage_ch);

#endif
/******************* (C) COPYRIGHT 2018 *****END OF FILE****/