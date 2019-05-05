/**
  ******************************************************************************
  * @file    232.c  burn in system
  * @author  h&h
  * @version 
  * @date    
  * @brief   this file consists of functions dealing with rs232 related issues:
   phisical/transportation/application layer  
   reference:ITLA MSA
  ******************************************************************************
**/ 


#include "include.h"


uint16_t gOutboundData;
uint16_t gInboundData;

uint8_t rxData[4];
uint8_t txData[4];
/*counter*/
uint8_t rxstart=0u;
uint8_t rxdata=0u;
uint8_t rxend=0u;
/*data*/
uint8_t usart_start[2]={0u};
uint8_t usart_end[2]={0u};
uint8_t rxdata_buf[4]={0u};

/*flag*/
uint8_t cmd_start_received=ERROR;
uint8_t cmd_data_received=ERROR;
uint8_t cmd_stop_received=ERROR;
uint8_t rx_buf_empty=SUCCESS;
uint8_t command_pended=ERROR;
/*addr*/
uint8_t address_match=ERROR;
uint8_t boardaddr=0u;
uint8_t recieved_command_buf[4];
uint8_t Board_address=0x3F;

#define READ  0x0
#define WRITE 0x1


extern uint8_t rxData[4];
extern uint8_t txData[4];


void processPacket( uint8_t * rData );
extern uint8_t  send_ad_data_usart(uint16_t * tPointer,uint8_t count);

void sendResponseWait( uint8_t *tData );
uint8_t verifyRxChecksum( uint8_t *rData);
void insertTxChecksum( uint8_t * tData );
void insertRxChecksum( uint8_t *rData);
uint8_t calcBIP4( uint8_t *data);
void packResponse( uint8_t result, uint8_t regNumber, uint16_t data );
void unpackCommand( uint8_t *flag, uint8_t *regNumber,uint8_t *rData );
uint8_t processCommand( uint8_t regNumber, uint8_t flag, uint16_t indata, uint16_t* outdata);

/*******************************************************************************
* Function Name  : USART1_IRQHandler
* Description    : This function handles USART1 global interrupt request.
* Input          : None
* Output         : None
* Return         : None

response usart1 interrupt when there's data bag from PC 232 interface, clear 
RXNE IRQ and get current byte

                    data frame structure
  start   |  addr    |            data             |   end
   2B     |   1B     |             4B              |    2B
0xAA 0x55 | Address  |BIP4_checksum cmd dataH dataL|0xAA 0x55 
*******************************************************************************/

void uart_isr(uint8_t current_byte)
{
    /*waitting for 0xaa 0x55  start*/
    if(cmd_start_received==ERROR)
    {
        usart_start[rxstart++] = current_byte;
        if(rxstart==2u)
        {
            if((usart_start[0]==0xAA)&&(usart_start[1]==0x55))
            {
                cmd_start_received=SUCCESS;
                usart_start[0]=0u;
                usart_start[1]=0u;
                rxstart=0u;
            }
            else
            {
                /*start not received*/
                cmd_start_received=ERROR;
                usart_start[0]=usart_start[1];
                usart_start[1]=0u;
                rxstart=1u;
            }
        }
        return;
    }

    /*start received , the next byte is addr,if not,waitting for
    next start*/
    if(address_match==ERROR)
    {
         boardaddr=current_byte;

         if(boardaddr==Board_address)
         {
             address_match=SUCCESS;  
         }
         else
         {
             address_match=ERROR;
             /*if the next byte is not addr, waitting for next start ignore
             current frame of data*/
             cmd_start_received=ERROR;  
         }
         return;
    }

    /*received 4 bytes data */
    if(cmd_data_received==ERROR)
    {
        rxdata_buf[rxdata++]=current_byte;
        if(rxdata == 4u)
        {
            cmd_data_received=SUCCESS;
            rxdata=0; 
        }
        return;
    }

    /*get 0x55 0xaa  end*/
    if(cmd_stop_received==ERROR)//this flag is useless
    {
        usart_end[rxend++] = current_byte;
        if(rxend==2)
        {
            /*right stop*/
            if(usart_end[0]==0x55 && usart_end[1]==0xAA)
            {
                 cmd_stop_received=SUCCESS;
                 /*copy data*/
                 for(uint8_t i=0;i<4;i++)
                 {
                     rxData[i]=rxdata_buf[i];
                 }
                 /*flag to show cmd received*/
                 rx_buf_empty=ERROR;
            } 
            rxend=0;
        }
        return;
    }

    /*if 4 bytes command recieved, copy data to buffer  acctually not necessary*/
    if(rx_buf_empty==ERROR)
    {
        /*and no command is in processing*/
        if(command_pended==ERROR)
        {
         __disable_irq();
         for(int i=0;i<4;i++)
         {
             /*copy recieved command to process buf*/
             recieved_command_buf[i]=rxData[i];
             rxData[i]=0;
         }
         /*flag  recieve buf empty*/
         rx_buf_empty=SUCCESS;
         __enable_irq();
         /*commmand pend flag*/
         command_pended=SUCCESS;
        } 
    }

    /*if command is pended */
    if(command_pended==SUCCESS)
    {
        processPacket(recieved_command_buf); 
        //clear flag after process
        command_pended=ERROR; 
        /*data frame end  */
        cmd_start_received=ERROR;
        cmd_data_received=ERROR;
        cmd_stop_received=ERROR;
        address_match=ERROR; 
    }
}

