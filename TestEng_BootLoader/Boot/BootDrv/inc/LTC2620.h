/**
  ******************************************************************************
  * @file ltc2620.h
  * @author  h&h
  * @version  
  * @date  
  * @brief  Header for ltc2620.h
  ******************************************************************************
  * @copy
  *
  */


#ifndef LTC2620_H
#define LTC2620_H

#define LTC2620_CHANNEL1  0x0000
#define LTC2620_CHANNEL2  0x0001
#define LTC2620_CHANNEL3  0x0002
#define LTC2620_CHANNEL4  0x0003
#define LTC2620_CHANNEL5  0x0004
#define LTC2620_CHANNEL6  0x0005
#define LTC2620_CHANNEL7  0x0006
#define LTC2620_CHANNEL8  0x0007
#define LTC2620_CHANNELNC 0x000F

#define LTC2620_CHIP_ID_1 SPI_CS_DA1
#define LTC2620_CHIP_ID_2 SPI_CS_DA2
#define LTC2620_CHIP_ID_3 SPI_CS_DA3
#define LTC2620_CHIP_ID_4 SPI_CS_DA4
#define LTC2620_CHIP_NONE SPI_CS_NONE

#define LTC2620_SPI_PORT SPI2

#define DRV_SPI_CS_LTC2620(n)  Set_spi_cs_n(n)

extern void LTC2620_init(void);
extern uint8_t LTC2620_Write_n(uint16_t chan, uint16_t w_data);
extern uint8_t LTC2620_Updata_n(uint16_t chan, uint16_t w_data);
extern uint8_t LTC2620_Write_n_Updata_n(uint16_t chan, uint16_t w_data);
extern uint8_t LTC2620_Write_all(uint16_t w_data);
extern uint8_t LTC2620_Updata_all(uint16_t w_data);
extern uint8_t LTC2620_Write_all_Updata_all(uint16_t w_data);
extern uint8_t LTC2620_Powerdown_n(uint16_t chan);
extern uint8_t LTC2620_Powerdown_all(void);


#define DEBUG_LTC2620
#ifdef DEBUG_LTC2620

extern void test_ltc2620_ini(void);
extern void test_ltc2620(void);
#endif


#endif

/*(C) COPYRIGHT 2013  *****END OF FILE****/

