/**
  ******************************************************************************
  * @file    i2c.c  burn in system
  * @author  h&h
  * @version 
  * @date    2013
  * @brief   i2c driver
  ******************************************************************************
**/ 

#include "include.h"


// timeout (for 100K I2C_CLK, period is 10us; system run 64MHz; timeout set = 10us)
#define I2C_TIMEOUT           0xFFFF   //  = 640
/* I2C ADD0 mask */
#define OAR1_ADD0_Set           ((uint16_t)0x0001)
#define OAR1_ADD0_Reset         ((uint16_t)0xFFFE)



/******************************************************************************
  * @brief  Writes i2c command.
  * @param command: device command.
  * @param command_data: Command data to be sent to the device,may be empty.
  * @param NumByteToWrite: Number of bytes to be sent by the MCU.can be 0/1/2
  * @param SlaveAddress: The address of the slave to be addressed by the Master.
  * @retval : status.
  ***
note:


*/

uint8_t I2c_command_write(I2C_TypeDef* I2Cx, unsigned char command,  unsigned short NumByteToWrite, unsigned char SlaveAddress,  unsigned char * w_data)
{
     
         __IO uint32_t temp = 0;
         __IO uint16_t timeout = 0;     
         uint8_t exe_result;

         /*send start*/
         drv_i2c_master_start(I2Cx);
         
        /* Reset the address bit0 for write*/
        SlaveAddress &= OAR1_ADD0_Reset;
        
        /* Send slave address */
        exe_result=send_slaveaddress(I2Cx, SlaveAddress);
        if(exe_result==SUCCESS)
        {
          
          /* Send command */ 
          exe_result=send_command(I2Cx, command);
          if(exe_result==SUCCESS)
          {
            /*if there is data*/
            if(NumByteToWrite)
            {
              /*send data*/
              exe_result=drv_i2c_master_send_data(I2Cx, w_data,NumByteToWrite );
              drv_i2c_master_stop(I2Cx);              
            }  
          }
          else
          {
            drv_i2c_master_stop(I2Cx); 
          }
        }
        else
        {
          drv_i2c_master_stop(I2Cx);    // initiate a STOP
        }
        /* Send STOP condition */
             
        return exe_result;
}
        


/******************************************************************************
  * @brief  Reads buffer of bytes  from the slave.
  * @param data: read data from slave(gOutboundData)
  * @param NumByteToRead: Number of bytes to be read by the Master.
  * @param Mode: 
  * @param SlaveAddress: The address of the slave to be addressed by the Master.
  * @retval : status.
  */
uint8_t I2c_command_read(I2C_TypeDef* I2Cx, unsigned char command, unsigned short NumByteToRead, unsigned char SlaveAddress,  unsigned char *r_data )
{

  /*only read PMBUS 1/2 byte commands at present, no block read commands used,LTC2974 datasheet*/



  __IO uint32_t temp = 0;
  __IO uint16_t timeout = 0;
        
  uint8_t exe_result=0;

  
  /*send start*/
  drv_i2c_master_start(I2Cx);
  
  /* Reset the address bit0 for write*/
  SlaveAddress &= OAR1_ADD0_Reset;
  
  /* Send slave address */
  exe_result=send_slaveaddress(I2Cx, SlaveAddress);
        
  if( exe_result == SUCCESS )
  { 
    /* Send command */ 
    exe_result=send_command(I2Cx,command);
    
    if( exe_result == SUCCESS )
    { // write data.       
      
 
      drv_i2c_master_start(I2Cx);    // initiate a START

      exe_result = drv_i2c_master_recv_with_stop(I2Cx, SlaveAddress, r_data, NumByteToRead );

    }
    else
    {
      drv_i2c_master_stop(I2Cx);    // initiate a STOP
    }
  }
  else
  {
    drv_i2c_master_stop(I2Cx);    // initiate a STOP
  }
  return exe_result;
}




////////////////////////////////////////////////////////////////////////////////
// Syntax: void drv_i2c_master_start( void )
// Function: Send I2C START. Check to make sure the START is sent.
// Argument: 
// Return:
////////////////////////////////////////////////////////////////////////////////