/****************************Physical Layer**********************************
   1.send four bytes response
   2.receive four bytes data(not need, receive use irq)
****************************************************************************/


/******************************************************************************
  * @brief   sendResponseWait
  * @param  None
  * @retval None
  * @Description:    
         Sends the response packet and waits until the transmission is complete.
  */
 void sendResponseWait( uint8_t *tData )
{
    Enable_usart_tx();
    Delay_ms(1);
    uint8_t txPointer = 0;
    uint16_t Timeout;
    /*each data bag has 4 bytes*/
    while( txPointer!=4 ) 
    {    
        Timeout=0xFFFF;
        /*Wait until byte transmitted */          
        while((USART2->SR & USART_FLAG_TC) == 0)
        {
            if((Timeout--)==0) 
            {
                 return;
            }
        }
        USART2->DR = tData[txPointer++];
    }
          
    Timeout=0xFFFF;
    /* Wait until last byte transmitted*/        
    while((USART2->SR & USART_FLAG_TC) == 0)
    {
        if((Timeout--)==0) 
        {
             return;
        }
    }
    Disable_usart_tx();
}



 uint8_t  send_ad_data_usart(uint16_t * tPointer,uint8_t count)
 {
     static uint8_t dataH,dataL;
     Enable_usart_tx();
     while( count!=0 ) 
     {   
        dataH=(uint8_t)((*tPointer & 0xFF00)>>8);
        dataL=(uint8_t)(*tPointer & 0x00FF);

        uint16_t Timeout=0x0FFF;
        /*Wait until byte transmitted */           
        while((USART2->SR & USART_FLAG_TC) == 0)
        {
            if((Timeout--)==0) 
            {
                return ERROR;
            }
        }
        USART2->DR = dataH;

        while((USART2->SR & USART_FLAG_TC) == 0)
        {
            if((Timeout--)==0) 
            {
                return ERROR;
            }
        }
        USART2->DR = dataL;
        count--;
        tPointer++;
     }
     Disable_usart_tx();
     return SUCCESS;
 }
 uint8_t  send_ad_data_usart_x(USART_TypeDef* USARTx, uint16_t * tPointer,uint8_t count)
 {
     static uint8_t dataH,dataL;
     Enable_usart_tx();
     while( count!=0 ) 
     {   
       dataH=(uint8_t)((*tPointer & 0xFF00)>>8);
       dataL=(uint8_t)(*tPointer & 0x00FF);
       
       uint16_t Timeout=0x0FFF;
           // Wait until byte transmitted            
           while((USARTx->SR & USART_FLAG_TC) == 0)
              {
                if((Timeout--)==0) 
                {
                  return ERROR;
                }
              }
            USARTx->DR = dataH;
       
       Timeout=0x0FFF;
       while((USARTx->SR & USART_FLAG_TC) == 0)
              {
                if((Timeout--)==0) 
                {
                  return ERROR;
                }
              }
       USARTx->DR = dataL;
       
       count--;
       tPointer++;
     }
     Delay_ms(10);
     tPointer=0;
     Disable_usart_tx();
     return SUCCESS;
 }

/****************************transportation Layer****************************/
/* 1.verifyRxChecksum
   2.insertTxChecksum
   3.calcBIP4
   4.packResponse
   5.unpack command
****************************************************************************/

/******************************************************************************
  * @brief   verifyRxChecksum
  * @param  Data packet
  * @retval true/false
  * @Description:    
         Calculates the BIP-4 checksum for the incoming packet and compares it 
        to the received BIP-4 value. 
  */
uint8_t verifyRxChecksum( uint8_t *rData)
{
    uint8_t bip4Rec, bip4Calc;
    uint8_t commOK = ERROR;    // Assume the worst, a checksum error.

    bip4Rec = (rData[0] & 0xF0) >> 4;    // Extract incoming BIP-4 checksum
        bip4Calc = calcBIP4( rData );        // Calculate the checksum

    if( bip4Calc == bip4Rec )            // If they match....
    {
        commOK = SUCCESS;                    // 
    }

    return commOK;
}

/******************************************************************************
  * @brief   calcBIP4
  * @param  
  * @retval   BIP-4 checksum
  * @Description:    
         Calculates a BIP-4 checksum for the packet
  */
uint8_t calcBIP4( uint8_t *data) 
{
    uint8_t bip8 = (data[0] & 0x0F) ^ data[1] ^ data[2] ^ data[3];
    uint8_t bip4 = ((bip8 & 0xF0) >> 4) ^ (bip8 & 0x0F);

    return bip4;    // Return the BIP-4 value
}


