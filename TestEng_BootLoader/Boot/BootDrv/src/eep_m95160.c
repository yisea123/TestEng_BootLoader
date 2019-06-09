/**
  ******************************************************************************
  * @file eep_95160.c
  * @author  h&h
  * @version  
  * @date  
  * @brief  eeprom
  ******************************************************************************
  *
  */
#include "include.h"

fnsr_eep_m95160_info_t  fnsr_eep_m95160_info;

#define FNSR_MIN(arg0, arg1) (((arg0) <= (arg1)) ? (arg0) : (arg1))
#define FNSR_MAX(arg0, arg1) (((arg0) >= (arg1)) ? (arg0) : (arg1))

unsigned char drv_spi_access_byte(SPI_TypeDef  *SPIx, uint8_t data, uint8_t * ret_data);

uint8_t arm_drv_spi_update_with_header(
  uint32_t cs_pin, 
  uint16_t header_len, 
  uint8_t *mo_header,
  uint8_t *so_header,
  uint16_t payload_len, 
  uint8_t *mo_payload, 
  uint8_t *so_payload);

/********************************************************************************
 Syntax: void sfp_eeprom_driver_enable
 Function: Enable eeprom driver for external EEPROM access. Normally, the EEPROM
           write time ranges 5~10ms (byte or page). When more than one byte
           data are sent through I2C, page-write applies. The address will roll
          over if page-write applies and the address exceeds page boundary.
          When EEPROM is in progress of write, START + I2C device + R will
          get NACK. This is the way to poll if EEPROM is busy.

 Arguments: 
            ptr_eeprom_read = pointer to the driver for EEPROM read.
            ptr_eeprom_write = pointer to the driver for EEPROM write.

*/
void qsfp_eeprom_driver_enable(short (*ptr_eeprom_read)(unsigned short addr, unsigned char *buf, unsigned short length ),
                               short (*ptr_eeprom_write)(unsigned short addr, unsigned char *buf, unsigned short length ))
{
  ptr_drv_eeprom_read = ptr_eeprom_read;
  ptr_drv_eeprom_write = ptr_eeprom_write;
}



/******************************************************************************
  * @brief   drv_eep_rd_n(uint16_t src_addr, uint8_t *dst, uint16_t bytes)
  * @param  
  src_addr  : starting address of eeprom to read bytes from
  dst       : pointer to read buffer. bytes read are written to this buffer.
  bytes     : bytes to read
  * @retval  number of bytes read
  * @Description:	read n bytes from eeprom

  */

short drv_eep_rd_n(uint16_t src_addr, uint8_t *dst, uint16_t bytes)
{
  uint8_t status;
  uint32_t loop_cnt;
  
  /* number of bytes to read is 0*/
  if (!bytes) { return 0;}

  loop_cnt = 0;
  while (drv_eep_is_idle()!=SUCCESS) 
  {
    /* write could be in progress. wait for twice the tW before declaring timeout*/
    if (loop_cnt <= 2*fnsr_eep_m95160_info.tW_prd) 
    {
      loop_cnt++;
      continue;
    }
    else 
    {
      return 0;
    }
  }
  fnsr_eep_m95160_info.wr_buf[0] = FNSR_M95160_READ; // instruction for READ
  fnsr_eep_m95160_info.wr_buf[1] = src_addr >> 8; // addr bits 15:8
  fnsr_eep_m95160_info.wr_buf[2] = (uint8_t)src_addr; // addr bits 7:0

  status = arm_drv_spi_update_with_header(
    fnsr_eep_m95160_info.cs_gpio, // SPI chip select GPIO
    0x3,//FNSR_M95160_RD_HEADER_LEN, // header_len
    &fnsr_eep_m95160_info.wr_buf[0], // mo_header
    &fnsr_eep_m95160_info.rd_buf[0], // so_header
    bytes, // payload_len
    dst, // mo_payload. use dst
    dst); // so_payload

  //FNSR_ASSERT(status == SUCCESS);

  if (status != SUCCESS) 
  {
    return 0;
  }

  return bytes;
}