__ramfunc void drv_i2c_master_start(I2C_TypeDef* I2Cx)
{
  unsigned long timeout;
  assert_param(IS_I2C_ALL_PERIPH(I2Cx));

  I2Cx->CR1 |= I2C_CR1_START;   // generate START.
  
  // check SR1 register SB bit (Master mode, bit 0). 
  //       SB = 0: No START condition.
  //       SB = 1: Start condition generated.
  // Normally, 55 loops are needed.
  timeout = I2C_TIMEOUT;
  while( (I2Cx->SR1 & I2C_SR1_SB ) == 0 && timeout > 0)
    timeout--;    // start not sent yet.
}

#if 0
__ramfunc void drv_i2c_master_start(void)
{
  unsigned long timeout;

  I2C1->CR1 |= I2C_CR1_START;   // generate START.
  
  // check SR1 register SB bit (Master mode, bit 0). 
  //       SB = 0: No START condition.
  //       SB = 1: Start condition generated.
  // Normally, 55 loops are needed.
  timeout = I2C_TIMEOUT;
  while( (I2C1->SR1 & I2C_SR1_SB ) == 0 && timeout > 0)
    timeout--;    // start not sent yet.
}
#endif
////////////////////////////////////////////////////////////////////////////////
// Syntax: void drv_i2c_master_stop()
// Function: Generate STOP. A delay may apply to generate enough Tbuf time before
//           possible incoming START.
// Argument: 
// Return:
////////////////////////////////////////////////////////////////////////////////

__ramfunc void drv_i2c_master_stop(I2C_TypeDef* I2Cx)
{
  unsigned long timeout;
  assert_param(IS_I2C_ALL_PERIPH(I2Cx));

  I2Cx->CR1 |= I2C_CR1_STOP;   // generate STOP.
  
  // Check SR2 register MSL and BUSY bits (bit 0 and 1 ) to see if the bus
  // is busy and it is in master mode. When the STOP condition is detected,
  // both bits should be cleared by hardware.
  //      MSL = 1: master mode. 
  //      MSL = 0: slave mode.
  //      BUSY = 1: communication ongoing on the bus.
  //      BUSY = 0: No communication on the bus.
  timeout = I2C_TIMEOUT;
  while( (I2Cx->CR1 & I2C_CR1_STOP) != 0 && timeout > 0)
    timeout--;    // not master or start not sent yet.
}
#if 0
__ramfunc void drv_i2c_master_stop(void)
{
  unsigned long timeout;

  I2C1->CR1 |= I2C_CR1_STOP;   // generate STOP.
  
  // Check SR2 register MSL and BUSY bits (bit 0 and 1 ) to see if the bus
  // is busy and it is in master mode. When the STOP condition is detected,
  // both bits should be cleared by hardware.
  //      MSL = 1: master mode. 
  //      MSL = 0: slave mode.
  //      BUSY = 1: communication ongoing on the bus.
  //      BUSY = 0: No communication on the bus.
  timeout = I2C_TIMEOUT;
  while( (I2C1->CR1 & I2C_CR1_STOP) != 0 && timeout > 0)
    timeout--;    // not master or start not sent yet.
}
#endif
////////////////////////////////////////////////////////////////////////////////
// Syntax: ErrorStatus send_slaveaddress(uint8_t slaveaddress)
// Function: Set device with read/write attribute.
// Argument: slave address
// Return: number of bytes sent.
////////////////////////////////////////////////////////////////////////////////

