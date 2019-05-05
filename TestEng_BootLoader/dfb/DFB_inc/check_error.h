/**
  ******************************************************************************
  * @file check_error.h
  * @author  h&h
  * @version  
  * @date  
  * @brief  Header for check_error.c
  ******************************************************************************
  * @copy
  *
  */
#ifndef _CHECK_ERROR_H
#define _CHECK_ERROR_H

//#define DFB_CURRENT_MON_ENABLE 
//#define MPD_VOLTAGE_MON_ENABLE 
//#define THERMO_VOLTAGE_MON_ENABLE 
//#define VOUT_VOLTAGE_MON_ENABLE
#define DFB_CURRENT_ERROR 0x0
#define DFB_MPD_ERROR 0x1
#define DFB_VOLTAGE_ERROR 0x2

uint8_t check_error(uint16_t *data_buf,
                           uint8_t error_type,
                           uint8_t datanum, 
                           uint16_t max_safe_value, 
                           uint16_t min_safe_value);


#endif
/*(C) COPYRIGHT 2013  *****END OF FILE****/
