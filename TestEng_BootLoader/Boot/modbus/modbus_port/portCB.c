#include <stdio.h>
#include "mb.h"
#include "mbutils.h"
#include "command.h"

extern eMBErrorCode  eWriteMBRegInput( USHORT * pucRegBuffer, USHORT usAddress, USHORT usNRegs);
extern eMBErrorCode  eReadMBRegHolding( USHORT * pucRegBuffer, USHORT usAddress, USHORT usNRegs);



#define REG_HOLDING_START 0x0001
#define REG_HOLDING_NREGS CMD_MOBUS_HOLD_REG_LENGTH
USHORT  usRegHoldingBuf[REG_HOLDING_NREGS] = 
{
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,

};

eMBErrorCode  eMBRegHoldingCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNRegs,
eMBRegisterMode eMode )
{

    eMBErrorCode eStatus = MB_ENOERR;
    USHORT iRegIndex;
    USHORT iRegData;

    if(pucRegBuffer == (void*)0)
        return MB_EINVAL;
        
    if( ( (USHORT)usAddress >= REG_HOLDING_START ) \
    && ( usAddress + usNRegs <= REG_HOLDING_START + REG_HOLDING_NREGS ) )
    {
        iRegIndex = ( USHORT )( usAddress - REG_HOLDING_START );

        switch ( eMode )
        {
            case MB_REG_READ:
            {
                while( usNRegs > 0 )
                {
                    iRegData = usRegHoldingBuf[iRegIndex];
                    *pucRegBuffer++ = ( UCHAR )( iRegData >> 8 );
                    *pucRegBuffer++ = ( UCHAR )( iRegData & 0xFF );
                    iRegIndex++;
                    usNRegs--;
                }

            }
            break;

            case MB_REG_WRITE:
            {
                while( usNRegs > 0 )
                {
                    iRegData = *pucRegBuffer++ << 8;
                    iRegData |= *pucRegBuffer++;
                    usRegHoldingBuf[iRegIndex] = iRegData;
                    iRegIndex++;
                    usNRegs--;
                }
                eStatus = eReadMBRegHolding(cmd_lock_reg,CMD_LOCK_OFFSET,CMD_LOCK_LENGTH);
                eStatus = eReadMBRegHolding(cmd_potentiometer_res,CMD_PO_RES_OFFSET,CMD_PO_RES_LENGTH);
                eStatus = eReadMBRegHolding(cmd_pwrdn_dac,CMD_PWRDN_DAC_OFFSET,CMD_PWRDN_DAC_LENGTH);
                eStatus = eReadMBRegHolding(cmd_vcc_en,CMD_VCC_EN_OFFSET,CMD_VCC_EN_LENGTH);
                eStatus = eReadMBRegHolding(cmd_max7312_en,CMD_MAX7312_OFFSET,CMD_MAX7312_LENGTH);
                eStatus = eReadMBRegHolding(cmd_cur_dac,CMD_CUR_DAC_OFFSET,CMD_CUR_DAC_LENGTH);
                eStatus = eReadMBRegHolding(cmd_eep,CMD_EEP_OFFSET,CMD_EEP_LENGTH);
            }
            break;
        }
    }
    else
    {
        eStatus = MB_ENOREG;
    }

    return eStatus;
}



#define REG_INPUT_START 0x0001
#define REG_INPUT_NREGS CMD_MOBUS_INPUT_REG_LENGTH
USHORT  usRegInputBuf[CMD_MOBUS_INPUT_REG_LENGTH] = {0x2019,0x0330,};

eMBErrorCode  eMBRegInputCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNRegs )
{
    eMBErrorCode eStatus = MB_ENOERR;
    USHORT iRegIndex;
    USHORT iRegData;
    if(pucRegBuffer == (void*)0)
        return MB_EINVAL;
    
    eStatus = eWriteMBRegInput(&cmd_adc_tout[0],CMD_TSAMP_OFFSET,CMD_TSAMP_LENGTH);
    eStatus = eWriteMBRegInput(&cmd_adc_iout[0],CMD_ISAMP_OFFSET,CMD_ISAMP_LENGTH);
    eStatus = eWriteMBRegInput(&cmd_adc_mout[0],CMD_MSAMP_OFFSET,CMD_MSAMP_LENGTH);
    eStatus = eWriteMBRegInput(&cmd_adc_vout[0],CMD_VSAMP_OFFSET,CMD_VSAMP_LENGTH);
    eStatus = eWriteMBRegInput(&cmd_rd_eep[0],CMD_EEP_RD_OFFSET,CMD_EEP_RD_LENGTH);

    if( ( (USHORT)usAddress >= REG_INPUT_START ) \
    && ( usAddress + usNRegs <= REG_INPUT_START + REG_INPUT_NREGS ) )
    {
        iRegIndex = ( USHORT )( usAddress - REG_INPUT_START );
        while( usNRegs > 0 )
        {
            iRegData = usRegInputBuf[iRegIndex];
            *pucRegBuffer++ = ( UCHAR )( iRegData >> 8 );
            *pucRegBuffer++ = ( UCHAR )( iRegData & 0xFF );
            iRegIndex++;
            usNRegs--;
        }
    }
    else
    {
        eStatus = MB_ENOREG;
    }

    return eStatus;
}








eMBErrorCode    eMBRegCoilsCB( UCHAR * pucRegBuffer, USHORT usAddress,
                               USHORT usNCoils, eMBRegisterMode eMode )
{
    return MB_ENOERR;

}

eMBErrorCode    eMBRegDiscreteCB( UCHAR * pucRegBuffer, USHORT usAddress,
                                  USHORT usNDiscrete )
{
   return MB_ENOERR;

}


eMBErrorCode  eWriteMBRegInput( USHORT * pucRegBuffer, USHORT usAddress, USHORT usNRegs)
{
    eMBErrorCode eStatus = MB_ENOERR;
    USHORT iRegIndex;

    if(pucRegBuffer == (void*)0)
        return MB_EINVAL;

    if( ( (USHORT)usAddress >= 0u ) \
    && ( usAddress + usNRegs <= REG_INPUT_NREGS ) )
    {
        iRegIndex = usAddress;
        __disable_irq();
        while( usNRegs > 0 )
        {
            usRegInputBuf[iRegIndex] = *pucRegBuffer++;
            iRegIndex++;
            usNRegs--;
        }
        __enable_irq();
    }
    else
    {
        eStatus = MB_ENOREG;
    }
    return eStatus;

}
eMBErrorCode  eReadMBRegHolding( USHORT * pucRegBuffer, USHORT usAddress, USHORT usNRegs)
{
    eMBErrorCode eStatus = MB_ENOERR;
    USHORT iRegIndex;
    
    if(pucRegBuffer == (void*)0)
        return MB_EINVAL;


    if( ( (USHORT)usAddress >= 0u ) \
    && ( usAddress + usNRegs <=  REG_HOLDING_NREGS ) )
    {
        iRegIndex = usAddress;
        __disable_irq();
        while( usNRegs > 0 )
        {
            *pucRegBuffer++  = usRegHoldingBuf[iRegIndex];
            iRegIndex++;
            usNRegs--;
        }
        __enable_irq();
    }
    else
    {
        eStatus = MB_ENOREG;
    }
    return eStatus;
}


