/**
  ******************************************************************************
  * @file    max7312.c  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   max7312 driver
  ******************************************************************************
**/ 

#include "include.h"

#define MAX7312_I2C_PORT I2C1

#define MAX7312_DEVICE_NUM      2U
#define MAX7312_DEVICE_0_ADDR   0x4E
#define MAX7312_DEVICE_1_ADDR   0x46
#define MAX7312_DEVICE_2_ADDR   0x42

#define MAX7312_DEVICE_ALL_OUTPUT 0x00
#define MAX7312_DEVICE_ALL_INTPUT 0xFF
#define MAX7312_DEVICE_ALL_HI 0xFF
#define MAX7312_DEVICE_ALL_LO 0x00

#define MAX7312_COMMAND_00  0x00   /*input port 1*/
#define MAX7312_COMMAND_01  0x01   /*input port 2*/
#define MAX7312_COMMAND_02  0x02   /*output port 1*/
#define MAX7312_COMMAND_03  0x03   /*ouput port 2*/
#define MAX7312_COMMAND_04  0x04   /*port 1 inversion*/
#define MAX7312_COMMAND_05  0x05   /*port 2 inversion*/
#define MAX7312_COMMAND_06  0x06   /*port 1 config*/
#define MAX7312_COMMAND_07  0x07   /*port 2 config*/
#define MAX7312_COMMAND_08  0x08   /*timeout*/
#define MAX7312_COMMAND_FF  0xFF   /*reserve*/

typedef struct
{
    uint8_t max7312_cmd_00;
    uint8_t max7312_cmd_01;
    uint8_t max7312_cmd_02;
    uint8_t max7312_cmd_03;
    uint8_t max7312_cmd_04;
    uint8_t max7312_cmd_05;
    uint8_t max7312_cmd_06;
    uint8_t max7312_cmd_07;
    uint8_t max7312_cmd_08;
    uint8_t max7312_cmd_FF;
}max7312_command_tst;
    
 const max7312_command_tst max7312_command_cst =
{
    MAX7312_COMMAND_00,
    MAX7312_COMMAND_01,
    MAX7312_COMMAND_02,
    MAX7312_COMMAND_03,
    MAX7312_COMMAND_04,
    MAX7312_COMMAND_05,
    MAX7312_COMMAND_06,
    MAX7312_COMMAND_07,
    MAX7312_COMMAND_08,
    MAX7312_COMMAND_FF
};

typedef struct
{
    uint8_t input[2];
    uint8_t output[2];
    uint8_t polarity[2];
    uint8_t configuration[2];
}max7312_reg_tst;
max7312_reg_tst max7312_reg_st[MAX7312_DEVICE_NUM];

const uint8_t max7312_dev_addr_ca[MAX7312_DEVICE_NUM] = 
{
    MAX7312_DEVICE_0_ADDR,
    MAX7312_DEVICE_1_ADDR,
};
static uint8_t Max7312_Write_Register(uint8_t dev_id, uint8_t reg, uint8_t* w_data);
static uint8_t Max7312_Read_Register(uint8_t dev_id, uint8_t reg, uint8_t* r_data);
static uint8_t Max7312_Write_Reg_Check(uint8_t dev_id, uint8_t reg, uint8_t *w_data, uint8_t *r_data);


void Max7312_init(void)
{
    uint8_t res;
    res = Max7312_Set_All_Port_Output(0);
    res &= Max7312_Set_All_Port_Lo(0);

    res &= Max7312_Set_All_Port_Output(1);
    res &= Max7312_Set_All_Port_Lo(1);

}

