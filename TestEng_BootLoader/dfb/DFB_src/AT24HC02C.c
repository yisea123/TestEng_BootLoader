/**
  ******************************************************************************
  * @file    AT24HC02C.c  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   AT24HC02C driver
  ******************************************************************************
**/ 


#include "include.h"

typedef void (*AT24HC02C_wp_func)(uint8_t wp);
typedef struct
{
    uint8_t AT24HC02C_dev_addr;
    AT24HC02C_size_t AT24HC02C_mem_size;
    AT24HC02C_size_t AT24HC02C_page_size;
    AT24HC02C_size_t AT24HC02C_page_mask;
    I2C_TypeDef* AT24HC02C_i2c_port;
#if (AT24HC02C_WP_CONF == AT24HC02C_WP_ENABLE)
    AT24HC02C_wp_func AT24HC02C_wp_p2f;
#endif
}AT24HC02C_dev_info_tst;

#if (AT24HC02C_WP_CONF == AT24HC02C_WP_ENABLE)
static void AT24HC02C_drv_wp(uint8_t wp)
{


}
#endif

const AT24HC02C_dev_info_tst AT24HC02C_dev_info_cast[AT24HC02C_DEVICE_NUM] = 
{
    { 
        AT24HC02C_DEVICE_0_ADDR,
        AT24HC02C_MEM_SIZE,
        AT24HC02C_PAGE_SIZE,
        AT24HC02C_PAGE_MASK,
        AT24HC02C_I2C_PORT, 
#if (AT24HC02C_WP_CONF == AT24HC02C_WP_ENABLE)
        AT24HC02C_WP_FUNC
#endif
    },
};




static uint8_t AT24HC02C_drv_wr_n_bytes(uint8_t dev_id, AT24HC02C_size_t addr, AT24HC02C_size_t length, uint8_t * data)
{
    uint8_t i;
    uint8_t ret = SUCCESS;
    uint8_t dev_addr;
    I2C_TypeDef* i2c_port;
    
#if (AT24HC02C_WP_CONF == AT24HC02C_WP_ENABLE)
        AT24HC02C_wp_func wp_func;
#endif

    AT24HC02C_size_t mem_size;
    AT24HC02C_size_t page_size;
    AT24HC02C_size_t page_mask;

    AT24HC02C_size_t page_cntr;
    AT24HC02C_size_t residual_bytes;

    AT24HC02C_size_t head_len;
    AT24HC02C_size_t data_ptr = 0;
    
    mem_size = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_mem_size;
    if( (dev_id >= AT24HC02C_DEVICE_NUM) || 
        (addr > mem_size) || 
        (addr+length > mem_size) || 
        ((void*)0 == data) )
    {
        ret = ERROR;
    }
    else
    {

        page_size = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_page_size;
        page_mask = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_page_mask;
        dev_addr = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_dev_addr;
        i2c_port = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_i2c_port;
        
#if (AT24HC02C_WP_CONF == AT24HC02C_WP_ENABLE)
        wp_func  = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_wp_p2f;
        wp_func(0);
#endif

        head_len = addr & page_mask;
        if(head_len)
        {
            head_len = page_size - head_len;
            ret = I2c_command_write(i2c_port, addr, head_len, dev_addr, &data[data_ptr]);
            Delay_ms(4);
            addr += head_len;
            data_ptr += head_len;
        }
        length -= head_len;
        page_cntr = length / page_size;
        residual_bytes = length % page_size;

        for(i=0; i<page_cntr; i++)
        {
            ret &= I2c_command_write(i2c_port, addr, page_mask, dev_addr, &data[data_ptr]);
            Delay_ms(4);
            addr += page_mask;
            data_ptr += page_mask;
            ret &= I2c_command_write(i2c_port, addr, 1, dev_addr, &data[data_ptr]);
            Delay_ms(4);
            data_ptr++;
            addr ++;
        }
        
        if(residual_bytes)
        {
            ret &= I2c_command_write(i2c_port, addr, residual_bytes, dev_addr, &data[data_ptr]);
            Delay_ms(4);
        }
#if (AT24HC02C_WP_CONF == AT24HC02C_WP_ENABLE)
        wp_func(1);
#endif
    }

    return ret;
}

