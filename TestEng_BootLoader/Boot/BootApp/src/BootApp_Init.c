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
#include "BootApp.h"
static BootApp_GetApp_init_ten BootApp_GetApp_init_en = BOOTAPP_GETAPP_NOT_INI;
static void BootApp_Gpio_Init(void);
static void BootApp_Uart_Init(void);

uint8_t slave_addr = 0;

void BootApp_Prog_init(void)
{
    /*init external devices and communication*/
    if( (void *)0 != BootApp_App_Cfg_cpcst )
    {
        BootApp_GetApp_init_en = BOOTAPP_GETAPP_INI;
    }
    else
    {
        BootApp_GetApp_init_en = BOOTAPP_GETAPP_NOT_INI;
    }

    BootApp_Gpio_Init();
    BootApp_Uart_Init();
    BootApp_Enable_usart_rx();
    BootApp_Disable_usart_tx();
    BootApp_Enter_Schm();
#if (BOOTAPP_BOARD_SUPPORT != TestEng_Debug)
    slave_addr = BootApp_Get_board_address();
    eMBInit(MB_RTU, slave_addr, 0x1, 19200, MB_PAR_EVEN);
    eMBEnable(); 
#endif
    BootApp_Exit_Schm();

}


uint8_t BootApp_Get_Cfg_Gpio(const BootApp_Gpio_tst ** gpio_cfg)
{
    uint8_t ret;
    if(BOOTAPP_GETAPP_INI == BootApp_GetApp_init_en)
    {
        *gpio_cfg = BootApp_App_Cfg_cpcst->app_cfg_gpio_cpcst;
        if((void *)0 != gpio_cfg)
        {
            ret = 1;
        }
        else
        {
            ret = 0;
        }
    }
    else
    {
        ret = 0;
    }
    return ret;
}

uint8_t BootApp_Get_Cfg_Uart(const BootApp_Uart_tst ** uart_cfg)
{
    uint8_t ret;
    if(BOOTAPP_GETAPP_INI == BootApp_GetApp_init_en)
    {
        *uart_cfg = BootApp_App_Cfg_cpcst->app_cfg_uart_cpcst;
        if((void *)0 != uart_cfg)
        {
            ret = 1;
        }
        else
        {
            ret = 0;
        }

    }
    else
    {
        ret = 0;
    }
    return ret;
}



void BootApp_Gpio_Init(void)
{
    uint8_t ret;
    uint8_t i;
    const BootApp_Gpio_tst * gpio_cfg = (void *) 0;
    BootApp_GPIO_TypeDef * GPIO_TypeDef;
    BootApp_GPIO_InitTypeDef * GPIO_InitTypeDef;


    ret = BootApp_Get_Cfg_Gpio(&gpio_cfg);
    if(ret)
    {
        for(i=0; i<gpio_cfg->app_cfg_gpio_num; i++)
        {
            /*copy from flash*/
            GPIO_TypeDef = gpio_cfg->app_cfg_gpio_init_past[i].app_cfg_gpio;
            GPIO_InitTypeDef = &gpio_cfg->app_cfg_gpio_init_past[i].app_cfg_gpio_pin_st;
            
            BootApp_GPIO_Init( GPIO_TypeDef, GPIO_InitTypeDef);
        }
    }
    else
    {
    }
}

void BootApp_Uart_Init(void)
{
    uint8_t ret;
    uint8_t i;
    const BootApp_Uart_tst * uart_cfg = (void *) 0;
    BootApp_USART_TypeDef * USART_TypeDef;
    BootApp_USART_InitTypeDef * USART_InitTypeDef;

    ret = BootApp_Get_Cfg_Uart(&uart_cfg);
    if(ret)
    {
        for(i=0; i<uart_cfg->app_cfg_uart_num; i++)
        {
            /*copy from flash*/
            USART_TypeDef = uart_cfg->app_cfg_uart_init_past[i].app_cfg_uart;
            USART_InitTypeDef = &uart_cfg->app_cfg_uart_init_past[i].app_cfg_uart_port_st;
            
            BootApp_UART_Init( USART_TypeDef, USART_InitTypeDef);
            BootApp_USART_Cmd( USART_TypeDef, 1);
        }
    }
    else
    {
    }
}

void BootApp_Get_Uart(BootApp_USART_TypeDef ** USART_TypeDef)
{
    uint8_t ret;
    uint8_t i;
    const BootApp_Uart_tst * uart_cfg = (void *) 0;

    ret = BootApp_Get_Cfg_Uart(&uart_cfg);
    if(ret)
    {

        for(i=0; i<uart_cfg->app_cfg_uart_num; i++)
        {
            /*copy from flash*/
            *(USART_TypeDef + i) = uart_cfg->app_cfg_uart_init_past[i].app_cfg_uart;
        }
    }
    else
    {
    }

}


/*<BASDKey>
 ***********************************************************************************************************************
 * $History___:
 *
 * U1.0.0;      20.05.2019 new created for BootLoader he.huang@feedlitech.com
 *
 * $
 ***********************************************************************************************************************
</BASDKey>*/