uint8_t Max7312_Set_All_Port_Output(uint8_t dev_id)
{
    uint8_t ret1, ret2;
    ret1 = Max7312_Set_Port1_IO(dev_id, MAX7312_DEVICE_ALL_OUTPUT);
    ret2 = Max7312_Set_Port2_IO(dev_id, MAX7312_DEVICE_ALL_OUTPUT);
    return (ret1 & ret2);
}
uint8_t Max7312_Set_All_Port_Input(uint8_t dev_id)
{
    uint8_t ret1, ret2;
    ret1 = Max7312_Set_Port1_IO(dev_id, MAX7312_DEVICE_ALL_INTPUT);
    ret2 = Max7312_Set_Port2_IO(dev_id, MAX7312_DEVICE_ALL_INTPUT);
    return (ret1 & ret2);
}
uint8_t Max7312_Set_All_Port_Hi(uint8_t dev_id)
{
    uint8_t ret1, ret2;
    ret1 = Max7312_Set_Port1_HiLo(dev_id, MAX7312_DEVICE_ALL_HI);
    ret2 = Max7312_Set_Port2_HiLo(dev_id, MAX7312_DEVICE_ALL_HI);
    return (ret1 & ret2);
}
uint8_t Max7312_Set_All_Port_Lo(uint8_t dev_id)
{
    uint8_t ret1, ret2;
    ret1 = Max7312_Set_Port1_HiLo(dev_id, MAX7312_DEVICE_ALL_LO);
    ret2 = Max7312_Set_Port2_HiLo(dev_id, MAX7312_DEVICE_ALL_LO);
    return (ret1 & ret2);
}
  
uint8_t Max7312_Set_Port1_IO(uint8_t dev_id, uint8_t io)
{
    
    uint8_t ret = ERROR;
    uint8_t reg;
    uint8_t w_data;
    uint8_t *r_data = max7312_reg_st[dev_id].configuration;

    w_data = io;
    reg = max7312_command_cst.max7312_cmd_06;
    ret = Max7312_Write_Reg_Check(dev_id, reg, &w_data, &r_data[0]);

    return ret;
}
uint8_t Max7312_Set_Port2_IO(uint8_t dev_id, uint8_t io)
{
    
    uint8_t ret = ERROR;
    uint8_t reg;
    uint8_t w_data;
    uint8_t *r_data = max7312_reg_st[dev_id].configuration;

    w_data = io;
    reg = max7312_command_cst.max7312_cmd_07;
    ret = Max7312_Write_Reg_Check(dev_id, reg, &w_data, &r_data[1]);

    return ret;
}
uint8_t Max7312_Set_Port1_HiLo(uint8_t dev_id, uint8_t io_st)
{
    uint8_t ret = ERROR;
    uint8_t reg;
    uint8_t w_data;
    uint8_t *r_data = max7312_reg_st[dev_id].output;

     w_data = io_st;
    
    reg = max7312_command_cst.max7312_cmd_02;
    ret = Max7312_Write_Reg_Check(dev_id, reg, &w_data, &r_data[0]);

    return ret;
}
uint8_t Max7312_Set_Port2_HiLo(uint8_t dev_id, uint8_t io_st)
{
    uint8_t ret = ERROR;
    uint8_t reg;
    uint8_t w_data;
    uint8_t *r_data = max7312_reg_st[dev_id].output;

     w_data = io_st;
    
    reg = max7312_command_cst.max7312_cmd_03;
    ret = Max7312_Write_Reg_Check(dev_id, reg, &w_data, &r_data[1]);

    return ret;
}   
static uint8_t Max7312_Write_Reg_Check(uint8_t dev_id, uint8_t reg, uint8_t *w_data, uint8_t *r_data)
{
    uint8_t ret;
    uint8_t *wdata = w_data;
    uint8_t *rdata = r_data;
    
    ret = Max7312_Write_Register(dev_id, reg, w_data);
    if(SUCCESS == ret)
    {
        ret = Max7312_Read_Register(dev_id, reg, r_data );
        if(SUCCESS == ret)
        {
            if( *wdata == *rdata )
            {
                ret = SUCCESS;
            }
            else
            {
                ret = ERROR;
            }
        }
        else
        {
            ret = ERROR;
        }
    }
    else
    {
        ret = ERROR;
    }

    return ret;
}
  
static uint8_t Max7312_Write_Register(uint8_t dev_id, uint8_t reg, uint8_t* w_data)
{
    uint8_t ret;
    uint8_t SlaveAddress;
    if(dev_id > MAX7312_DEVICE_NUM)
        return ERROR;
    if((void*)0 == w_data)
        return ERROR;

    SlaveAddress = max7312_dev_addr_ca[dev_id];

    ret = I2c_command_write(MAX7312_I2C_PORT, reg, 1, SlaveAddress, w_data);
    if(SUCCESS == ret)
    {
        ret = SUCCESS;
    }
    else
    {
        ret = ERROR;
    }

    return ret;
}