/******************************************************************************
  * @brief   drv_eep_wr_n(uint16_t src_addr, uint8_t *dst, uint16_t bytes)
  * @param  
  src_addr  : starting address of eeprom to read bytes from
  dst       : pointer to read buffer. bytes read are written to this buffer.
  bytes     : bytes to read
  * @retval  number of bytes read
  * @Description:	number of bytes written

  */

short drv_eep_wr_n(uint16_t dst_addr, uint8_t *src, uint16_t bytes)
{
  uint16_t total_bytes = bytes;
  uint16_t bytes_session;
  uint16_t next_page_addr;
  uint32_t loop_cnt;

  if(dst_addr > fnsr_eep_m95160_info.size_total_bytes)
    return 0;
  if(dst_addr + bytes > fnsr_eep_m95160_info.size_total_bytes)
    return 0;

  if (!bytes) 
  { 
    return 0;/* number of bytes to write is 0*/
  }

  while(bytes) 
  { 
    loop_cnt = 0;
    while (drv_eep_is_idle()!=SUCCESS) /*wait until idle*/
    {
      /* write could be in progress. wait for twice the tW before declaring timeout*/
      if (loop_cnt <= 2*fnsr_eep_m95160_info.tW_prd) 
      {
      	loop_cnt++;
        continue;
      } 
      else 
      {
        return (total_bytes - bytes);
      }
    }

    loop_cnt = 0;
    while (drv_eep_write_enable()!= SUCCESS) 
    {
//      if (loop_cnt <= fnsr_eep_m95160_info.ms_prd) {
        if (loop_cnt <= 6) 
        { // YYU 03-13-2013, reduce the timeout time to 5*1000*16/CLK_SPI
        // try for 1 ms before declaring timeout
      	 loop_cnt++;
         continue;
        } 
        else 
        { return (total_bytes - bytes); }
    }

    // limit each write to a singel page
    fnsr_eep_m95160_info.wr_buf[0] = FNSR_M95160_WRITE; // instruction for READ
    fnsr_eep_m95160_info.wr_buf[1] = dst_addr >> 8; // addr bits 15:8
    fnsr_eep_m95160_info.wr_buf[2] = (uint8_t)dst_addr; // addr bits 7:0

    next_page_addr =
      (dst_addr + fnsr_eep_m95160_info.size_page_bytes) & FNSR_M95160_PAGE_START_MASK;
    bytes_session = FNSR_MIN((next_page_addr - dst_addr), bytes);

    if(
         arm_drv_spi_update_with_header(
            fnsr_eep_m95160_info.cs_gpio, // SPI chip select GPIO
            FNSR_M95160_WR_HEADER_LEN,// header_len
            &fnsr_eep_m95160_info.wr_buf[0], // mo_header
            &fnsr_eep_m95160_info.rd_buf[0], // so_header
            bytes_session, // bytes, // payload_len
            src, // mo_payload
            &fnsr_eep_m95160_info.rd_buf[FNSR_M95160_WR_HEADER_LEN]) != SUCCESS
       )
        {
            return (total_bytes - bytes);
        }

    bytes -= bytes_session; // for next session
    dst_addr += bytes_session; // for next session
    src += bytes_session; // for next session
  }

  return total_bytes;
}


/******************************************************************************
  * @brief   short drv_eep_status_rd(uint8_t *dst)
  * @param  
  * @retval  
  * @Description:	

  */

uint8_t drv_eep_status_rd(uint8_t *dst)
{
  uint8_t retval = SUCCESS;

  fnsr_eep_m95160_info.wr_buf[0] = FNSR_M95160_RDSR; // initialize instruction code only

  fnsr_eep_m95160_info.wr_buf[0] = FNSR_M95160_RDSR; // instruction for READ
  retval = arm_drv_spi_update_with_header
    (
       fnsr_eep_m95160_info.cs_gpio, // SPI chip select GPIO
       FNSR_M95160_RDSR_HDR_LEN, // header_len
       &fnsr_eep_m95160_info.wr_buf[0], // mo_header
       &fnsr_eep_m95160_info.rd_buf[0], // so_header
       1, // payload_len - read one byte
       &fnsr_eep_m95160_info.wr_buf[FNSR_M95160_RDSR_HDR_LEN], // mo_payload
       &fnsr_eep_m95160_info.rd_buf[FNSR_M95160_RDSR_HDR_LEN]
     ); // so_payload


  *dst = fnsr_eep_m95160_info.rd_buf[FNSR_M95160_RDSR_HDR_LEN]; // the second byte in transaction
   return(retval);
}


