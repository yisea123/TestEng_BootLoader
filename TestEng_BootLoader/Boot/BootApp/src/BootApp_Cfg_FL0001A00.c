/*<BASDKey>
 **********************************************************************************************************************
 *
 * COPYRIGHT RESERVED, FeedLiTech, 2019. All rights reserved.
 * The reproduction, distribution and utilization of this document as well as the communication of its contents to
 * others without explicit authorization is prohibited. Offenders will be held liable for the payment of damages.
 * All rights reserved in the event of the grant of a patent, utility model or design.
 *
 **********************************************************************************************************************
</BASDKey>*/
#include "BootApp_Cfg.h"
#include "BootApp_Cfg_Board.h"
#include "BootApp_Type.h"
#include "BootApp_Priv.h"

#if (BOOTAPP_BOARD_SUPPORT == TestEng_FL0001A00)

const BootApp_GpioPin_tst BootApp_App_GpioPin_cast[BOOTAPP_APP_GPIO_NUM] =
{
    {
        GPIOB,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_0, GPIO_Speed_50MHz,GPIO_Mode_IPD
        },
    },
    {
        GPIOB,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_1, GPIO_Speed_50MHz,GPIO_Mode_IPD
        },
    },
    {
        GPIOB,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_5, GPIO_Speed_50MHz,GPIO_Mode_IPD
        },
    },
    {
        GPIOB,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_8, GPIO_Speed_50MHz,GPIO_Mode_IPD
        },
    },
    {
        GPIOB,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_9, GPIO_Speed_50MHz,GPIO_Mode_IPD
        },
    },
    {
        GPIOB,
        GPIO_BOARD_ADDR,
        {
            GPIO_Pin_10, GPIO_Speed_50MHz,GPIO_Mode_IPD
        },
    },
    {
        GPIOA,
        GPIO_UART_RX,
        {
            GPIO_Pin_10, GPIO_Speed_50MHz,GPIO_Mode_IN_FLOATING
        },
    },
    {
        GPIOA,
        GPIO_UART_TX,
        {
            GPIO_Pin_9, GPIO_Speed_50MHz,GPIO_Mode_AF_PP
        },
    },
    {
        GPIOA,
        GPIO_UART_RX_EN,
        {
            GPIO_Pin_11, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOA,
        GPIO_UART_TX_EN,
        {
            GPIO_Pin_12, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOB,
        GPIO_ERR_LED,
        {
            GPIO_Pin_11, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },
    {
        GPIOC,
        GPIO_RUN_LED,
        {
            GPIO_Pin_15, GPIO_Speed_50MHz,GPIO_Mode_Out_PP
        },
    },

};

const BootApp_UartPort_tst BootApp_UartPort_cast[BOOTAPP_APP_UART_NUM] =
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

const BootApp_Prolog_tst BootApp_App_Prolog_st =
{
    "FL0001A00",
    "20181013",
    "HuangHeFeedLi",
};

const BootApp_Epilog_tst BootApp_Epilog_st =
{
    "FL0001A00",
    "20181013",
    "HuangHeFeedLi"
};

#endif
/*<BASDKey>
 ***********************************************************************************************************************
 * $History___:
 *
 * U1.0.0;      20.05.2019 new created for BootLoader he.huang@feedlitech.com
 *
 * $
 ***********************************************************************************************************************
</BASDKey>*/


