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


static uint8_t BootApp_IoFunction(BootApp_GPIO_Function_ten gpio_func_en,
                                       BootApp_GPIO_Operation_ten gpio_operation_en,
                                       uint8_t BitVal)
{
    uint8_t ret;
    uint8_t i;
    uint8_t pin_st_u8 = 0;
    uint8_t gpio_pin_num_u8;

    const BootApp_Gpio_tst * gpio_cfg = (void *) 0;
    const BootApp_GpioPin_tst * gpio_pin_cpast = (void *) 0;
    ret = BootApp_Get_Cfg_Gpio(&gpio_cfg);
    if(ret)
    {
        gpio_pin_num_u8 = gpio_cfg->app_cfg_gpio_num;
        gpio_pin_cpast = gpio_cfg->app_cfg_gpio_init_past;

        if( (gpio_pin_num_u8 == 0) || (gpio_pin_cpast == (void *)0) )
            return 0;

        for(i=0; i<gpio_pin_num_u8; i++)
        {
            if( gpio_pin_cpast[i].app_cfg_gpio_func_en == gpio_func_en)
            {
                if(gpio_operation_en == GPIO_WRITE)
                {
                    #if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
                    BootApp_GPIO_WriteBit( gpio_pin_cpast[i].app_cfg_gpio,
                                   0,
                                   BitVal );
                    #else
                    BootApp_GPIO_WriteBit( gpio_pin_cpast[i].app_cfg_gpio,
                                   gpio_pin_cpast[i].app_cfg_gpio_pin_st.GPIO_Pin,
                                   BitVal );
                    #endif
                }
                else if(gpio_operation_en == GPIO_READ)
                {
                    #if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
                    pin_st_u8 = BootApp_GPIO_ReadInputDataBit( gpio_pin_cpast[i].app_cfg_gpio,
                                                       0);
                    #else
                    pin_st_u8 = BootApp_GPIO_ReadInputDataBit( gpio_pin_cpast[i].app_cfg_gpio,
                                                       gpio_pin_cpast[i].app_cfg_gpio_pin_st.GPIO_Pin);
                    #endif

                }
                else
                {

                }
            }
            else
            {

            }

        }
    }
    else
    {
    }

    return pin_st_u8;
}




uint8_t BootApp_Get_board_address(void)
{
    uint8_t ret;
    uint8_t i;
    uint8_t addr = 0;
    uint8_t pin_st_u8;
    uint8_t addr_pin_num_u8;

    const BootApp_Gpio_tst * gpio_cfg = (void *) 0;
    const BootApp_GpioPin_tst * gpio_pin_cpast = (void *) 0;
    ret = BootApp_Get_Cfg_Gpio(&gpio_cfg);
    if(ret)
    {
        addr_pin_num_u8 = gpio_cfg->app_cfg_addr_num;
        gpio_pin_cpast = gpio_cfg->app_cfg_gpio_init_past;

        if( (addr_pin_num_u8 == 0) || (gpio_pin_cpast == (void *)0) )
            return 0;

        for(i=0; i<addr_pin_num_u8; i++)
        {
            if(gpio_pin_cpast[i].app_cfg_gpio_func_en == GPIO_BOARD_ADDR)
            {
                #if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
                pin_st_u8 = BootApp_GPIO_ReadInputDataBit( gpio_pin_cpast[i].app_cfg_gpio,
                                                       0);
                #else
                pin_st_u8 = BootApp_GPIO_ReadInputDataBit( gpio_pin_cpast[i].app_cfg_gpio,
                                                       gpio_pin_cpast[i].app_cfg_gpio_pin_st.GPIO_Pin);
                #endif
                addr |= (pin_st_u8<<i);
            }
            else
            {

            }

        }

    }
    return addr;
}

void BootApp_Disable_usart_rx(void)
{
    BootApp_IoFunction(GPIO_UART_RX_EN, GPIO_WRITE, 1);
}

void BootApp_Enable_usart_rx(void)
{
    BootApp_IoFunction(GPIO_UART_RX_EN, GPIO_WRITE, 0);
}

void BootApp_Disable_usart_tx(void)
{
    BootApp_IoFunction(GPIO_UART_RX_EN, GPIO_WRITE, 1);
}

void BootApp_Enable_usart_tx(void)
{
    BootApp_IoFunction(GPIO_UART_RX_EN, GPIO_WRITE, 0);
}

void BootApp_Disable_run_led(void)
{
   BootApp_IoFunction(GPIO_RUN_LED, GPIO_WRITE, 0);
}

void BootApp_Enable_run_led(void)
{
   BootApp_IoFunction(GPIO_RUN_LED, GPIO_WRITE, 0);
}

void BootApp_Disable_err_led(void)
{
   BootApp_IoFunction(GPIO_ERR_LED, GPIO_WRITE, 0);
}

void BootApp_Enable_err_led(void)
{
   BootApp_IoFunction(GPIO_ERR_LED, GPIO_WRITE, 0);
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