/******************************************************************************
  * @brief   unpackCommand
  * @param  
  * @retval   Read/write flag, register number, data
  * @Description:    
       Extracts the read/write flag, register number, and data from the packet.
       
       unpackCommand( &flag, &regNumber, gInboundData );  
  */
void unpackCommand( uint8_t *flag, uint8_t *regNumber,uint8_t *rData )
{

    *flag = rData[0];
          
    /*Extract the register number*/
    *regNumber =rData[1];
    /*Extract the data into a 16-bit variable*/             
    gInboundData= rData[2];
    gInboundData =(gInboundData<<8u);
    gInboundData |= rData[3];
        
    gOutboundData = gInboundData;
}


/******************************************************************************
  * @brief   insertTxChecksum
  * @param  
  * @retval 
  * @Description:    
         calculates checksum and inserts it into the data packet
         update tx data
  */

 void insertTxChecksum( uint8_t * tData )
{
  uint8_t bip8 = (tData[0] & 0x0F) ^ tData[1] ^ tData[2] ^ tData[3];
  uint8_t bip4 = ((bip8 & 0xF0) >> 4) ^ (bip8 & 0x0F);
  bip4 <<= 4;            // Move checksum to 4 upper bits
  bip4 &= 0xF0;               // Set 4 lower bits to 0
  tData[0] |= bip4;          // Insert the checksum    
  
#if 0
    uint8_t chksum = 0;
    uint8_t *data = (uint8_t *)txData;
    chksum = calcBIP4( data );
    chksum <<= 4;            // Move checksum to 4 upper bits
    chksum &= 0xF0;            // Set 4 lower bits to 0
    data[0] |= chksum;    // Insert the checksum    
#endif
}

//only for test
/******************************************************************************
  * @brief   insertRxChecksum
  * @param  
  * @retval 
  * @Description:    
         calculates checksum and inserts it into the data packet
         update tx data
  */

void insertRxChecksum( uint8_t *rData)

{       
        
  uint8_t bip8 = (rData[0] & 0x0F) ^ rData[1] ^ rData[2] ^ rData[3];
  uint8_t bip4 = ((bip8 & 0xF0) >> 4) ^ (bip8 & 0x0F);
  bip4 <<= 4;            // Move checksum to 4 upper bits
  bip4 &= 0xF0;               // Set 4 lower bits to 0
  rData[0] |= bip4;          // Insert the checksum    
}


/******************************************************************************
  * @brief   packResponse
  * @param   Result flag, register number, data
  * @retval  
  * @Description:    
       Packages the result, register number and  outgoing    
       data for transmission to the host.
  */
void packResponse( uint8_t result, uint8_t regNumber, uint16_t data )
{
    txData[3] = (uint8_t)data; 
    txData[2] = (uint8_t)(data >> 8); 
    txData[1] = regNumber;

    txData[0] = 0x00;
    txData[0] |= result;
}



/****************************application Layer******************************/
/* 1.process packet
   2.process command
****************************************************************************/

/******************************************************************************
  * @brief   processPacket
  * @param   
  * @retval  
  * @Description:    
        Processes the command packet and sends the response.
  */
 void processPacket( uint8_t *rData )
{
    /*flag:read/write flag; regNumber:operate register; result:execution result*/
    uint8_t flag, regNumber, result;

#if 0
    /*Pass the packet through the transport layer functions*/
    if( !verifyRxChecksum( (uint8_t *)rData ) )
    { 
        /*Checksum error occurred - return packet with zero data and CE bit set.*/
        /*Set CE bit*/
        txData[0] = 0xff;
        /*Copy the register number*/
        txData[1] = rxData[1];
        txData[2] = 0xff;
        txData[3] = 0xff;
        //insertTxChecksum((uint8_t *) txData);
        sendResponseWait( (uint8_t *) txData);
        return;             
    }
#endif
    /*Process the packet at the application level
    Extract the read/write flag, dac_id dac channel number register number 
    and data from the rxData packet*/
    unpackCommand( &flag, &regNumber, (uint8_t *)rData); 

    /*Process the command (data is transferred through the global variable gInboundData)*/
    result = processCommand( regNumber, flag, gInboundData, &gOutboundData);

    /* Package up the result*/
    packResponse( result, regNumber, gOutboundData);

    /*insertTxChecksum((uint8_t *) txData);*/
    sendResponseWait((uint8_t *) txData);

    for(int i=0;i<4;i++)
    {
        txData[i]=0; 
    }
    gOutboundData=0;
    gInboundData=0;

}



/******************************************************************************
  * @brief   processCommand
  * @param   register number, read/write flag
  * @retval  result flag
  * @Description:    
        Calls the appropriate function to handle the current command.
  */
uint8_t processCommand( uint8_t regNumber, uint8_t flag, uint16_t indata, uint16_t* outdata)
{
  
    uint8_t result = ERROR;
    if(regNumber > (COMMAND_LIST_LENGTH-1u))
    {
        *outdata = 0xFFFF;
    }
    else
    {
        result = command_func_list[regNumber](flag, regNumber, indata, outdata);
    }
    return result;
}




/******************* (C) COPYRIGHT 2018  *****END OF FILE****/