__ramfunc uint8_t send_slaveaddress(I2C_TypeDef* I2Cx, uint8_t slaveaddress )
{
  __IO uint32_t temp = 0;
  unsigned long timeout;
  assert_param(IS_I2C_ALL_PERIPH(I2Cx));

  I2Cx->DR = slaveaddress;    // send device and read/write request.

  timeout = I2C_TIMEOUT;
  // check ADDR bit until it is set by hardware. It is set after ACK.
  while(( I2Cx->SR1 & I2C_SR1_ADDR ) == 0 && timeout > 0)
  {
    if( I2Cx->SR1 & I2C_SR1_AF )
    {
      I2Cx->SR1 = 0;  // clear Acknowledge Fail.
      timeout = 0;
    }
    else
    {
      timeout--;  
    }
  }
  
  /* Clear ADDR flag by reading SR2 register */
  temp = I2Cx->SR2;
  
  if( timeout == 0 )    // timeout, no need to continue.
  {
    return ERROR;
  } 
  
  return SUCCESS;
}
#if 0
__ramfunc uint8_t send_slaveaddress(uint8_t slaveaddress )
{
  __IO uint32_t temp = 0;
  unsigned long timeout;

  I2C1->DR = slaveaddress;    // send device and read/write request.

  timeout = I2C_TIMEOUT;
  // check ADDR bit until it is set by hardware. It is set after ACK.
  while(( I2C1->SR1 & I2C_SR1_ADDR ) == 0 && timeout > 0)
  {
    if( I2C1->SR1 & I2C_SR1_AF )
    {
      I2C1->SR1 = 0;  // clear Acknowledge Fail.
      timeout = 0;
    }
    else
    {
      timeout--;  
    }
  }
  
  /* Clear ADDR flag by reading SR2 register */
  temp = I2C1->SR2;
  
  if( timeout == 0 )    // timeout, no need to continue.
  {
    return ERROR;
  } 
  
  return SUCCESS;
}
#endif
////////////////////////////////////////////////////////////////////////////////
// Syntax: ErrorStatus send_command(uint8_t command)
// Function: 
// Argument:
////////////////////////////////////////////////////////////////////////////////

__ramfunc uint8_t send_command(I2C_TypeDef* I2Cx,uint8_t command)
{
    uint16_t timeout=0; 
    I2Cx->DR = command;
    assert_param(IS_I2C_ALL_PERIPH(I2Cx));

    /* Poll on BTF to receive data because in polling mode we can not guarantee the
       EV8 software sequence is managed before the current byte transfer completes */
    timeout = I2C_TIMEOUT;
    while ((I2Cx->SR1 & I2C_SR1_BTF) == 0 && timeout > 0)
    {
      if( I2Cx->SR1 & I2C_SR1_AF )
      { // NACK observed.
        I2Cx->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;
      }
    }
    
    if( timeout == 0 )
    {
      return ERROR;
    }
    
    return SUCCESS;
  }
#if 0
__ramfunc uint8_t send_command(uint8_t command)
{
    uint16_t timeout=0; 
    I2C1->DR = command;

    /* Poll on BTF to receive data because in polling mode we can not guarantee the
       EV8 software sequence is managed before the current byte transfer completes */
    timeout = I2C_TIMEOUT;
    while ((I2C1->SR1 & I2C_SR1_BTF) == 0 && timeout > 0)
    {
      if( I2C1->SR1 & I2C_SR1_AF )
      { // NACK observed.
        I2C1->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;
      }
    }
    
    if( timeout == 0 )
    {
      return ERROR;
    }
    return SUCCESS;
  }
#endif
////////////////////////////////////////////////////////////////////////////////
// Syntax: short drv_i2c_master_send_data( unsigned char *tx_buf, 
//                          unsigned char length )
// Function: Send data bytes to I2C slave. This should follow START, device and 
//           address bytes sent already.
// Argument: tx_buf = pointer to the buffer.
//           length = bytes to send
// Return: -1 = ACK failure
//         >=0 = bytes sent.
////////////////////////////////////////////////////////////////////////////////

