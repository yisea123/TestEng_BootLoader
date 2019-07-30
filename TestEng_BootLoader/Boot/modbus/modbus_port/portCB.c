#include <stdio.h>
#include "mb.h"
#include "mbutils.h"

#include "BootApp.h"


extern eMBErrorCode  eWriteMBRegInput( USHORT * pucRegBuffer, USHORT usAddress, USHORT usNRegs);
extern eMBErrorCode  eReadMBRegHolding( USHORT * pucRegBuffer, USHORT usAddress, USHORT usNRegs);

#define REG_HOLDING_START 0x0001
#define REG_HOLDING_NREGS BOOTAPP_COMMUBICATION_BUF_SIZE

USHORT  usRegHoldingBuf[REG_HOLDING_NREGS] = {0};

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
#define REG_INPUT_NREGS BOOTAPP_STATUS_BUF_SIZE
USHORT  usRegInputBuf[REG_INPUT_NREGS] = {FW_MAIN_VERSION,FW_SUB_VERSION,FW_REVISION,};

eMBErrorCode  eMBRegInputCB( UCHAR * pucRegBuffer, USHORT usAddress, USHORT usNRegs )
{
    eMBErrorCode eStatus = MB_ENOERR;
    USHORT iRegIndex;
    USHORT iRegData;
    if(pucRegBuffer == (void*)0)
        return MB_EINVAL;

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
        ENTER_CRITICAL_SECTION();
        while( usNRegs > 0 )
        {
            usRegInputBuf[iRegIndex] = *pucRegBuffer++;
            iRegIndex++;
            usNRegs--;
        }
        EXIT_CRITICAL_SECTION();
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
        ENTER_CRITICAL_SECTION();
        while( usNRegs > 0 )
        {
            *pucRegBuffer++  = usRegHoldingBuf[iRegIndex];
            iRegIndex++;
            usNRegs--;
        }
        EXIT_CRITICAL_SECTION();
    }
    else
    {
        eStatus = MB_ENOREG;
    }
    return eStatus;
}


