/**
  ******************************************************************************
  * @file    LTC2380.c  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   LTC2380 driver
  ******************************************************************************
**/ 

#include "include.h"

#define LTC2380_SPI_PORT SPI1
#define LTC2380_MUX_NUM 15u
#define LTC2380_DEV_ISAMP 0
#define LTC2380_DEV_VSAMP 1

#define LTC2380_SDI_HIGH 1
#define LTC2380_SDI_LOW  0

#define LTC2380_READ_CHECK_ENA 1
#define LTC2380_READ_CHECK_DIS 0

#define LTC2380_READ_CHECK LTC2380_READ_CHECK_ENA
#define LTC2380_READ_CHECK_MSK  0xFF00


static void LTC2380_ISAMP_ena(void);
static void LTC2380_ISAMP_dis(void);
static void LTC2380_VSAMP_ena(void);
static void LTC2380_VSAMP_dis(void);
static void LTC2380_choose_mux(uint16_t channel);

static void LTC2380_start_CNV(uint8_t dev);
static void LTC2380_select_SDI(uint8_t dev, uint8_t level);
static void LTC2380_wait_BUSY(uint8_t dev);
static uint8_t LTC2380_read_SDO(uint16_t *rdata);
static uint8_t LTC2380_read_data(uint8_t dev, uint16_t *rdata);
static uint8_t LTC2380_read_data_chk(uint8_t dev, uint16_t *rdata);

static uint8_t LTC2380_read_ISAMP(uint16_t *rdata);
static uint8_t LTC2380_read_VSAMP(uint16_t *rdata);


void LTC2380_init(void)
{
    LTC2380_select_SDI(LTC2380_DEV_ISAMP,LTC2380_SDI_HIGH);
    LTC2380_select_SDI(LTC2380_DEV_VSAMP,LTC2380_SDI_HIGH);
    LTC2380_ISAMP_dis();
    LTC2380_VSAMP_dis();
    LTC2380_ISAMP_ena();
    LTC2380_VSAMP_ena();
    LTC2380_choose_mux(0);
}

uint8_t LTC2380_read_ISAMP_ch(uint16_t channel, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    if((void *)0 == rdata)
        return ERROR;
    LTC2380_choose_mux(channel);
    ret = LTC2380_read_ISAMP(rdata);

    return ret;  
}
uint8_t LTC2380_read_VSAMP_ch(uint16_t channel, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    if((void *)0 == rdata)
        return ERROR;
    LTC2380_choose_mux(channel);
    ret = LTC2380_read_VSAMP(rdata);

    return ret; 

}


static uint8_t LTC2380_read_ISAMP(uint16_t *rdata)
{
    uint8_t ret = ERROR;
    if((void *)0 == rdata)
        return ERROR;
    ret = LTC2380_read_data_chk(LTC2380_DEV_ISAMP, rdata);
    return ret;
}



static uint8_t LTC2380_read_VSAMP(uint16_t *rdata)
{
    uint8_t ret = ERROR;
    if((void *)0 == rdata)
        return ERROR;
    ret = LTC2380_read_data_chk(LTC2380_DEV_VSAMP, rdata);
    return ret;
}


static void LTC2380_ISAMP_ena(void)
{ 
    GPIOC->BSRR |=GPIO_Pin_4;
}
static void LTC2380_ISAMP_dis(void) 
{    
    GPIOC->BRR |= GPIO_Pin_4;
}

static void LTC2380_VSAMP_ena(void)
{ 
    GPIOC->BSRR |=GPIO_Pin_5;
}
static void LTC2380_VSAMP_dis(void) 
{    
    GPIOC->BRR |= GPIO_Pin_5;
}

static void LTC2380_choose_mux(uint16_t channel)
{
    if(channel > LTC2380_MUX_NUM)
        channel = 0;
    
    GPIOC->BRR |= 0x000F;
    channel &= 0x000F;
    GPIOC->BSRR |= channel;
    Delay_ms(10);
}



static void LTC2380_start_CNV(uint8_t dev)
{
    if(LTC2380_DEV_ISAMP == dev)
    {
        GPIOA->BRR |= GPIO_Pin_9;
        Delay_us(1);
        GPIOA->BSRR |= GPIO_Pin_9;
        Delay_us(1);
        GPIOA->BRR |= GPIO_Pin_9;
        Delay_us(1);
    }
    else if(LTC2380_DEV_VSAMP == dev)
    {
        GPIOA->BRR |= GPIO_Pin_8;
        Delay_us(1);
        GPIOA->BSRR |= GPIO_Pin_8;
        Delay_us(1);
        GPIOA->BRR |= GPIO_Pin_8;
        Delay_us(1);
    }
    else
    {

    }
}


static void LTC2380_select_SDI(uint8_t dev, uint8_t level)
{
    if(LTC2380_DEV_ISAMP == dev)
    {
        if(LTC2380_SDI_HIGH == level)
        {
            GPIOC->BSRR |= GPIO_Pin_6;
        }
        else
        {
            GPIOC->BRR |= GPIO_Pin_6;
        }
    }
    else if(LTC2380_DEV_VSAMP == dev)
    {
        if(LTC2380_SDI_HIGH == level)
        {
            GPIOC->BSRR |= GPIO_Pin_7;
        }
        else
        {
            GPIOC->BRR |= GPIO_Pin_7;
        }
    }
    else
    {

    }
}