__ramfunc uint8_t drv_i2c_master_send_data( I2C_TypeDef* I2Cx, unsigned char *tx_buf, unsigned short length )
{
  unsigned long timeout;
  assert_param(IS_I2C_ALL_PERIPH(I2Cx));

  while(length--)
  {
     /* Send the current byte */
    I2Cx->DR = *tx_buf++;
    /* Poll on BTF to receive data because in polling mode we can not guarantee the
       EV8 software sequence is managed before the current byte transfer completes */
    timeout = I2C_TIMEOUT;
    while ((I2Cx->SR1 & I2C_SR1_BTF) == 0 && timeout > 0)
    {
      if( I2Cx->SR1 & I2C_SR1_AF )
      {
        I2Cx->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;
      }
    }
    
    if( timeout == 0 )
    {
      return ERROR;
    } 
  }
  return SUCCESS;
}
#if 0
__ramfunc uint8_t drv_i2c_master_send_data( unsigned char *tx_buf, unsigned char length )
{
  unsigned long timeout;

  while(length--)
  {
     /* Send the current byte */
    I2C1->DR = *tx_buf++;
    /* Poll on BTF to receive data because in polling mode we can not guarantee the
       EV8 software sequence is managed before the current byte transfer completes */
    timeout = I2C_TIMEOUT;
    while ((I2C1->SR1 & I2C_SR1_BTF) == 0 && timeout > 0)
    {
      if( I2C1->SR1 & I2C_SR1_AF )
      {
        I2C1->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;
      }
    }
    
    if( timeout == 0 )
    {
      return ERROR;
    } 
  }
  return SUCCESS;
}
#endif
////////////////////////////////////////////////////////////////////////////////
// Syntax: short drv_i2c_master_recv(unsigned char device, 
//                        unsigned char *rx_buf, unsigned short length )
// Function: Send I2C sequence out to I2C bus.
// Argument: i2c_clock_rate = I2C clock rate. 100000 - 100K
// Return: -1 = ACK failure
//         >=0 = number of bytes read.
////////////////////////////////////////////////////////////////////////////////