static uint8_t AT24HC02C_drv_rd_n_bytes(uint8_t dev_id, AT24HC02C_size_t addr, AT24HC02C_size_t length, uint8_t * data)
{
    uint8_t ret = SUCCESS;
    uint8_t dev_addr;
    I2C_TypeDef* i2c_port;
    AT24HC02C_size_t mem_size;

    mem_size = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_mem_size;

    if( (dev_id >= AT24HC02C_DEVICE_NUM) || 
        (addr > mem_size) || 
        (addr+length > mem_size) || 
        ((void*)0 == data) )
    {
        ret = ERROR;
    }
    if(ERROR != ret)
    {
        dev_addr = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_dev_addr;
        mem_size = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_mem_size;
        i2c_port = AT24HC02C_dev_info_cast[dev_id].AT24HC02C_i2c_port;

        I2c_command_read(i2c_port, addr, length, dev_addr, data);
        ret = SUCCESS;
    }
    return ret;
}

uint8_t AT24HC02C_wr_n_bytes(uint8_t dev_id, AT24HC02C_size_t addr, AT24HC02C_size_t length, uint8_t * data)
{
    uint8_t ret;

    ret = AT24HC02C_drv_wr_n_bytes(dev_id, addr, length, data);

    return ret;
}

uint8_t AT24HC02C_rd_n_bytes(uint8_t dev_id, AT24HC02C_size_t addr, AT24HC02C_size_t length, uint8_t * data)
{
    uint8_t ret;

    ret = AT24HC02C_drv_rd_n_bytes(dev_id, addr, length, data);

    return ret;

}

#ifdef DEBUG_AT24HC02C
uint8_t eep_rd_data[256];
uint8_t eep_wr_data[256] = {0x12,0x23, 0x34, 0x45,0x56,0xcc,0xdd,0xee};

void test_eep()
{
#if 0
        AT24HC02C_wr_n_bytes(0, 0, 1, &eep_wr_data[0]);
        AT24HC02C_wr_n_bytes(0, 1, 1, &eep_wr_data[1]);
        AT24HC02C_wr_n_bytes(0, 2, 1, &eep_wr_data[2]);
        AT24HC02C_wr_n_bytes(0, 3, 1, &eep_wr_data[3]);
        AT24HC02C_wr_n_bytes(0, 4, 1, &eep_wr_data[4]);
        AT24HC02C_wr_n_bytes(0, 5, 1, &eep_wr_data[5]);
        AT24HC02C_wr_n_bytes(0, 6, 1, &eep_wr_data[6]);
        AT24HC02C_wr_n_bytes(0, 7, 1, &eep_wr_data[7]);
        AT24HC02C_wr_n_bytes(0, 8, 1, &eep_wr_data[8]);
        AT24HC02C_wr_n_bytes(0, 9, 1, &eep_wr_data[9]);
        AT24HC02C_wr_n_bytes(0, 10, 1, &eep_wr_data[10]);
        AT24HC02C_wr_n_bytes(0, 11, 1, &eep_wr_data[11]);
        AT24HC02C_wr_n_bytes(0, 12, 1, &eep_wr_data[12]);


        
        AT24HC02C_rd_n_bytes(0, 0, 1, &eep_rd_data[0]);
        AT24HC02C_rd_n_bytes(0, 1, 1, &eep_rd_data[1]);
        AT24HC02C_rd_n_bytes(0, 2, 1, &eep_rd_data[2]);
        AT24HC02C_rd_n_bytes(0, 3, 1, &eep_rd_data[3]);
        AT24HC02C_rd_n_bytes(0, 4, 1, &eep_rd_data[4]);
        AT24HC02C_rd_n_bytes(0, 5, 1, &eep_rd_data[5]);
        AT24HC02C_rd_n_bytes(0, 6, 1, &eep_rd_data[6]);
        AT24HC02C_rd_n_bytes(0, 7, 1, &eep_rd_data[7]);
        AT24HC02C_rd_n_bytes(0, 8, 1, &eep_rd_data[8]);
        AT24HC02C_rd_n_bytes(0, 9, 1, &eep_rd_data[9]);
        AT24HC02C_rd_n_bytes(0, 10, 1, &eep_rd_data[10]);
        AT24HC02C_rd_n_bytes(0, 11, 1, &eep_rd_data[11]);
        AT24HC02C_rd_n_bytes(0, 12, 1, &eep_rd_data[12]);
#endif
#if 0
        AT24HC02C_wr_n_bytes(0, 0, 2, &eep_wr_data[0]);
        Delay_ms(1);
        AT24HC02C_wr_n_bytes(0, 2, 2, &eep_wr_data[2]);
        Delay_ms(1);
        AT24HC02C_wr_n_bytes(0, 4, 2, &eep_wr_data[4]);
        Delay_ms(1);
        AT24HC02C_wr_n_bytes(0, 6, 2, &eep_wr_data[6]);
        Delay_ms(1);
        AT24HC02C_wr_n_bytes(0, 8, 2, &eep_wr_data[8]);
        Delay_ms(1);
        AT24HC02C_wr_n_bytes(0, 10, 2, &eep_wr_data[10]);
        Delay_ms(1);
        
        AT24HC02C_rd_n_bytes(0, 0, 1, &eep_rd_data[0]);
        AT24HC02C_rd_n_bytes(0, 1, 1, &eep_rd_data[1]);
        AT24HC02C_rd_n_bytes(0, 2, 1, &eep_rd_data[2]);
        AT24HC02C_rd_n_bytes(0, 3, 1, &eep_rd_data[3]);
        AT24HC02C_rd_n_bytes(0, 4, 1, &eep_rd_data[4]);
        AT24HC02C_rd_n_bytes(0, 5, 1, &eep_rd_data[5]);
        AT24HC02C_rd_n_bytes(0, 6, 1, &eep_rd_data[6]);
        AT24HC02C_rd_n_bytes(0, 7, 1, &eep_rd_data[7]);
        AT24HC02C_rd_n_bytes(0, 8, 1, &eep_rd_data[8]);
        AT24HC02C_rd_n_bytes(0, 9, 1, &eep_rd_data[9]);
        AT24HC02C_rd_n_bytes(0, 10, 1, &eep_rd_data[10]);
        AT24HC02C_rd_n_bytes(0, 11, 1, &eep_rd_data[11]);
        AT24HC02C_rd_n_bytes(0, 12, 1, &eep_rd_data[12]);
        
        AT24HC02C_rd_n_bytes(0, 0, 2, &eep_rd_data[0]);
        Delay_ms(1);
        AT24HC02C_rd_n_bytes(0, 2, 2, &eep_rd_data[2]);
        Delay_ms(1);
        AT24HC02C_rd_n_bytes(0, 4, 2, &eep_rd_data[4]);
        Delay_ms(1);
        AT24HC02C_rd_n_bytes(0, 6, 2, &eep_rd_data[6]);
        Delay_ms(1);
        AT24HC02C_rd_n_bytes(0, 8, 2, &eep_rd_data[8]);
        Delay_ms(1);
        AT24HC02C_rd_n_bytes(0, 10, 2, &eep_rd_data[10]);
        Delay_ms(1);
#endif
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]);
        Delay_ms(4);
