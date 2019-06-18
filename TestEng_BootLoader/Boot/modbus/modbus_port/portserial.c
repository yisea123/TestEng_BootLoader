/*
 * FreeModbus Libary: ATMega168 Port
 * Copyright (C) 2006 Christian Walter <wolti@sil.at>
 *   - Initial version and ATmega168 support
 * Modfications Copyright (C) 2006 Tran Minh Hoang:
 *   - ATmega8, ATmega16, ATmega32 support
 *   - RS485 support for DS75176
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * File: $Id: portserial.c,v 1.6 2006/09/17 16:45:53 wolti Exp $
 */

#include "include.h"
#include "BootApp.h"
#include "Delay.h"
#include "port.h"

/* ----------------------- Modbus includes ----------------------------------*/
#include "mb.h"
#include "mbport.h"

USART_TypeDef* MB_USART_PORT[1];

BOOL xMBPortSerialInit( UCHAR ucPORT, ULONG ulBaudRate, UCHAR ucDataBits, eMBParity eParity )
{
    BootApp_Get_Uart(&MB_USART_PORT[0]);
    return TRUE;

}
void vMBPortClose( void )
{
    vMBPortSerialEnable(0,0);
}


void vMBPortSerialEnable( BOOL xRxEnable, BOOL xTxEnable )
{
    if(xRxEnable)
    {
        BootApp_Enable_usart_rx();
        USART_ITConfig(MB_USART_PORT[0], USART_IT_RXNE, ENABLE);
        
    }
    else
    {
        BootApp_Disable_usart_rx();
        USART_ITConfig(MB_USART_PORT[0], USART_IT_RXNE, DISABLE); 
        
    }

    if(xTxEnable)
    {
        BootApp_Enable_usart_tx();
        USART_ITConfig(MB_USART_PORT[0], USART_IT_TXE, ENABLE);
        
    }
    else
    {
        Delay_ms(5);
        BootApp_Disable_usart_tx();
        USART_ITConfig(MB_USART_PORT[0], USART_IT_TXE, DISABLE);
    }

}


BOOL xMBPortSerialPutByte( CHAR ucByte )
{
    USART_SendData(MB_USART_PORT[0], ucByte);
    return TRUE;
}
BOOL xMBPortSerialGetByte( CHAR * pucByte )
{
    *pucByte = USART_ReceiveData(MB_USART_PORT[0]);
    return TRUE;
}


static void prvvUARTTxReadyISR( void )
{
    pxMBFrameCBTransmitterEmpty();
}

static void prvvUARTRxISR( void )
{
    pxMBFrameCBByteReceived();
}

void USART1_IRQHandler(void)
{

    if(USART_GetITStatus(MB_USART_PORT[0], USART_IT_RXNE) == SET)
    {
        prvvUARTRxISR(); 
        USART_ClearITPendingBit(MB_USART_PORT[0], USART_IT_RXNE); 
    }

    if(USART_GetITStatus(MB_USART_PORT[0], USART_IT_TXE) == SET)
    {
        prvvUARTTxReadyISR();
        USART_ClearITPendingBit(MB_USART_PORT[0], USART_IT_TXE);
    }
}