/******************************************************************************
  * @brief   short drv_eep_is_idle(void)
  * @param  
  * @retval  
  * @Description:	

 **/
 
uint8_t drv_eep_is_idle(void)
{
  uint8_t retval;

  drv_eep_status_rd(&fnsr_eep_m95160_info.status_reg);

  if (fnsr_eep_m95160_info.status_reg & FNSR_M95160_RDSR_WIP) 
  {
      retval = ERROR;
  } 
  else 
  {
      retval = SUCCESS;
  }

  return(retval);
}


/******************************************************************************
  * @brief   drv_eep_write_enable(void)
  * @param  
  * @retval  
  * @Description:	

 **/
 
uint8_t drv_eep_write_enable(void)
{
  uint8_t status = ERROR;
  uint32_t  loop_cnt;

  fnsr_eep_m95160_info.wr_buf[0] = FNSR_M95160_WREN; // instruction for READ
  status = arm_drv_spi_update_with_header
    (
       fnsr_eep_m95160_info.cs_gpio, // SPI chip select GPIO
       FNSR_M95160_WREN_HDR_LEN, // header_len
       &fnsr_eep_m95160_info.wr_buf[0], // mo_header
       &fnsr_eep_m95160_info.rd_buf[0], // so_header
       0, // payload_len - nothing to read
       &fnsr_eep_m95160_info.wr_buf[FNSR_M95160_WREN_HDR_LEN], // mo_payload
       &fnsr_eep_m95160_info.rd_buf[FNSR_M95160_WREN_HDR_LEN]
     ); 
  if (status != SUCCESS) 
  {
    return ERROR;
  }

  loop_cnt = 0;
  while (loop_cnt <= fnsr_eep_m95160_info.ms_prd) 
  {
    drv_eep_status_rd(&fnsr_eep_m95160_info.status_reg);
    if (fnsr_eep_m95160_info.status_reg & FNSR_M95160_RDSR_WEL) 
    {
      status = SUCCESS;
      break;
    }
    loop_cnt++;
   }

  if(loop_cnt >= fnsr_eep_m95160_info.ms_prd)
  {
    status = ERROR;
  }
  return(status);
}

/******************************************************************************
  * @brief   drv_eep_init(uint16_t cs_gpio, uint16_t wr_protect_gpio, 
uint16_t hold_gpio, uint32_t tW_cnt)
  * @param  
  * @retval  
  * @Description:	

 **/

uint8_t drv_eep_init(
  GPIO_TypeDef* GPIOx,                 
  uint16_t cs_gpio,
  uint16_t wr_protect_gpio,
  uint16_t hold_gpio,
  uint32_t tW_prd, // tW prd in HCLK ticks
  uint32_t ms_prd) // 1ms prd in HCLK ticks
{
  fnsr_eep_m95160_info.GPIOx = GPIOx;
  fnsr_eep_m95160_info.cs_gpio = cs_gpio;
  fnsr_eep_m95160_info.wr_protect_gpio = wr_protect_gpio;
  fnsr_eep_m95160_info.hold_gpio = hold_gpio;
  
  fnsr_eep_m95160_info.size_total_bytes = FNSR_M95160_SIZE_TOTAL_BYTES;
  fnsr_eep_m95160_info.size_page_bytes = FNSR_M95160_SIZE_PAGE_BYTES;
  
  fnsr_eep_m95160_info.tW_prd = tW_prd;
  fnsr_eep_m95160_info.ms_prd = ms_prd;
  
  GPIO_SetBits(fnsr_eep_m95160_info.GPIOx,hold_gpio);
  GPIO_ResetBits(fnsr_eep_m95160_info.GPIOx,wr_protect_gpio);
    
  return(SUCCESS);
}

