/**
  ******************************************************************************
  * @file    MAX5478.c  burn in system
  * @author  h&h
  * @version 
  * @date    2018
  * @brief   MAX5478 driver
  ******************************************************************************
**/ 




#include "include.h"

#define MAX5478_IIC_PORT I2C1
#define MAX5478_ADDR     0x50

/*
WIPER A_ONLY
0 1 0 1 A2 A1 A0 0 0 0 0 1 0 0 0 1 D7 D6 D5 D4 D3 D2 D1 D0
0 1 0 1 A2 A1 A0 0 0 0 1 0 0 0 0 1 D7 D6 D5 D4 D3 D2 D1 D0
0 1 0 1 A2 A1 A0 0 0 1 1 0 0 0 0 1 D7 D6 D5 D4 D3 D2 D1 D0
0 1 0 1 A2 A1 A0 0 0 1 0 1 0 0 0 1 D7 D6 D5 D4 D3 D2 D1 D0
*/
#define CMD_A_VREG              0x11
#define CMD_A_NVREG             0x21
#define CMD_A_NVREGxVREG        0x61
#define CMD_A_VREGxNVREG        0x51
/*
WIPER B ONLY
0 1 0 1 A2 A1 A0 0 0 0 0 1 0 0 1 0 D7 D6 D5 D4 D3 D2 D1 D0
0 1 0 1 A2 A1 A0 0 0 0 1 0 0 0 1 0 D7 D6 D5 D4 D3 D2 D1 D0
0 1 0 1 A2 A1 A0 0 0 1 1 0 0 0 1 0 D7 D6 D5 D4 D3 D2 D1 D0
0 1 0 1 A2 A1 A0 0 0 1 0 1 0 0 1 0 D7 D6 D5 D4 D3 D2 D1 D0
*/
#define CMD_B_VREG              0x12
#define CMD_B_NVREG             0x22
#define CMD_B_NVREGxVREG        0x62
#define CMD_B_VREGxNVREG        0x52
/*
WIPERS A AND B
0 1 0 1 A2 A1 A0 0 0 0 0 1 0 0 1 1 D7 D6 D5 D4 D3 D2 D1 D0
0 1 0 1 A2 A1 A0 0 0 0 1 0 0 0 1 1 D7 D6 D5 D4 D3 D2 D1 D0
0 1 0 1 A2 A1 A0 0 0 1 1 0 0 0 1 1 D7 D6 D5 D4 D3 D2 D1 D0
0 1 0 1 A2 A1 A0 0 0 1 0 1 0 0 1 1 D7 D6 D5 D4 D3 D2 D1 D0
*/
#define CMD_A_B_VREG            0x13
#define CMD_A_B_NVREG           0x23
#define CMD_A_B_NVREGxVREG      0x63
#define CMD_A_B_VREGxNVREG      0x53

#define MAX5478_MAX 0x14u
#define MAX5478_MIN 0x04u





void MAX5478_init(void)
{
    uint8_t ret = ERROR;
    uint8_t DataToWrite = 0xFF;
    ret = I2c_command_write(MAX5478_IIC_PORT, CMD_A_VREG,1,MAX5478_ADDR,&DataToWrite);
}

uint8_t MAX5478_write_potentiometer(uint8_t value)
{
    uint8_t ret = ERROR;
    
    if(value > MAX5478_MAX)
        value = MAX5478_MAX;
    if(value < MAX5478_MIN)
        value = MAX5478_MIN;
        
    uint8_t DataToWrite = value;
    ret = I2c_command_write(MAX5478_IIC_PORT, CMD_A_VREG,1,MAX5478_ADDR,&DataToWrite);
    return ret;
}


/******************* (C) COPYRIGHT 2018 *****END OF FILE****/



