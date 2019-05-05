/**
  ******************************************************************************
  * @file    io_functions.h  burn in system
  * @author  h&h
  * @version 
  * @date    
  * @brief   
  ******************************************************************************
**/ 
#ifndef _IO_FUNCTIONS_H
#define _IO_FUNCTIONS_H

typedef enum
{
    GPIO_WRITE,
    GPIO_READ,
}GPIO_Operation_ten;

extern uint8_t Get_board_address(void);
extern inline void Disable_usart_rx(void);
extern inline void Enable_usart_rx(void);
extern inline void Disable_usart_tx(void);
extern inline void Enable_usart_tx(void);

#endif
/******************* (C) COPYRIGHT 2018 *****END OF FILE****/
