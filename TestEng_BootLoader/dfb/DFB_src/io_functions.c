/**
  ******************************************************************************
  * @file    io_functions.c  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   io functions
  ******************************************************************************
**/ 

#include "include.h"


static uint8_t Io_functions(GPIO_Function_en gpio_func_en, GPIO_Operation_ten gpio_operation_en, uint8_t BitVal)
{
    uint8_t ret;
    uint8_t i;
    uint8_t pin_st_u8 = 0;
    uint8_t gpio_pin_num_u8;
    const App_Cfg_GpioPin_st * gpio_pin_cpst;
    
    const App_Cfg_Gpio_st * gpio_cfg = (void *)0;
    
    ret = Boot_GetApp_Cfg_Gpio(gpio_cfg);

    if(ret == ERROR)
        return 0;

    gpio_pin_num_u8 = gpio_cfg->app_cfg_gpio_num;
    gpio_pin_cpst = gpio_cfg->app_cfg_gpio_init_past;

    if( (gpio_pin_num_u8 == 0) || (gpio_pin_cpst == (void *)0) )
        return 0;

    for(i=0; i<gpio_pin_num_u8; i++)
    {
        if( (gpio_pin_cpst + i)->app_cfg_gpio_func == gpio_func_en)
        {
            if(gpio_operation_en == GPIO_WRITE)
            {
                GPIO_WriteBit((gpio_pin_cpst + i)->app_cfg_gpio, (gpio_pin_cpst + i)->app_cfg_gpio_pin_st.GPIO_Pin, BitVal);
            }
            else if(gpio_operation_en == GPIO_READ)
            {
                pin_st_u8 = GPIO_ReadInputDataBit((gpio_pin_cpst + i)->app_cfg_gpio, (gpio_pin_cpst + i)->app_cfg_gpio_pin_st.GPIO_Pin);
            }
            else
            {

            }
        }
        else
        {

        }
        
    }
    return pin_st_u8;
}

inline void Disable_usart_rx(void)
{
    Io_functions(GPIO_UART_RX_EN, GPIO_WRITE, 1);
}

inline void Enable_usart_rx(void)
{
    Io_functions(GPIO_UART_RX_EN, GPIO_WRITE, 0);
}

inline void Disable_usart_tx(void)
{
    Io_functions(GPIO_UART_RX_EN, GPIO_WRITE, 1);
}

inline void Enable_usart_tx(void)
{
    Io_functions(GPIO_UART_RX_EN, GPIO_WRITE, 0);
}

/*get board address according to switches*/
uint8_t Get_board_address(void)
{
    uint8_t ret;
    uint8_t i;
    uint8_t addr;
    uint8_t pin_st_u8;
    uint8_t gpio_pin_num_u8;
    const App_Cfg_GpioPin_st * gpio_pin_cpst;
    
    const App_Cfg_Gpio_st * gpio_cfg = (void *)0;
    
    ret = Boot_GetApp_Cfg_Gpio(gpio_cfg);

    if(ret == ERROR)
        return 0;

    gpio_pin_num_u8 = gpio_cfg->app_cfg_gpio_num;
    gpio_pin_cpst = gpio_cfg->app_cfg_gpio_init_past;

    if( (gpio_pin_num_u8 == 0) || (gpio_pin_cpst == (void *)0) )
        return 0;

    for(i=0; i<gpio_pin_num_u8; i++)
    {
        if((gpio_pin_cpst + i)->app_cfg_gpio_func == GPIO_BOARD_ADDR)
        {
            pin_st_u8 = GPIO_ReadInputDataBit((gpio_pin_cpst + i)->app_cfg_gpio, (gpio_pin_cpst + i)->app_cfg_gpio_pin_st.GPIO_Pin);
            addr |= (pin_st_u8<<i);
        }
        else
        {

        }
        
    }
    return addr;
}


/*run led control*/
inline void Disable_run_led(void)
{
   GPIOC->BSRR |= GPIO_Pin_4;
}

inline void Enable_run_led(void)
{
   GPIOC->BRR |= GPIO_Pin_4;
}

/*error led control*/
inline void Disable_err_led(void)
{
   GPIOC->BSRR |= GPIO_Pin_5;
}

inline void Enable_err_led(void)
{
   GPIOC->BRR |= GPIO_Pin_5;
}



/******************* (C) COPYRIGHT 2018 *****END OF FILE****/