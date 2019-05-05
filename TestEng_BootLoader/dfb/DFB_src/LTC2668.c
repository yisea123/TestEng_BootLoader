/**
  ******************************************************************************
  * @file    LTC2668.c  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   LTC2668 driver
  ******************************************************************************
**/ 

#include "include.h"

#define  CMD_WRITE_N               0x00  /*Write to input register n*/
#define  CMD_UPDATE_N              0x10  /*Update (power up) DAC register n*/
#define  CMD_WRITE_N_UPDATE_ALL    0x20  /*Write to input register n, update (power-up) all*/
#define  CMD_WRITE_N_UPDATE_N      0x30  /*Write to input register n, update (power-up) */
#define  CMD_POWER_DOWN_N          0x40  /*Power down n*/
#define  CMD_POWER_DOWN_ALL        0x50  /*Power down chip (all DAC's, MUX and reference)*/
#define  CMD_SPAN                  0x60  /*Write span to dac n*/
#define  CMD_CONFIG                0x70  /*Configure reference / toggle*/
#define  CMD_WRITE_ALL             0x80  /*Write to all input registers*/
#define  CMD_UPDATE_ALL            0x90  /*Update all DACs*/
#define  CMD_WRITE_ALL_UPDATE_ALL  0xA0  /*Write to all input reg, update all DACs*/
#define  CMD_MUX                   0xB0  /*Select MUX channel (controlled by 5 LSbs in data word)*/
#define  CMD_TOGGLE_SEL            0xC0  /*Select which DACs can be toggled (via toggle pin or global toggle bit)*/
#define  CMD_GLOBAL_TOGGLE         0xD0  /*Software toggle control via global toggle bit*/
#define  CMD_SPAN_ALL              0xE0  /*Set span for all DACs*/
#define  CMD_NO_OPERATION          0xF0  /*No operation*/

#define  LTC2668_SPAN_0_TO_5V         0x0000
#define  LTC2668_SPAN_0_TO_10V        0x0001
#define  LTC2668_SPAN_PLUS_MINUS_5V   0x0002
#define  LTC2668_SPAN_PLUS_MINUS_10V  0x0003
#define  LTC2668_SPAN_PLUS_MINUS_2V5  0x0004


#define LTC2628_SPI_PORT SPI1

#define SPI_CS_LTC2668 0x00
#define SPI_CS_NONE    0xFF
#define DRV_SPI_CS_LTC2628() drv_spi_cs(SPI_CS_LTC2668)
#define DRV_SPI_CS_NONE()    drv_spi_cs(SPI_CS_NONE)

uint16_t ltc2668_au16[16][2] = {0};

void ltc2628_init(void)
{
    LTC2668_Powerdown_all();

}
void drv_spi_cs(uint8_t dev_id)
{
    if(SPI_CS_LTC2668 == dev_id)
    {
        GPIO_SetBits(GPIOA,GPIO_Pin_8);
        GPIO_SetBits(GPIOA,GPIO_Pin_9);
        GPIO_SetBits(GPIOA,GPIO_Pin_10);
        GPIO_SetBits(GPIOB,GPIO_Pin_12);
        GPIO_ResetBits(GPIOB,GPIO_Pin_12);
    }
    else
    {
        GPIO_SetBits(GPIOA,GPIO_Pin_8);
        GPIO_SetBits(GPIOA,GPIO_Pin_9);
        GPIO_SetBits(GPIOA,GPIO_Pin_10);
        GPIO_SetBits(GPIOB,GPIO_Pin_12);

    }
    Delay_ms(10);

}

static uint8_t LTC2668_Spi_command_write(SPI_TypeDef* SPIx, uint16_t * w_data, uint16_t * r_data);
static uint8_t LTC2668_Spi_command_write(SPI_TypeDef* SPIx, uint16_t * w_data, uint16_t * r_data)
{
    uint8_t ret = ERROR;
    if( ((void *)0 == w_data) || ((void *)0 == r_data) )
        return ERROR;
    DRV_SPI_CS_LTC2628();
    
    ret = drv_spi_access_short(LTC2628_SPI_PORT,*w_data,r_data);
    if(SUCCESS == ret )
    {
        ret = drv_spi_access_short(LTC2628_SPI_PORT,*(w_data+1),(r_data+1));
    }
    else
    {
        /**/
    }
    DRV_SPI_CS_NONE();
    return ret;
    
}
static uint8_t LTC2668_Write_Register(uint8_t reg, uint8_t chan, uint16_t w_data);
static uint8_t LTC2668_Write_Register(uint8_t reg, uint8_t chan, uint16_t w_data)
{
    uint8_t ret;
    uint16_t wdata[2];
    uint16_t *rdata; 

    if(chan > LTC2668_CHANNEL16)
        return ERROR;
    rdata = ltc2668_au16[chan];
    
    wdata[0] = (reg & 0x00F0) | (chan & 0x000F);
    wdata[1] = w_data;

    if((void *)0 == rdata)
        return ERROR;

    ret = LTC2668_Spi_command_write(LTC2628_SPI_PORT, wdata, rdata);
    return ret;
}


