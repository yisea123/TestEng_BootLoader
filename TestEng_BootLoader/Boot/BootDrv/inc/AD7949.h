/**
  ******************************************************************************
  * @file    AD7949.h  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   AD7949 driver
  ******************************************************************************
**/ 


#ifndef _AD7949_H_
#define _AD7949_H_

#include "stm32f10x.h"

extern void AD7949_init(void);
extern void AD7949_read_all_data(void);

#define ISAMP_MAX_CH   32
#define MPDSAMP_MAX_CH 32
#define VSAMP_MAX_CH   32
#define THERMO0_MAX_CH 1
#define THERMO1_MAX_CH 1

#define THERMO_1 0
#define THERMO_2 1

extern uint8_t AD7949_read_ISAMP_ch(uint16_t ch, uint16_t *rdata);
extern uint8_t AD7949_read_MPD_ch(uint16_t ch, uint16_t *rdata);
extern uint8_t AD7949_read_VSAMP_ch(uint16_t ch, uint16_t *rdata);
extern uint8_t AD7949_read_THERMO_ch(uint16_t ch, uint16_t *rdata);


extern void AD7949_reg_write(uint16_t RegisterData);
extern uint16_t AD7949_data_read(void );




#endif

/******************* (C) COPYRIGHT 2018 *****END OF FILE****/


