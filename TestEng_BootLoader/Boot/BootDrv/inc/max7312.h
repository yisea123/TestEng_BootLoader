/**
  ******************************************************************************
  * @file    max7312.c  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   max7312 driver
  ******************************************************************************
**/
#ifndef _MAX7312_H
#define _MAX7312_H
extern void Max7312_init(void);
extern uint8_t Max7312_Get_init_st(void);
extern uint8_t Max7312_Set_Port1_IO(uint8_t dev_id, uint8_t io);
extern uint8_t Max7312_Set_Port2_IO(uint8_t dev_id, uint8_t io);
extern uint8_t Max7312_Set_Port1_HiLo(uint8_t dev_id, uint8_t io_st);
extern uint8_t Max7312_Set_Port2_HiLo(uint8_t dev_id, uint8_t io_st);
extern uint8_t Max7312_Set_All_Port_Output(uint8_t dev_id);
extern uint8_t Max7312_Set_All_Port_Input(uint8_t dev_id);
extern uint8_t Max7312_Set_All_Port_Hi(uint8_t dev_id);
extern uint8_t Max7312_Set_All_Port_Lo(uint8_t dev_id);

//#define DEBUG_MAX7312
#ifdef DEBUG_MAX7312
extern void test_max7312(void);
#endif

#endif
/******************* (C) COPYRIGHT 2018 *****END OF FILE****/