uint8_t LTC2668_Write_n(uint16_t chan, uint16_t w_data)
{
    uint8_t ret = ERROR;
    if(chan > LTC2668_CHANNEL16)
        return ERROR;

    ret = LTC2668_Write_Register(CMD_WRITE_N, chan, w_data);

    return ret;
}
uint8_t LTC2668_Updata_n(uint16_t chan, uint16_t w_data)
{
     uint8_t ret = ERROR;
     if(chan > LTC2668_CHANNEL16)
         return ERROR;

     ret = LTC2668_Write_Register(CMD_UPDATE_N, chan, w_data);

     return ret;
}
uint8_t LTC2668_Write_n_Updata_n(uint16_t chan, uint16_t w_data)
{
    uint8_t ret = ERROR;
    if(chan > LTC2668_CHANNEL16)
        return ERROR;

    ret = LTC2668_Write_Register(CMD_WRITE_N_UPDATE_N, chan, w_data);

    return ret;
}
uint8_t LTC2668_Write_all(uint16_t w_data)
{
    uint8_t ret = ERROR;

    ret = LTC2668_Write_Register(CMD_WRITE_ALL, LTC2668_CHANNELNC, w_data);

    return ret;
}
uint8_t LTC2668_Updata_all(uint16_t w_data)
{
    uint8_t ret = ERROR;

    ret = LTC2668_Write_Register(CMD_UPDATE_ALL, LTC2668_CHANNELNC, w_data);

    return ret;
}


uint8_t LTC2668_Write_all_Updata_all(uint16_t w_data)
{
    uint8_t ret = ERROR;

    ret = LTC2668_Write_Register(CMD_WRITE_ALL_UPDATE_ALL, LTC2668_CHANNELNC, w_data);

    return ret;
}
uint8_t LTC2668_Powerdown_n(uint16_t chan)
{
     uint8_t ret = ERROR;
     if(chan > LTC2668_CHANNEL16)
         return ERROR;

     ret = LTC2668_Write_Register(CMD_POWER_DOWN_N, chan, 0xFFFF);

     return ret;
}

uint8_t LTC2668_Powerdown_all(void)
{
    uint8_t ret = ERROR;

    ret = LTC2668_Write_Register(CMD_POWER_DOWN_ALL, LTC2668_CHANNELNC, 0xFFFF);

    return ret;
}



#ifdef DEBUG_LTC2668

void drv_spi_cs(uint8_t dev_id)
{
    if(SPI_CS_LTC2668 == dev_id)
    {
        GPIO_SetBits(GPIOA,GPIO_Pin_8);
        GPIO_SetBits(GPIOA,GPIO_Pin_9);
        GPIO_SetBits(GPIOA,GPIO_Pin_10);
        GPIO_SetBits(GPIOB,GPIO_Pin_12);
        GPIO_ResetBits(GPIOB,GPIO_Pin_12);
    }
    else
    {
        GPIO_SetBits(GPIOA,GPIO_Pin_8);
        GPIO_SetBits(GPIOA,GPIO_Pin_9);
        GPIO_SetBits(GPIOA,GPIO_Pin_10);
        GPIO_SetBits(GPIOB,GPIO_Pin_12);

    }
    Delay_ms(10);

}
static uint16_t ltc2628_code[16] = {0x1234, 0x2345, 0x3456,0xaa55,0x7977,0x304,0x887,0x987,0xf300,0x4646,0x6764,0x1235,0x1313,0x2569,0xddef,0xaa98,};
static uint16_t ltc2628_all= 0x8000;
void test_ltc2628_ini(void)
{
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);
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
    
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;  
    GPIO_Init(GPIOA, &GPIO_InitStructure);  
#endif
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOB,&GPIO_InitStructure);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8| GPIO_Pin_9| GPIO_Pin_10;  
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
}
void test_ltc2668(void)
{
#if 0
    uint8_t i;
    for(i=0; i<(LTC2668_CHANNEL16+1); i++)
    {
        LTC2668_Write_n_Updata_n(i, ltc2628_code[i]);
        Delay_ms(10);
    }
    for(i=0; i<(LTC2668_CHANNEL16+1); i++)
    {
        LTC2668_Write_n_Updata_n(i, 0);
        Delay_ms(10);
    }
    for(i=0; i<(LTC2668_CHANNEL16+1); i++)
    {
        LTC2668_Write_n_Updata_n(i, ltc2628_code[i]);
        Delay_ms(10);
    }
    for(i=0; i<(LTC2668_CHANNEL16+1); i++)
    {
        LTC2668_Write_n_Updata_n(i, 0);
        Delay_ms(10);
    }
    for(i=0; i<(LTC2668_CHANNEL16+1); i++)
    {
        LTC2668_Powerdown_n(i);
        Delay_ms(10);
        LTC2668_Powerdown_n(i);
    }
#endif
     uint8_t i;
    for(i=0; i<8; i++)
    {
        LTC2668_Write_n_Updata_n(i, ltc2628_all);
        Delay_ms(10);
    }
    for(i=8; i<(LTC2668_CHANNEL16+1); i++)
    {
        LTC2668_Write_n_Updata_n(i, ltc2628_all);
        Delay_ms(10);
    }
#if 0
    Delay_ms(10);
    LTC2668_Write_all_Updata_all(ltc2628_all);
    Delay_ms(10);
    LTC2668_Powerdown_all();
    #endif
}
#endif
