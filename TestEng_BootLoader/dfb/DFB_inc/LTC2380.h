/**
  ******************************************************************************
  * @file    ltc2380.h  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   ltc2380 driver
  ******************************************************************************
**/
#ifndef _LTC2380_H
#define _LTC2380_H
extern void LTC2380_init(void);
extern uint8_t LTC2380_read_ISAMP_ch(uint16_t channel, uint16_t *rdata);
extern uint8_t LTC2380_read_VSAMP_ch(uint16_t channel, uint16_t *rdata);


//#define DEBUG_LTC2380
#ifdef DEBUG_LTC2380
extern void test_LTC2380_init(void);
extern void test_ltc2380(void);

#endif

#endif
/******************* (C) COPYRIGHT 2018 *****END OF FILE****/
