/**
  ******************************************************************************
  * @file    spi_device.c  burn in system
  * @author  h&h
  * @version 
  * @date    
* @brief   SPI functions, DAC set DFB current, ADC update 
  ******************************************************************************
**/ 

#include "include.h"

__ramfunc ErrorStatus drv_spi1_access_short(uint16_t data, uint16_t *ret_data);
__ramfunc ErrorStatus drv_spi2_access_short(uint16_t data, uint16_t *ret_data);

/**
  * @brief   drv_spi_access_short()
  * @param   
  * @retval 
  * @Description:	
     spi driver
**/
__ramfunc ErrorStatus drv_spi_access_short(SPI_TypeDef* SPIx, uint16_t data, uint16_t *ret_data)
{
    unsigned short   loop = 0;
    uint32_t spi_status;
    ErrorStatus rc = SUCCESS;
    assert_param(IS_SPI_ALL_PERIPH(SPIx));

    SPIx->DR = data;                               
    while (1) 
    {
       spi_status = SPIx->SR;      
       if ( (spi_status & SPI_I2S_FLAG_TXE)&& !(spi_status & (SPI_I2S_FLAG_BSY)) ) 
       {
            break;
       }

       if( loop++ > 1000 )
       {
          rc = ERROR;
          break;
       }
    }

    if (rc==SUCCESS) 
    {    
        spi_status = SPIx->SR;
        while((spi_status & SPI_I2S_FLAG_RXNE)==RESET);
        *ret_data = SPIx->DR; 
    }
    return rc;
} 





__ramfunc ErrorStatus drv_spi2_access_short(uint16_t data, uint16_t *ret_data)
{
     unsigned short   loop = 0;
    uint32_t spi_status;
    ErrorStatus rc = SUCCESS;
    
    SPI2->DR = data;                               
    while (1) 
    {
       spi_status = SPI2->SR;      
       if ( (spi_status & SPI_I2S_FLAG_TXE)&& !(spi_status & (SPI_I2S_FLAG_BSY)) ) 
       {
            break;
       }

       if( loop++ > 1000 )
       {
          rc = ERROR;
          break;
       }
    }
    
    if(rc == ERROR)
    return rc;
    
    loop = 0;
    while (1) 
    {
       spi_status = SPI2->SR;      
       if ((spi_status & SPI_I2S_FLAG_RXNE)!=RESET)
       {
       *ret_data = SPI2->DR;
            break;
       }

       if( loop++ > 1000 )
       {
      *ret_data = 0;
          rc = ERROR;
          break;
       }
    }
    return rc;
}


__ramfunc ErrorStatus drv_spi1_access_short(uint16_t data, uint16_t *ret_data)
{
     unsigned short   loop = 0;
    uint32_t spi_status;
    ErrorStatus rc = SUCCESS;
    
    SPI1->DR = data;                               
    while (1) 
    {
       spi_status = SPI1->SR;      
       if ( (spi_status & SPI_I2S_FLAG_TXE)&& !(spi_status & (SPI_I2S_FLAG_BSY)) ) 
       {
            break;
       }

       if( loop++ > 1000 )
       {
          rc = ERROR;
          break;
       }
    }
    
    if(rc == ERROR)
	return rc;
    
    loop = 0;
    while (1) 
    {
       spi_status = SPI1->SR;      
       if ((spi_status & SPI_I2S_FLAG_RXNE)!=RESET)
       {
	   *ret_data = SPI1->DR;
            break;
       }

       if( loop++ > 1000 )
       {
	  *ret_data = 0;
          rc = ERROR;
          break;
       }
    }
    return rc;
} 

/******************* (C) COPYRIGHT 2018 *****END OF FILE****/
 