/********************************************************************************
  * @brief   drv_spi_access_byte()
  * @param   data = 8-bit data to write. 
             ret_data = pointer to the buffer that saves data read from SPI bus.
  * @retval 
  * @Description:	
Apply SPI read/write transaction. This routine does not toggle
chip select pin.  This function will check if the datasize is set
correctly.  If the datasize is not set correctly, it will be changed
**/
unsigned char drv_spi_access_byte(SPI_TypeDef  *SPIx, uint8_t data, uint8_t * ret_data)
{
    short   loop = 0;
    uint32_t spi_status;
    unsigned char rc = SUCCESS;
    unsigned short word_flag = 0;

    if((SPIx->CR1 & CR1_Datasize_Mask) != SPI_DataSize_8b)
    {

      /* Change SPI word size to a byte
       Disable SPI first since the datasheet says to*/
      SPIx->CR1 &= CR1_SPE_Reset;
      /* Change SPI word size*/
      SPIx->CR1 = (SPIx->CR1 & ~CR1_Datasize_Mask) | SPI_DataSize_8b;
      /* Enable SPI peripheral*/
      SPIx->CR1 |= CR1_SPE_Set;

      word_flag = 1;
    }
     SPIx->DR = data;
     while (1) 
     {
          spi_status = SPIx->SR;
          if ( (spi_status & SPI_I2S_FLAG_TXE)
              && !(spi_status & (SPI_I2S_FLAG_BSY)) ) {
            break;
          }
          /* SPI lowest speed is 0.25MHz. Prepare for exceptional case: 
          64MHz/0.25MHz * 16 bits = 4096 clocks.*/
          if( loop++ > 1000 )
          {
             rc = ERROR;
             break;
          }
     } 
     *ret_data = SPIx->DR;

     if(word_flag)
     {
       /* Change SPI word size back to 16bits*/
      /* Disable SPI first since the datasheet says to*/
      SPIx->CR1 &= CR1_SPE_Reset;
      /*Change SPI word size*/
      SPIx->CR1 = (SPIx->CR1 & ~CR1_Datasize_Mask) | SPI_DataSize_16b;
      /* Enable SPI peripheral*/
      SPIx->CR1 |= CR1_SPE_Set;
     }
     return rc;
}  


/*****************************************************************************
  * @brief   arm_drv_spi_update_with_header()
  * @param  
  uint16_t cs_pin, // chip select I/O pin. 
  uint16_t header_len, // header length in bytes
  uint8_t *mo_header, // buffer for master out header
  uint8_t *so_header, // buffer for slave out header
  uint16_t payload_len, // payload length in byte
  uint8_t *mo_payload, // buffer for master out payload
  uint8_t *so_payload_ // buffer for slave out payload
  * @retval 
  * @Description:	
Initiates an read/write operation to write a sequence of bytes and then
  read bytes from the slave device and places the retrieved
  data into the buffer. Send out data and received data can share the
 same buffer. Received data will over-write the send out data after
  it is sent out. If there is an error then the appropriate error
  code is returned.
**/
static unsigned char spi_buf;

uint8_t arm_drv_spi_update_with_header(
  uint32_t cs_pin, 
  uint16_t header_len, 
  uint8_t *mo_header, 
  uint8_t *so_header, 
  uint16_t payload_len,
  uint8_t *mo_payload, 
  uint8_t *so_payload) 
{
  uint8_t rc = SUCCESS;
  /*select slave chip*/
  GPIO_ResetBits(fnsr_eep_m95160_info.GPIOx,cs_pin);
  for( ;header_len > 0; header_len--) 
  {
    if (drv_spi_access_byte(SPI2,*mo_header++, &spi_buf) != SUCCESS) 
    {
      rc = ERROR;
    }
    *so_header++ = spi_buf;
  }

  for( ; payload_len > 0; payload_len--)
  {
    if (drv_spi_access_byte(SPI2,*mo_payload++, &spi_buf) != SUCCESS) 
    {
      rc = ERROR;
    }
    *so_payload++ = spi_buf;
  }
  /* Deselect the slave device*/
  GPIO_SetBits(fnsr_eep_m95160_info.GPIOx,cs_pin);

  return rc;
}



/******************* (C) COPYRIGHT 2018 *****END OF FILE****/