static void LTC2380_wait_BUSY(uint8_t dev)
{
    uint16_t timeout = 1000u;


    if(LTC2380_DEV_ISAMP == dev)
    {
        while (((GPIOB->IDR & GPIO_Pin_9) != (uint32_t)Bit_RESET) && timeout > 0)
        {
            timeout--;
        }
    }
    else if(LTC2380_DEV_VSAMP == dev)
    {
        while (((GPIOB->IDR & GPIO_Pin_8) != (uint32_t)Bit_RESET) && timeout > 0)
        {
            timeout--;
        }
    }
    else
    {

    }

}


static uint8_t LTC2380_read_SDO(uint16_t *rdata)
{
    uint8_t ret = ERROR;

    if((void *)0 == rdata)
        return ERROR;
    
    ret = drv_spi_access_short(LTC2380_SPI_PORT, 0x0000, rdata);
    return ret;

}

static uint8_t LTC2380_read_data(uint8_t dev, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    if((void *)0 == rdata)
        return ERROR;

    LTC2380_start_CNV(dev);
    LTC2380_select_SDI(dev,LTC2380_SDI_LOW);
    LTC2380_wait_BUSY(dev);
    ret = LTC2380_read_SDO(rdata);
    LTC2380_select_SDI(dev,LTC2380_SDI_HIGH);
    return ret;
}

static uint8_t LTC2380_read_data_chk(uint8_t dev, uint16_t *rdata)
{
    uint8_t ret = ERROR;
    uint16_t adc_data0 = 0;
    uint16_t adc_data1 = 0;
    
    if((void *)0 == rdata)
        return ERROR;

    ret = LTC2380_read_data(dev, &adc_data0);
#if(LTC2380_READ_CHECK == LTC2380_READ_CHECK_ENA)
    /*read twice to check ADC results*/
    if(SUCCESS == ret)
    {
        ret = LTC2380_read_data(dev, &adc_data1);
        if( (adc_data0 & LTC2380_READ_CHECK_MSK) == (adc_data1 & LTC2380_READ_CHECK_MSK) )
        {
            *rdata = (uint16_t)(((uint32_t)adc_data0 + (uint32_t)adc_data1)>>1);
            ret = SUCCESS;
        }
        else
        {
            *rdata = 0;
            ret = ERROR;
        }
    }
    else
    {
        *rdata = 0;
        ret = ERROR;
    }
#else    
    if(SUCCESS == ret)
    {
        *rdata = adc_data0;
        ret = SUCCESS;
    }
    else
    {
        *rdata = 0;
        ret = ERROR;
    } 
#endif
    return ret;

}






#ifdef DEBUG_LTC2380



uint16_t LTC2380_ISAMP_buf[16];
uint16_t LTC2380_VSAMP_buf[16];


void test_ltc2380(void)
{
    uint16_t i,j;
    for(i=0;i<16;i++)
    {
        LTC2380_choose_mux(i);
        Delay_ms(2);
        for(j=0;j<4;j++)
        {
            LTC2380_read_ISAMP(&LTC2380_ISAMP_buf[i]);
            LTC2380_read_VSAMP(&LTC2380_VSAMP_buf[i]);
        }
    }

}



void test_LTC2380_init(void)
{
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOC, ENABLE);
   
    GPIO_InitTypeDef GPIO_InitStructure;
#if 0 
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_All;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;  
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_All;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;  
    GPIO_Init(GPIOB, &GPIO_InitStructure);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_All;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;  
    GPIO_Init(GPIOC, &GPIO_InitStructure);
    
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;  
    GPIO_Init(GPIOA, &GPIO_InitStructure);  
#endif


    GPIO_InitStructure.GPIO_Pin = (GPIO_Pin_0| GPIO_Pin_1| GPIO_Pin_2 | GPIO_Pin_3| GPIO_Pin_4| GPIO_Pin_5 | GPIO_Pin_6| GPIO_Pin_7);  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; 
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOC, &GPIO_InitStructure);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8| GPIO_Pin_9;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; 
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);


    SPI_InitTypeDef   SPI_InitStructure;
    SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;  
    SPI_InitStructure.SPI_Mode = SPI_Mode_Master;  
    SPI_InitStructure.SPI_DataSize = SPI_DataSize_16b;  
    SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;  
    SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;  
    //  SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;
    //  SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;
    SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;  
    SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_256;  
    SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;  
    SPI_InitStructure.SPI_CRCPolynomial = 7;  
    SPI_Init(SPI1, &SPI_InitStructure);  
    SPI_Cmd(SPI1, ENABLE); 

    LTC2380_select_SDI(LTC2380_DEV_ISAMP,LTC2380_SDI_HIGH);
    LTC2380_select_SDI(LTC2380_DEV_VSAMP,LTC2380_SDI_HIGH);
    LTC2380_ISAMP_dis();
    LTC2380_VSAMP_dis();
    LTC2380_ISAMP_ena();
    LTC2380_VSAMP_ena();
}






#endif

 /******************* (C) COPYRIGHT  *****END OF FILE****/
