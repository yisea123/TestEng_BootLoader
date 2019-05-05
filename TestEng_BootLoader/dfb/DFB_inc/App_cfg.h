/**
  ******************************************************************************
  * @file    App_cfg.h  burn in system
  * @author  h&h
  * @version 
  * @date    
* @brief  
  ******************************************************************************
**/ 

#ifndef _APP_CFG_H
#define _APP_CFG_H

#define APP_CFG_PROLOG_BASE_ADDR 0x0800C000
#define APP_CFG_PROLOG_END_ADDR  0x0800C3FF
#define APP_CFG_PROLOG_SIZE      (APP_CFG_PROLOG_END_ADDR - APP_CFG_PROLOG_BASE_ADDR + 1)


#define APP_CFG_EPILOG_BASE_ADDR 0x0801FC00
#define APP_CFG_EPILOG_END_ADDR  0x0801FFFF
#define APP_CFG_EPILOG_SIZE      (APP_CFG_EPILOG_BASE_ADDR - APP_CFG_EPILOG_END_ADDR + 1)

typedef enum
{
    GPIO_BOARD_ADDR,
    GPIO_UART_RX,
    GPIO_UART_TX,
    GPIO_UART_RX_EN,
    GPIO_UART_TX_EN,
    
}GPIO_Function_en;
typedef struct
{
    GPIO_TypeDef *        app_cfg_gpio;
    GPIO_Function_en      app_cfg_gpio_func;
    GPIO_InitTypeDef      app_cfg_gpio_pin_st;
}App_Cfg_GpioPin_st;

typedef struct
{
    uint16_t  app_cfg_gpio_num;
    uint16_t  app_cfg_addr_num;
    const App_Cfg_GpioPin_st *  app_cfg_gpio_init_past;
}App_Cfg_Gpio_st;


typedef struct
{
    USART_TypeDef *       app_cfg_uart;
    USART_InitTypeDef     app_cfg_uart_port_st;
}App_Cfg_UartPort_st;
typedef struct
{
    uint16_t              app_cfg_uart_num;
    const App_Cfg_UartPort_st * app_cfg_uart_init_past;
}App_Cfg_Uart_st;



typedef struct
{
    uint8_t               app_cfg_epilog_signature[16];
}App_Cfg_Epilog_tst;

typedef struct
{
    uint8_t                app_cfg_hardversion[16];
    uint8_t                app_cfg_fwversion[16];
    uint8_t                app_cfg_signature[16];
    const App_Cfg_Gpio_st * const app_cfg_gpio_cpcst;
    const App_Cfg_Uart_st * const app_cfg_uart_cpcst;
    const App_Cfg_Epilog_tst * const app_cfg_epilog_cpcst;
}App_Cfg_st;


extern void App_Cfg_init(void);
extern App_Cfg_Gpio_st App_Cfg_Gpio_get_init(void);


#endif

/******************* (C) COPYRIGHT 2018 *****END OF FILE****/
 
