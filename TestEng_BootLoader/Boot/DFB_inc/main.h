/**
  ******************************************************************************
  * @file main.h
  * @author  h&h
  * @version  
  * @date  
  * @brief  Header for main.c
  ******************************************************************************
  * @copy
  *
  */
#ifndef _main_H
#define _main_H

#define RESET_STATE       0x00
#define INITIALIZE_STATE  0x01
#define READY_STATE       0x02
#define FAULT_STATE       0x03
#define ENGINEERING_STATE 0x04

extern void set_module_state(uint8_t newstate);
#endif
/******************* (C) COPYRIGHT 2018 *****END OF FILE****/