#if 0

        uint16_t i=0;
        
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0xbb;
        }
        AT24HC02C_wr_n_bytes(0, 6, 11, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]);
        
        Delay_ms(1000);
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0;
        }
        AT24HC02C_wr_n_bytes(0, 0, 256, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]); 
        
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0xdd;
        }
        AT24HC02C_wr_n_bytes(0, 8, 8, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]);

        Delay_ms(1000);
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0;
        }
        AT24HC02C_wr_n_bytes(0, 0, 256, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]); 
        
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0x33;
        }
        AT24HC02C_wr_n_bytes(0, 8, 56, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]);

        Delay_ms(1000);
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0;
        }
        AT24HC02C_wr_n_bytes(0, 0, 256, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]); 
        

        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0x44;
        }
        AT24HC02C_wr_n_bytes(0, 16, 23, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]);

        Delay_ms(1000);
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0;
        }
        AT24HC02C_wr_n_bytes(0, 0, 256, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]); 
        

        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0xaa;
        }
        AT24HC02C_wr_n_bytes(0, 129, 23, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]);
        
        Delay_ms(1000);
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0;
        }
        AT24HC02C_wr_n_bytes(0, 0, 256, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]); 

        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0x55;
        }
        AT24HC02C_wr_n_bytes(0, 168, 24, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]);
        
        Delay_ms(1000);
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0;
        }
        AT24HC02C_wr_n_bytes(0, 0, 256, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]); 

         for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0x66;
        }
        AT24HC02C_wr_n_bytes(0, 192, 24, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]);       
        
        Delay_ms(1000);
        for(i=0; i<256;i++)
        {
            eep_wr_data[i] = 0;
        }
        AT24HC02C_wr_n_bytes(0, 0, 256, &eep_wr_data[0]);
        AT24HC02C_rd_n_bytes(0, 0, 256, &eep_rd_data[0]); 

#endif
}
#endif
/******************* (C) COPYRIGHT 2018 *****END OF FILE****/


