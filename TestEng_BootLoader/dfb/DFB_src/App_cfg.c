/**
  ******************************************************************************
  * @file    App_cfg.c  burn in system
  * @author  h&h
  * @version 
  * @date    
* @brief  
  ******************************************************************************
**/ 

#include "include.h"


#define APP_CFG_GPIO_NUM 10
#define APP_CFG_ADDR_NUM 6
const App_Cfg_GpioPin_st App_Cfg_GpioPin_cast[APP_CFG_GPIO_NUM] =
{
    {
        GPIOA,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA, 
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA, 
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA, 
        GPIO_UART_RX,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA, 
        GPIO_UART_TX,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA, 
        GPIO_UART_RX_EN,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA, 
        GPIO_UART_TX_EN,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },

};

App_Cfg_Gpio_st const App_Cfg_Gpio_cst = 
{
    APP_CFG_GPIO_NUM,
    APP_CFG_ADDR_NUM,
    &App_Cfg_GpioPin_cast[0],
};



#define APP_CFG_UART_NUM 1
const App_Cfg_UartPort_st App_Cfg_UartPort_Cast[APP_CFG_UART_NUM] = 
{
    {
        USART1,
        {
            19200,
            USART_WordLength_9b,
            USART_StopBits_1,
            USART_Parity_Even,
            USART_Mode_Rx | USART_Mode_Tx,
            USART_HardwareFlowControl_None
        }
    },
};


const App_Cfg_Uart_st App_Cfg_Uart_cst = 
{
    APP_CFG_UART_NUM,
    &App_Cfg_UartPort_Cast[0],
};



/*place at the beginning of Prolog*/
const App_Cfg_st App_Cfg_cst =
{
    "FL0001A00",
    "20181013",
    "HuangHe",
    &App_Cfg_Gpio_cst,
    &App_Cfg_Uart_cst,
    (const App_Cfg_Epilog_tst *)APP_CFG_EPILOG_BASE_ADDR,
};


/*Place at the beginning of Epilog   APP_CFG_EPILOG_BASE_ADDR*/
App_Cfg_Epilog_tst App_Cfg_Epilog_st= {"HuangHe"};

/******************* (C) COPYRIGHT 2018 *****END OF FILE****/
 


