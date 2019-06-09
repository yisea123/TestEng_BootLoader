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


#include "port.h"

/* ----------------------- Modbus includes ----------------------------------*/
#include "mb.h"
#include "mbport.h"

#define MB_USART_PORT USART1
BOOL xMBPortSerialInit( UCHAR ucPORT, ULONG ulBaudRate, UCHAR ucDataBits, eMBParity eParity )
{
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
        Enable_usart_rx();
        USART_ITConfig(MB_USART_PORT, USART_IT_RXNE, ENABLE);
        
    }
    else
    {
        Disable_usart_rx();
        USART_ITConfig(MB_USART_PORT, USART_IT_RXNE, DISABLE); 
        
    }

    if(xTxEnable)
    {
        Enable_usart_tx();
        USART_ITConfig(MB_USART_PORT, USART_IT_TXE, ENABLE);
        
    }
    else
    {
        Delay_ms(5);
        Disable_usart_tx();
        USART_ITConfig(MB_USART_PORT, USART_IT_TXE, DISABLE);
    }

}


BOOL xMBPortSerialPutByte( CHAR ucByte )
{
    USART_SendData(MB_USART_PORT, ucByte);
    return TRUE;
}
BOOL xMBPortSerialGetByte( CHAR * pucByte )
{
    *pucByte = USART_ReceiveData(MB_USART_PORT);
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

    if(USART_GetITStatus(MB_USART_PORT, USART_IT_RXNE) == SET)
    {
        prvvUARTRxISR(); 
        USART_ClearITPendingBit(MB_USART_PORT, USART_IT_RXNE); 
    }

    if(USART_GetITStatus(MB_USART_PORT, USART_IT_TXE) == SET)
    {
        prvvUARTTxReadyISR();
        USART_ClearITPendingBit(MB_USART_PORT, USART_IT_TXE);
    }
}


