/**
  ******************************************************************************
  * @file    Boot_GetApp_Data.c  burn in system
  * @author  h&h
  * @version 
  * @date    
* @brief  
  ******************************************************************************
**/ 

#include "include.h"


#define App_Cfg_Addr_Prolog_Validate(a)  ( ((a)>=(void *)APP_CFG_PROLOG_BASE_ADDR) && ((a)<=(void *)APP_CFG_PROLOG_END_ADDR) )
#define App_Cfg_Addr_Epilog_Validate(a)  ( ((a)>=(void *)APP_CFG_EPILOG_BASE_ADDR) && ((a)<=(void *)APP_CFG_EPILOG_END_ADDR) )

const uint8_t * App_HardVersion;
const uint8_t * App_FwVersion;
const uint8_t * App_Prolog_Signature;
const App_Cfg_Gpio_st * App_Cfg_Gpio_cpst;
const App_Cfg_Uart_st * App_Cfg_Uart_cpst;
const App_Cfg_Epilog_st * App_Cfg_Epilog_cpst;
const uint8_t * App_Epilog_Signature;

typedef enum
{
    BOOT_GETAPP_NOT_INI,
    BOOT_GETAPP_INI
}Boot_GetApp_init_ten;

static Boot_GetApp_init_ten Boot_GetApp_init_en = BOOT_GETAPP_NOT_INI;

uint8_t Boot_GetApp_init(void)
{
    const App_Cfg_st * const Boot_Cfg_BaseAddr = (const App_Cfg_st *)APP_CFG_PROLOG_BASE_ADDR;
    App_St_ten App_St_en;
    uint8_t i = 0;
    
    App_HardVersion        = Boot_Cfg_BaseAddr->app_cfg_hardversion;
    App_FwVersion          = Boot_Cfg_BaseAddr->app_cfg_fwversion;
    App_Prolog_Signature   = Boot_Cfg_BaseAddr->app_cfg_signature;
    App_Cfg_Gpio_cpst      = Boot_Cfg_BaseAddr->app_cfg_gpio_cpcst;
    App_Cfg_Uart_cpst      = Boot_Cfg_BaseAddr->app_cfg_uart_cpcst;
    App_Cfg_Epilog_cpst    = Boot_Cfg_BaseAddr->app_cfg_epilog_cpcst;

    
    if( (App_HardVersion         == (void *) 0)  ||
        (App_FwVersion           == (void *) 0)  ||
        (App_Prolog_Signature    == (void *) 0)  ||
        (App_Cfg_Gpio_cpst       == (void *) 0)  ||
        (App_Cfg_Uart_cpst       == (void *) 0)  ||
        (App_Cfg_Epilog_cpst     == (void *) 0)  )
    {
        App_St_en = APP_NOT_EXIST;
        return App_St_en;
    }


    if( (!App_Cfg_Addr_Prolog_Validate(App_HardVersion))         ||
        (!App_Cfg_Addr_Prolog_Validate(App_FwVersion))           ||
        (!App_Cfg_Addr_Prolog_Validate(App_Prolog_Signature))    ||
        (!App_Cfg_Addr_Prolog_Validate(App_Cfg_Gpio_cpst))       ||
        (!App_Cfg_Addr_Prolog_Validate(App_Cfg_Uart_cpst))       ||
        (!App_Cfg_Addr_Epilog_Validate(App_Cfg_Epilog_cpst)) )
    {
        App_St_en = APP_PROLOG_EPILOG_ADDR_ERROR;
        return App_St_en;
    }
    
    App_Epilog_Signature = App_Cfg_Epilog_cpst->app_cfg_epilog_signature;

    for(i=0; i<16; i++)
    {
        if( *(App_Prolog_Signature + i) !=  *(App_Epilog_Signature + i))
        {
            App_St_en = APP_NOT_COMPLETE;
            return App_St_en;
        }
    }

    Boot_GetApp_init_en = BOOT_GETAPP_INI;
    return APP_OK;
}



uint8_t Boot_GetApp_HardVersion(uint8_t len, uint8_t * data)
{
    uint8_t i;
    if(Boot_GetApp_init_en != BOOT_GETAPP_INI)
    {
        return ERROR;
    }
    if(len !=16)
    {
        return ERROR;
    }
    for(i=0; i<16; i++)
    {
        *(data + i) = *(App_HardVersion + i);
    }
    return SUCCESS;
}

uint8_t Boot_GetApp_FwVersion(uint8_t len, uint8_t * data)
{
    uint8_t i;
    if(Boot_GetApp_init_en != BOOT_GETAPP_INI)
    {
        return ERROR;
    }
    if(len !=16)
    {
        return ERROR;
    }
    for(i=0; i<16; i++)
    {
        *(data + i) = *(App_FwVersion + i);
    }
    return SUCCESS;
}

uint8_t Boot_GetApp_Cfg_Gpio(const App_Cfg_Gpio_st * gpio_cfg)
{
    if(Boot_GetApp_init_en != BOOT_GETAPP_INI)
    {
        return ERROR;
    }

    gpio_cfg = App_Cfg_Gpio_cpst;
    gpio_cfg = gpio_cfg;
    return SUCCESS;
}

uint8_t Boot_GetApp_Cfg_Uart(const App_Cfg_Uart_st * uart_cfg)
{
    if(Boot_GetApp_init_en != BOOT_GETAPP_INI)
    {
        return ERROR;
    }

    uart_cfg = App_Cfg_Uart_cpst;
    uart_cfg = uart_cfg;
    return SUCCESS;
}


/******************* (C) COPYRIGHT 2018 *****END OF FILE****/
 