static uint8_t Max7312_Read_Register(uint8_t dev_id, uint8_t reg, uint8_t* r_data)
{
    uint8_t ret;
    uint8_t SlaveAddress;
    if(dev_id > MAX7312_DEVICE_NUM)
        return ERROR;
    if((void*)0 == r_data)
        return ERROR;
    
    SlaveAddress = max7312_dev_addr_ca[dev_id];
    
    ret = I2c_command_read(MAX7312_I2C_PORT, reg, 1, SlaveAddress, r_data );
    if(SUCCESS == ret)
    {
        ret = SUCCESS;
    }
    else
    {
        ret = ERROR;
    }

    return ret;
}

#ifdef DEBUG_MAX7312
void test_max7312(void)
{
    /* Enable peripheral clocks --------------------------------------------------*/
    /* GPIOB Periph clock enable */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
    /* I2C1 and I2C2 Periph clock enable */
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C2, ENABLE);

    GPIO_InitTypeDef GPIO_InitStructure;
    /* Configure I2C2 pins: SCL and SDA ----------------------------------------*/
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10 | GPIO_Pin_11;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_OD;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
    
    I2C_InitTypeDef I2C_InitStructure;
    I2C_InitStructure.I2C_Mode = I2C_Mode_SMBusHost;
    I2C_InitStructure.I2C_DutyCycle = I2C_DutyCycle_2;
    I2C_InitStructure.I2C_OwnAddress1 = 0x31;
    I2C_InitStructure.I2C_Ack = I2C_Ack_Enable;
    I2C_InitStructure.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
    I2C_InitStructure.I2C_ClockSpeed = 400000;

    I2C_Init(I2C2, &I2C_InitStructure);

    /* disable I2C1 PEC Transmission */
    I2C_CalculatePEC(I2C2, DISABLE);

    I2C_Cmd(I2C2,ENABLE);

    Max7312_Set_All_Port_Output(0);
    Max7312_Set_All_Port_Lo(0);
    Max7312_Set_All_Port_Hi(0);
    Max7312_Set_All_Port_Output(1);
    Max7312_Set_All_Port_Lo(1);
    Max7312_Set_All_Port_Hi(1);
    Max7312_Set_All_Port_Output(2);
    Max7312_Set_All_Port_Lo(2);
    Max7312_Set_All_Port_Hi(2);
#if 0
    while(1)
    {
        Max7312_Set_All_Port_Output(0);
        Delay_ms(400);
        Max7312_Set_All_Port_Hi(0);
        Delay_ms(400);
        Max7312_Set_All_Port_Lo(0);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0x1234);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0xa3f9);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0xc580);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0xa3f9);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0x1482);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0x4474);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0x9685);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0xfea0);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0x5583);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0xa3f9);
        Delay_ms(400);
        Max7312_Set_Port_IO(0,0xFF00);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0x1234);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(0, 0xa3f9);
        Delay_ms(400);

        Max7312_Set_All_Port_Output(1);
        Delay_ms(400);
        Max7312_Set_All_Port_Hi(1);
        Delay_ms(400);
        Max7312_Set_All_Port_Lo(1);
        Max7312_Set_Port_HiLo(1, 0x1234);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0xa3f9);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0xc580);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0xa3f9);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0x1482);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0x4474);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0x9685);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0xfea0);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0x5583);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0xa3f9);
        Delay_ms(400);        
        Max7312_Set_Port_IO(1,0xFF00);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0x1234);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(1, 0xa3f9);
        Delay_ms(400);


        Max7312_Set_All_Port_Output(2);
        Delay_ms(400);
        Max7312_Set_All_Port_Hi(2);
        Delay_ms(400);
        Max7312_Set_All_Port_Lo(2);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0x1234);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0xa3f9);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0xc580);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0xa3f9);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0x1482);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0x4474);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0x9685);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0xfea0);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0x5583);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0xa3f9);
        Delay_ms(400);
        Max7312_Set_Port_IO(2,0xFF00);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0x1234);
        Delay_ms(400);
        Max7312_Set_Port_HiLo(2, 0xa3f9);
        Delay_ms(400);

    }
    #endif
}
#endif

 /******************* (C) COPYRIGHT  *****END OF FILE****/