__ramfunc uint8_t drv_i2c_master_recv_with_stop(I2C_TypeDef* I2Cx, uint8_t device, unsigned char *rx_buf, unsigned short length )
{
  __IO uint32_t temp = 0;
  unsigned short count;
  unsigned long timeout;
  unsigned short sr2;
  assert_param(IS_I2C_ALL_PERIPH(I2Cx));

  count = 0;
  if (length == 1)
  {
    I2Cx->DR = device | 0x01;    // send address for receiving

    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    // check ADDR bit until it is set by hardware.
    while(( I2Cx->SR1 & I2C_SR1_ADDR ) == 0 && timeout > 0)
    {
      if( I2Cx->SR1 & I2C_SR1_AF )
      {
        I2Cx->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;  
      }
    }

    I2Cx->CR1 &= ~I2C_CR1_ACK;
    //__disable_irq();
    // need to read SR2
    temp = I2Cx->SR2;

    if( timeout == 0 )    // timeout, no need to continue.
      return ERROR;

    I2Cx->CR1 |= I2C_CR1_STOP;
    //__enable_irq();
    
    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    count++;    // assume one byte read
    while ((I2Cx->SR1 & I2C_SR1_RXNE) == 0 && timeout > 0)
    {
      if( I2Cx->SR1 & I2C_SR1_AF )
      {
        I2Cx->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;  
      }
    }
        
    /* Read the data */
    *rx_buf++ = I2Cx->DR;
    /* Make sure that the STOP bit is cleared by Hardware before CR1 write access */
    while ((I2Cx->CR1&I2C_CR1_STOP) != 0);
    /* Enable Acknowledgement to be ready for another reception */
    I2Cx->CR1 |= I2C_CR1_ACK;
  }
  
  
  else if (length == 2)
  {
    /* Set POS bit */
    I2Cx->CR1 |= I2C_CR1_POS;   // this is required for two byte receiving.
    
    /* Send slave address */
    I2Cx->DR = device | 0x01;    // send address for receiving

    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    // check ADDR bit until it is set by hardware.
    while(( I2Cx->SR1 & I2C_SR1_ADDR ) == 0 && timeout > 0)
    {
      if( I2Cx->SR1 & I2C_SR1_AF )
      {
        I2Cx->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;  
      }
    }

    /* EV6_1: The acknowledge disable should be done just after EV6,
       that is after ADDR is cleared, so disable all active IRQs around ADDR clearing and 
       ACK clearing */
    __disable_irq();
    /* Clear ADDR by reading SR2 register  */
    temp = I2Cx->SR2;

    /* Clear ACK */
    I2Cx->CR1 &= ~I2C_CR1_ACK;
    /*Re-enable IRQs */
     __enable_irq();

    if( timeout == 0 )    // timeout, no need to continue.
      return ERROR;
    
    count += 2; // assume two bytes are read.
    
    /* Wait until BTF is set */
    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    while ((I2Cx->SR1 & I2C_SR1_BTF) == 0 && timeout > 0 )
    {
      timeout--;
    }
    
    /* Read first data */
    *rx_buf++ = I2Cx->DR;
    
    /* Re-enable IRQs */
    // __enable_irq();
    /* Read second data */
    *rx_buf++ = I2Cx->DR;

    /* Program the STOP */
    I2Cx->CR1 |= I2C_CR1_STOP;
    /* Make sure that the STOP bit is cleared by Hardware before CR1 write access */
    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    while ((I2Cx->CR1&I2C_CR1_STOP) != 0 && timeout > 0 )
    {
      timeout--;
    }
    
    /* Enable Acknowledgement to be ready for another reception */
    I2Cx->CR1 |= I2C_CR1_ACK;
    /* Clear POS bit */
    I2Cx->CR1 &= ~I2C_CR1_POS;
  }
  else
  { // more than two bytes.   
    /* Send slave address */
    I2Cx->DR = device | 0x01;    // send address for receiving

    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    // check ADDR bit until it is set by hardware.
    while(( I2Cx->SR1 & I2C_SR1_ADDR ) == 0 && timeout > 0)
    {
      if( I2Cx->SR1 & I2C_SR1_AF )
      {
        I2Cx->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;  
      }
    }

    /* Clear ADDR by reading SR2 register  */
    sr2 = I2Cx->SR2;

    if( timeout == 0 )    // timeout, no need to continue.
    {
      timeout = sr2;    // dummy statement taht avoid compiler warning "sr2 set but never used".
      return ERROR;
    }

    /* While there is data to be read */
    while (length)
    {
      /* Receive bytes from first byte until byte N-3 */
      if (length != 3)
      {
        /* Poll on BTF to receive data because in polling mode we can not guarantee the
           EV7 software sequence is managed before the current byte transfer completes */
        timeout = I2C_TIMEOUT;      // wait until it is sent out.
        while ((I2Cx->SR1 & I2C_SR1_BTF) == 0 && timeout > 0)
        {
          timeout--;  
        }
        
        if( timeout == 0 )    // data can not be sent out. stop and skip the reset.
        {
          length = 0;
          break;
        }
        
        count++;
        /* Read data */
        *rx_buf++ = I2Cx->DR;
        /* Decrement the read bytes counter */
        length--;
      }

      /* it remains to read three data: data N-2, data N-1, Data N */
      if(length == 3)
      {
        /* Wait until BTF is set: Data N-2 in DR and data N -1 in shift register */
        timeout = I2C_TIMEOUT;      // wait until it is sent out.
        while ((I2Cx->SR1 & I2C_SR1_BTF) == 0  && timeout > 0)
        {
          timeout--;  
        }
        
        if( timeout )
        {               // if timeout occurs, there is no need to continue.
          /* Clear ACK */
          I2Cx->CR1 &= ~I2C_CR1_ACK;

          /* Disable IRQs around data reading and STOP programming because of the
            limitation ? */
          //__disable_irq();
          /* Read Data N-2 */
          *rx_buf++ = I2Cx->DR;
          /* Program the STOP */
          I2Cx->CR1 |= I2C_CR1_STOP;
          /* Read DataN-1 */
          *rx_buf++ = I2Cx->DR;
          /* Re-enable IRQs */
          // __enable_irq();
          /* Wait until RXNE is set (DR contains the last data) */
          timeout = I2C_TIMEOUT;      // wait until it is sent out.
          while ((I2Cx->SR1 & I2C_SR1_RXNE) == 0  && timeout > 0)
          {
            timeout--;  
          }
                
          /* Read DataN */
          *rx_buf++ = I2Cx->DR;
          
          count += 3;
        }
        /* Reset the number of bytes to be read by master */
        length = 0;
      }
    }
    
    /* Make sure that the STOP bit is cleared by Hardware before CR1 write access */
    while ((I2Cx->CR1&I2C_CR1_STOP) == I2C_CR1_STOP);
    /* Enable Acknowledgement to be ready for another reception */
    I2Cx->CR1 |= I2C_CR1_ACK;
  }
  
  return SUCCESS;
}
#if 0

