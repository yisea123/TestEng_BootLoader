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

#if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)

#include "BootApp_Cfg.h"
#include "BootApp_Cfg_Board.h"
#include "BootApp_Type.h"
#include "BootApp_Priv.h"



uint8_t BootApp_Debug_u8 = 0;

const BootApp_GpioPin_tst BootApp_App_GpioPin_cast[BOOTAPP_APP_GPIO_NUM] =
{
    {
        &BootApp_Debug_u8,
        GPIO_BOARD_ADDR,
        (uint8_t)0,
    },
    {
        &BootApp_Debug_u8,
        GPIO_BOARD_ADDR,
        (uint8_t)0,
    },
    {
        &BootApp_Debug_u8,
        GPIO_BOARD_ADDR,
        (uint8_t)0,
    },
    {
        &BootApp_Debug_u8,
        GPIO_BOARD_ADDR,
        (uint8_t)0,
    },
    {
        &BootApp_Debug_u8,
        GPIO_BOARD_ADDR,
        (uint8_t)0,
    },
    {
        &BootApp_Debug_u8,
        GPIO_BOARD_ADDR,
        (uint8_t)0,
    },

};

const BootApp_UartPort_tst BootApp_UartPort_cast[BOOTAPP_APP_UART_NUM] =
{
    {
        &BootApp_Debug_u8,
        0,
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


void GPIO_Init(BootApp_GPIO_TypeDef * GPIO_TypeDef, const BootApp_GPIO_InitTypeDef * GPIO_InitTypeDef)
{
    (void)*GPIO_TypeDef;
    (void)*GPIO_InitTypeDef;
}

void USART_Init(BootApp_USART_TypeDef * USART_TypeDef, const BootApp_USART_InitTypeDef * USART_InitTypeDef)
{
    (void)*USART_TypeDef;
    (void)*USART_InitTypeDef;
}


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


