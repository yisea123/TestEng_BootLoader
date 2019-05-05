/**
  ******************************************************************************
  * @file    LTC2620.c  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   LTC2620 driver
  ******************************************************************************
**/ 

#include "include.h"

#define  CMD_WRITE_N               0x00  /*Write to input register n*/
#define  CMD_UPDATE_N              0x10  /*Update (power up) DAC register n*/
#define  CMD_WRITE_N_UPDATE_ALL    0x20  /*Write to input register n, update (power-up) all*/
#define  CMD_WRITE_N_UPDATE_N      0x30  /*Write to input register n, update (power-up) */
#define  CMD_POWER_DOWN_N          0x40  /*Power down n*/
#define  CMD_NO_OPERATION          0xF0  /*No operation*/

uint16_t ltc2620_au16[LTC2620_CHANNEL8 + 1][2] = {0};

static uint8_t LTC2620_Spi_command_write(SPI_TypeDef* SPIx, uint16_t * w_data, uint16_t * r_data);
static uint8_t LTC2620_Write_Register(uint8_t reg, uint8_t chan, uint16_t w_data);



void LTC2620_init(void)
{
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_1);
    LTC2620_Powerdown_all();
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_2);
    LTC2620_Powerdown_all();
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_3);
    LTC2620_Powerdown_all();
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_4);
    LTC2620_Powerdown_all();
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
}


static uint8_t LTC2620_Spi_command_write(SPI_TypeDef* SPIx, uint16_t * w_data, uint16_t * r_data)
{
    uint8_t ret = ERROR;
    if( ((void *)0 == w_data) || ((void *)0 == r_data) )
        return ERROR;
    
    ret = drv_spi_access_short(LTC2620_SPI_PORT,*w_data,r_data);
    if(SUCCESS == ret )
    {
        ret = drv_spi_access_short(LTC2620_SPI_PORT,*(w_data+1),(r_data+1));
    }
    else
    {
        /**/
    }
    return ret;
    
}

static uint8_t LTC2620_Write_Register(uint8_t reg, uint8_t chan, uint16_t w_data)
{
    uint8_t ret;
    uint16_t wdata[2];
    uint16_t *rdata; 

    if(chan > LTC2620_CHANNEL8)
        return ERROR;
    rdata = ltc2620_au16[chan];
    
    wdata[0] = (reg & 0x00F0) | (chan & 0x000F);
    wdata[1] = w_data;

    if((void *)0 == rdata)
        return ERROR;

    ret = LTC2620_Spi_command_write(LTC2620_SPI_PORT, wdata, rdata);
    return ret;
}


uint8_t LTC2620_Write_n(uint16_t chan, uint16_t w_data)
{
    uint8_t ret = ERROR;
    if(chan > LTC2620_CHANNEL8)
        return ERROR;

    ret = LTC2620_Write_Register(CMD_WRITE_N, chan, w_data);

    return ret;
}
uint8_t LTC2620_Updata_n(uint16_t chan, uint16_t w_data)
{
     uint8_t ret = ERROR;
     if(chan > LTC2620_CHANNEL8)
         return ERROR;

     ret = LTC2620_Write_Register(CMD_UPDATE_N, chan, w_data);

     return ret;
}
uint8_t LTC2620_Write_n_Updata_n(uint16_t chan, uint16_t w_data)
{
    uint8_t ret = ERROR;
    if(chan > LTC2620_CHANNEL8)
        return ERROR;

    ret = LTC2620_Write_Register(CMD_WRITE_N_UPDATE_N, chan, w_data);

    return ret;
}

uint8_t LTC2620_Powerdown_n(uint16_t chan)
{
     uint8_t ret = ERROR;
     if(chan > LTC2620_CHANNEL8)
         return ERROR;

     ret = LTC2620_Write_Register(CMD_POWER_DOWN_N, chan, 0xFFFF);

     return ret;
}

uint8_t LTC2620_Write_all(uint16_t w_data)
{
    uint8_t ret = ERROR;
    uint16_t i;
    for(i=0; i <= LTC2620_CHANNEL8; i++)
    {
        ret = LTC2620_Write_n(i, w_data);
    }

    return ret;
}

uint8_t LTC2620_Updata_all(uint16_t w_data)
{
    uint8_t ret = ERROR;
    uint16_t i;
    for(i=0; i <= LTC2620_CHANNEL8; i++)
    {
        ret = LTC2620_Updata_n(i, w_data);
    }

    return ret;
}



