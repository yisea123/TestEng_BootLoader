/**
  ******************************************************************************
  * @file    AT24HC02C.h  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   AT24HC02C driver
  ******************************************************************************
**/ 

#ifndef AT24HC02C_H
#define AT24HC02C_H

#define AT24HC02C_I2C_PORT I2C1

#define AT24HC02C_DEVICE_NUM      1U
#define AT24HC02C_DEVICE_0_ADDR   0xA0

/*EEP volume*/
#define AT24HC02C_MEM_SIZE         256u
#define AT24HC02C_PAGE_SIZE    (8u)
#define AT24HC02C_PAGE_MASK    (AT24HC02C_PAGE_SIZE - 1u)


#define AT24HC02C_WP_ENABLE   1
#define AT24HC02C_WP_DISABLE  0
#define AT24HC02C_WP_CONF AT24HC02C_WP_DISABLE

#if (AT24HC02C_WP_CONF == AT24HC02C_WP_ENABLE)
#define AT24HC02C_WP_FUNC AT24HC02C_drv_wp
#endif

typedef uint16_t AT24HC02C_size_t;

extern uint8_t AT24HC02C_wr_n_bytes(uint8_t dev_id, AT24HC02C_size_t addr, AT24HC02C_size_t length, uint8_t * data);
extern uint8_t AT24HC02C_rd_n_bytes(uint8_t dev_id, AT24HC02C_size_t addr, AT24HC02C_size_t length, uint8_t * data);

//#define DEBUG_AT24HC02C
#ifdef DEBUG_AT24HC02C
extern void test_eep_init(void);
extern void test_eep(void);

#endif

#endif

/*(C) COPYRIGHT 2018  *****END OF FILE****/


