/**
  ******************************************************************************
  * @file    Boot_GetApp_Data.h  burn in system
  * @author  h&h
  * @version 
  * @date    
* @brief  
  ******************************************************************************
**/ 

#ifndef _BOOT_GETAPP_DATA_H
#define _BOOT_GETAPP_DATA_H

typedef enum
{
    APP_NOT_EXIST,
    APP_PROLOG_EPILOG_ADDR_ERROR,
    APP_NOT_COMPLETE,
    APP_OK
}App_St_ten;

extern uint8_t Boot_GetApp_init(void);
extern uint8_t Boot_GetApp_HardVersion(uint8_t len, uint8_t * data);
extern uint8_t Boot_GetApp_FwVersion(uint8_t len, uint8_t * data);
extern uint8_t Boot_GetApp_Cfg_Gpio(const App_Cfg_Gpio_st * gpio_cfg);
extern uint8_t Boot_GetApp_Cfg_Uart(const App_Cfg_Uart_st * uart_cfg);




#endif



/******************* (C) COPYRIGHT 2018 *****END OF FILE****/


