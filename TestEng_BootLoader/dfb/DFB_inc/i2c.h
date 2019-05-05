/**
  ******************************************************************************
  * @file i2c.h
  * @author  h&h
  * @version  
  * @date  
  * @brief  Header for i2c.c
  ******************************************************************************
  * @copy
  *
  */

#ifndef _I2C_H
#define _I2C_H


uint8_t I2c_command_write(I2C_TypeDef* I2Cx, unsigned char command,  unsigned short NumByteToWrite, unsigned char SlaveAddress,  unsigned char * w_data);
uint8_t I2c_command_read(I2C_TypeDef* I2Cx, unsigned char command, unsigned short NumByteToRead, unsigned char SlaveAddress,  unsigned char *r_data );
#if 1
__ramfunc void drv_i2c_master_start(I2C_TypeDef* I2Cx);
__ramfunc void drv_i2c_master_stop(I2C_TypeDef* I2Cx);

__ramfunc uint8_t send_slaveaddress(I2C_TypeDef* I2Cx,uint8_t slaveaddress );
__ramfunc uint8_t send_command(I2C_TypeDef* I2Cx,uint8_t command);
__ramfunc uint8_t drv_i2c_master_send_data( I2C_TypeDef* I2Cx,unsigned char *tx_buf, unsigned short length );
__ramfunc uint8_t drv_i2c_master_recv_with_stop(I2C_TypeDef* I2Cx, uint8_t device, unsigned char *rx_buf, unsigned short length );
#endif
#if 0
void drv_i2c_master_start(void);
void drv_i2c_master_stop(void);

uint8_t send_slaveaddress(uint8_t slaveaddress );
uint8_t send_command(uint8_t command);
uint8_t drv_i2c_master_send_data( unsigned char *tx_buf, unsigned char length );
uint8_t drv_i2c_master_recv_with_stop(uint8_t device, unsigned char *rx_buf, uint8_t length );
#endif




#if 0
/* I2C SPE mask */
#define CR1_PE_Set              ((uint16_t)0x0001)
#define CR1_PE_Reset            ((uint16_t)0xFFFE)

/* I2C START mask */
#define CR1_START_Set           ((uint16_t)0x0100)
#define CR1_START_Reset         ((uint16_t)0xFEFF)

#define CR1_POS_Set           ((uint16_t)0x0800)
#define CR1_POS_Reset         ((uint16_t)0xF7FF)

/* I2C STOP mask */
#define CR1_STOP_Set            ((uint16_t)0x0200)
#define CR1_STOP_Reset          ((uint16_t)0xFDFF)

/* I2C ACK mask */
#define CR1_ACK_Set             ((uint16_t)0x0400)
#define CR1_ACK_Reset           ((uint16_t)0xFBFF)

/* I2C ENARP mask */
#define CR1_ENARP_Set           ((uint16_t)0x0010)
#define CR1_ENARP_Reset         ((uint16_t)0xFFEF)

/* I2C NOSTRETCH mask */
#define CR1_NOSTRETCH_Set       ((uint16_t)0x0080)
#define CR1_NOSTRETCH_Reset     ((uint16_t)0xFF7F)

/* I2C registers Masks */
#define CR1_CLEAR_Mask          ((uint16_t)0xFBF5)

/* I2C DMAEN mask */
#define CR2_DMAEN_Set           ((uint16_t)0x0800)
#define CR2_DMAEN_Reset         ((uint16_t)0xF7FF)

/* I2C LAST mask */
#define CR2_LAST_Set            ((uint16_t)0x1000)
#define CR2_LAST_Reset          ((uint16_t)0xEFFF)

/* I2C FREQ mask */
#define CR2_FREQ_Reset          ((uint16_t)0xFFC0)



/* I2C ENDUAL mask */
#define OAR2_ENDUAL_Set         ((uint16_t)0x0001)
#define OAR2_ENDUAL_Reset       ((uint16_t)0xFFFE)

/* I2C ADD2 mask */
#define OAR2_ADD2_Reset         ((uint16_t)0xFF01)

/* I2C F/S mask */
#define CCR_FS_Set              ((uint16_t)0x8000)

/* I2C CCR mask */
#define CCR_CCR_Set             ((uint16_t)0x0FFF)

/* I2C FLAG mask */
#define FLAG_Mask               ((uint32_t)0x00FFFFFF)

/* I2C Interrupt Enable mask */
#define ITEN_Mask               ((uint32_t)0x07000000)

#endif

#endif

/*(C) COPYRIGHT 2013  *****END OF FILE****/
