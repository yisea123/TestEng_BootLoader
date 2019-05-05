/**
  ******************************************************************************
  * @file eep_95160.h
  * @author  h&h
  * @version  
  * @date  
  * @brief  Header for eeprom
  ******************************************************************************
  * @copy
  *
  */
#ifndef __ARM_DRV_EEP_M95160_H__
#define __ARM_DRV_EEP_M95160_H__



/******* SPI SPE mask ********/
#define CR1_SPE_Set          ((uint16_t)0x0040)
#define CR1_SPE_Reset        ((uint16_t)0xFFBF)

/*********** I2S I2SE mask****/
#define I2SCFGR_I2SE_Set     ((uint16_t)0x0400)
#define I2SCFGR_I2SE_Reset   ((uint16_t)0xFBFF)

/******** SPI CRCNext mask*****/
#define CR1_CRCNext_Set      ((uint16_t)0x1000)

/******* SPI CRCEN mask*******/
#define CR1_CRCEN_Set        ((uint16_t)0x2000)
#define CR1_CRCEN_Reset      ((uint16_t)0xDFFF)

/******** SPI SSOE mask******/
#define CR2_SSOE_Set         ((uint16_t)0x0004)
#define CR2_SSOE_Reset       ((uint16_t)0xFFFB)

/*** SPI registers Masks******/
#define CR1_CLEAR_Mask       ((uint16_t)0x3040)
#define CR1_Datasize_Mask    ((uint16_t)0x0800)
#define I2SCFGR_CLEAR_Mask   ((uint16_t)0xF040)
/*** SPI or I2S mode selection masks*****/
#define SPI_Mode_Select      ((uint16_t)0xF7FF)
#define I2S_Mode_Select      ((uint16_t)0x0800



#define FNSR_M95160_SIZE_TOTAL_BYTES  0x0800  // total size in bytes
#define FNSR_M95160_SIZE_PAGE_BYTES   0x0020    // page size in bytes
#define FNSR_M95160_PAGE_START_MASK   0xFFE0  // page start mask

// M95160 instructions - from data sheet
#define FNSR_M95160_WREN             0x06    // write enable
#define FNSR_M95160_WRDI             0x04    // write disable
#define FNSR_M95160_RDSR             0x05    // read status register
#define FNSR_M95160_WRSR             0x01    // write status reguster
#define FNSR_M95160_READ             0x03    // read from memory array
#define FNSR_M95160_WRITE            0x02    // write to memory array

#define FNSR_M95160_RDSR_SRWD        0x80    // read status register
#define FNSR_M95160_RDSR_BP1         0x08
#define FNSR_M95160_RDSR_BP0         0x04
#define FNSR_M95160_RDSR_WEL         0x02
#define FNSR_M95160_RDSR_WIP         0x01

#define FNSR_M95160_WR_HEADER_LEN   0x03 // 1 byte for instruction, 2 for address
#define FNSR_M95160_RD_HEADER_LEN   0x03 // 1 byte for instruction, 2 for address
#define FNSR_M95160_RDSR_HDR_LEN    0x01 // 1 byte for instruction
#define FNSR_M95160_WREN_HDR_LEN    0x01 // 1 byte for instruction
#define FNSR_M95160_RDWR_BUF_LEN    FNSR_M95160_SIZE_PAGE_BYTES // size of read buffer & write buffer

typedef enum {
  EEP_STATUS_IDLE,            // idle
  EEP_RD_IPRG,                // read in progress
  EEP_WR_IPRG,                // write in progress
} fnsr_eep_drv_status_e; // eeprom status

typedef struct {
  GPIO_TypeDef* GPIOx;
  uint16_t  cs_gpio; // chip select GPIO
  uint16_t  wr_protect_gpio;
  uint16_t  hold_gpio;

  uint16_t  size_total_bytes;
  uint16_t  size_page_bytes;
  uint8_t   status_reg;
  uint8_t   wr_buf[FNSR_M95160_WR_HEADER_LEN + FNSR_M95160_RDWR_BUF_LEN];
  uint8_t   rd_buf[FNSR_M95160_RD_HEADER_LEN + FNSR_M95160_RDWR_BUF_LEN];
  uint32_t  tW_prd;
  uint32_t  ms_prd;
} fnsr_eep_m95160_info_t;

uint8_t drv_eep_is_available(unsigned short * addr);


static short (*ptr_drv_eeprom_read)(unsigned short addr, unsigned char *buf, unsigned short length );
static short (*ptr_drv_eeprom_write)(unsigned short addr, unsigned char *buf, unsigned short length );
void qsfp_eeprom_driver_enable(short (*ptr_eeprom_read)(unsigned short addr, unsigned char *buf, unsigned short length ),
                               short (*ptr_eeprom_write)(unsigned short addr, unsigned char *buf, unsigned short length ));
short drv_eep_rd_n(uint16_t src_addr, uint8_t *dst, uint16_t bytes);
short drv_eep_wr_n(uint16_t dst_addr, uint8_t *src, uint16_t bytes);

uint8_t drv_eep_init(GPIO_TypeDef* GPIOx,
                     uint16_t cs_gpio, 
                     uint16_t wr_protect_gpio, 
                     uint16_t hold_gpio, 
                     uint32_t tW_prd, 
                     uint32_t ms_prd);
uint8_t drv_eep_write_enable(void);
uint8_t drv_eep_status_rd(uint8_t *dst);
void drv_eep_check(void);
uint8_t drv_eep_is_idle(void);
 
 
#endif // ndef __ARM_DRV_EEP_M95160_H__