__ramfunc uint8_t drv_i2c_master_recv_with_stop(uint8_t device, unsigned char *rx_buf, uint8_t length )
{
  __IO uint32_t temp = 0;
  unsigned short count;
  unsigned long timeout;

  count = 0;
  if (length == 1)
  {
    I2C1->DR = device | 0x01;    // send address for receiving

    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    // check ADDR bit until it is set by hardware.
    while(( I2C1->SR1 & I2C_SR1_ADDR ) == 0 && timeout > 0)
    {
      if( I2C1->SR1 & I2C_SR1_AF )
      {
        I2C1->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;  
      }
    }

    I2C1->CR1 &= ~I2C_CR1_ACK;
    //__disable_irq();
    // need to read SR2
    temp = I2C1->SR2;

    if( timeout == 0 )    // timeout, no need to continue.
      return ERROR;

    I2C1->CR1 |= I2C_CR1_STOP;
    //__enable_irq();
    
    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    count++;    // assume one byte read
    while ((I2C1->SR1 & I2C_SR1_RXNE) == 0 && timeout > 0)
    {
      if( I2C1->SR1 & I2C_SR1_AF )
      {
        I2C1->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;  
      }
    }
        
    /* Read the data */
    *rx_buf++ = I2C1->DR;
    /* Make sure that the STOP bit is cleared by Hardware before CR1 write access */
    while ((I2C1->CR1&I2C_CR1_STOP) != 0);
    /* Enable Acknowledgement to be ready for another reception */
    I2C1->CR1 |= I2C_CR1_ACK;
  }
  
  
  else if (length == 2)
  {
    /* Set POS bit */
    I2C1->CR1 |= I2C_CR1_POS;   // this is required for two byte receiving.
    
    /* Send slave address */
    I2C1->DR = device | 0x01;    // send address for receiving

    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    // check ADDR bit until it is set by hardware.
    while(( I2C1->SR1 & I2C_SR1_ADDR ) == 0 && timeout > 0)
    {
      if( I2C1->SR1 & I2C_SR1_AF )
      {
        I2C1->SR1 = 0;  // clear Acknowledge Fail.
        timeout = 0;
      }
      else
      {
        timeout--;  
      }
    }

    /* EV6_1: The acknowledge disable should be done just after EV6,
       that is after ADDR is cleared, so disable all active IRQs around ADDR clearing and 
       ACK clearing */
    __disable_irq();
    /* Clear ADDR by reading SR2 register  */
    temp = I2C1->SR2;

    /* Clear ACK */
    I2C1->CR1 &= ~I2C_CR1_ACK;
    /*Re-enable IRQs */
     __enable_irq();

    if( timeout == 0 )    // timeout, no need to continue.
      return ERROR;
    
    count += 2; // assume two bytes are read.
    
    /* Wait until BTF is set */
    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    while ((I2C1->SR1 & I2C_SR1_BTF) == 0 && timeout > 0 )
    {
      timeout--;
    }
    /* Disable IRQs around STOP programming and data reading because of the limitation ?*/
    // __disable_irq();
    /* Program the STOP */
    I2C1->CR1 |= I2C_CR1_STOP;
    
    /* Read first data */
    *rx_buf++ = I2C1->DR;
    
    /* Re-enable IRQs */
    // __enable_irq();
    /* Read second data */
    *rx_buf++ = I2C1->DR;
    
    /* Make sure that the STOP bit is cleared by Hardware before CR1 write access */
    timeout = I2C_TIMEOUT;      // wait until it is sent out.
    while ((I2C1->CR1&I2C_CR1_STOP) != 0 && timeout > 0 )
    {
      timeout--;
    }
    
    /* Enable Acknowledgement to be ready for another reception */
    I2C1->CR1 |= I2C_CR1_ACK;
    /* Clear POS bit */
    I2C1->CR1 &= ~I2C_CR1_POS;
  }
  
  return SUCCESS;
}
#endif
 /******************* (C) COPYRIGHT 2018 *****END OF FILE****/