uint8_t LTC2620_Write_all_Updata_all(uint16_t w_data)
{
    uint8_t ret = ERROR;
    uint16_t i;
    for(i=0; i <= LTC2620_CHANNEL8; i++)
    {
        ret = LTC2620_Write_n_Updata_n(i, w_data);
    }

    return ret;
}


uint8_t LTC2620_Powerdown_all(void)
{
    uint8_t ret = ERROR;
    uint16_t i;
    for(i=0; i <= LTC2620_CHANNEL8; i++)
    {
        ret = LTC2620_Powerdown_n(i);
    }

    return ret;
}



#ifdef DEBUG_LTC2620


static uint16_t ltc2620_all= 0x8000;
void test_ltc2620_ini(void)
{
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOC, ENABLE);
   
    GPIO_InitTypeDef GPIO_InitStructure;
#if 1 
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
#endif

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;  
    GPIO_Init(GPIOB, &GPIO_InitStructure);  

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6| GPIO_Pin_7| GPIO_Pin_8| GPIO_Pin_9; 
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOC,&GPIO_InitStructure);


    SPI_InitTypeDef   SPI_InitStructure;
    SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;  
    SPI_InitStructure.SPI_Mode = SPI_Mode_Master;  
    SPI_InitStructure.SPI_DataSize = SPI_DataSize_16b;  
    SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;  
    SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;  
    SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;  
    SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_4;  
    SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;  
    SPI_InitStructure.SPI_CRCPolynomial = 7;  
    SPI_Init(SPI2, &SPI_InitStructure);  
    SPI_Cmd(SPI2, ENABLE); 
}
void test_ltc2620(void)
{
#if 0
    static uint16_t ltc2620_code[16] = {0x1234, 0x2345, 0x3456,0xaa55,0x7977,0x304,0x887,0x987,0xf300,0x4646,0x6764,0x1235,0x1313,0x2569,0xddef,0xaa98,};
    uint8_t i;
    for(i=0; i<(LTC2620_CHANNEL8+1); i++)
    {
        LTC2620_Write_n_Updata_n(i, ltc2628_code[i]);
        Delay_ms(10);
    }
    for(i=0; i<(LTC2620_CHANNEL8+1); i++)
    {
        LTC2620_Write_n_Updata_n(i, 0);
        Delay_ms(10);
    }
    for(i=0; i<(LTC2620_CHANNEL8+1); i++)
    {
        LTC2620_Write_n_Updata_n(i, ltc2628_code[i]);
        Delay_ms(10);
    }
    for(i=0; i<(LTC2620_CHANNEL8+1); i++)
    {
        LTC2620_Write_n_Updata_n(i, 0);
        Delay_ms(10);
    }
    for(i=0; i<(LTC2620_CHANNEL8+1); i++)
    {
        LTC2620_Powerdown_n(i);
        Delay_ms(10);
        LTC2620_Powerdown_n(i);
    }
#endif
    uint8_t i;

    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_1);
    Delay_ms(10);
    for(i=0; i<8; i++)
    {
        LTC2620_Write_n_Updata_n(i, ltc2620_all);
        Delay_ms(10);
    }

    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_2);
    Delay_ms(10);
    for(i=0; i<8; i++)
    {
        LTC2620_Write_n_Updata_n(i, ltc2620_all);
        Delay_ms(10);
    }
    
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_3);
    Delay_ms(10);
    for(i=0; i<8; i++)
    {
        LTC2620_Write_n_Updata_n(i, ltc2620_all);
        Delay_ms(10);
    }
    
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_4);
    Delay_ms(10);
    for(i=0; i<8; i++)
    {
        LTC2620_Write_n_Updata_n(i, ltc2620_all);
        Delay_ms(10);
    }
    
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_1);
    for(i=0; i<8; i++)
    {
        LTC2620_Powerdown_n(i);
        Delay_ms(10);
    }

    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_2);
    Delay_ms(10);
    for(i=0; i<8; i++)
    {
        LTC2620_Powerdown_n(i);
        Delay_ms(10);
    }
    
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_3);
    Delay_ms(10);
    for(i=0; i<8; i++)
    {
        LTC2620_Powerdown_n(i);
        Delay_ms(10);
    }
    
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_NONE);
    DRV_SPI_CS_LTC2620(LTC2620_CHIP_ID_4);
    Delay_ms(10);
    for(i=0; i<8; i++)
    {
        LTC2620_Powerdown_n(i);
        Delay_ms(10);
    }

#if 0
    Delay_ms(10);
    LTC2620_Write_all_Updata_all(ltc2620_all);
    Delay_ms(10);
    LTC2620_Powerdown_all();
    #endif
}
#endif
