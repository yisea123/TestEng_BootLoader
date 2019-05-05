/**
  ******************************************************************************
  * @file spi.h
  * @author  h&h
  * @version  
  * @date  
  * @brief  Header for i2c.c
  ******************************************************************************
  * @copy
  *
  */
#ifndef _SPI_H
#define _SPI_H


extern __ramfunc ErrorStatus drv_spi_access_short(SPI_TypeDef* SPIx, uint16_t data, uint16_t *ret_data);




#endif
/*(C) COPYRIGHT 2013 *****END OF FILE****/
