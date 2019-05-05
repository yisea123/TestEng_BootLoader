/**
  ******************************************************************************
  * @file    irq.c  burn in system
  * @author  h&h
  * @version 
  * @date    
  * @brief

  ******************************************************************************
**/ 

#include "include.h"

/*counter*/
uint8_t rxstart=0;
uint8_t rxdata=0;
uint8_t rxend=0;
/*data*/
uint8_t usart_start[2]={0};
uint8_t usart_end[2]={0};
uint8_t rxdata_buf[4]={0};
/*flag*/
uint8_t cmd_start_received=ERROR;
uint8_t cmd_data_received=ERROR;
uint8_t cmd_stop_received=ERROR;
/*addr*/
uint8_t address_match=ERROR;
uint8_t boardaddr=0;



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
__ramfunc void USART1_IRQHandler(void)
{
   uint8_t current_byte;
   /*clear USART_IT_RXNE flag*/
   USART1->SR &= (uint16_t)~USART_IT_RXNE;
   /*get current received data*/
   current_byte=USART1->DR;
   
   /*waitting for 0xaa 0x55  start*/
   if(cmd_start_received==ERROR)
   {
       usart_start[rxstart++] = current_byte;
       if(rxstart==2)
       {
	   if((usart_start[0]==0xAA)&&(usart_start[1]==0x55))
	   {
	       cmd_start_received=SUCCESS;
	       usart_start[0]=usart_start[1]=0;
	       rxstart=0;
	   }
	   else
	   {
	       /*start not received*/
	       cmd_start_received=ERROR;
	       usart_start[0]=usart_start[1];
	       usart_start[1]=0;
	       rxstart=1;
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
       if(rxdata==4)
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
	          rxData[i]=rxdata_buf[i];
	       /*flag to show cmd received*/
	       rx_buf_empty=ERROR;
	   }
	   /*data frame end  */
	   cmd_start_received=ERROR;
	   cmd_data_received=ERROR;
	   cmd_stop_received=ERROR;
	   address_match=ERROR;  

	   rxend=0;
       } 
       return;
   }
}


 


/*******************************************************************************
* Function Name  : TIM2_IRQHandler
* Description    : 
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void TIM2_IRQHandler(void)
{
     
     TIM_ClearFlag(TIM2, TIM_FLAG_Update);
}
/*******************************************************************************
* Function Name  : NMI_Handler
* Description    : This function handles NMI exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void NMI_Handler(void)
{
}

/*******************************************************************************
* Function Name  : HardFault_Handler
* Description    : This function handles Hard Fault exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void HardFault_Handler(void)
{
  /* Go to infinite loop when Hard Fault exception occurs */
  while (1)
  {
  }
}

/*******************************************************************************
* Function Name  : MemManage_Handler
* Description    : This function handles Memory Manage exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void MemManage_Handler(void)
{
  /* Go to infinite loop when Memory Manage exception occurs */
  while (1)
  {
  }
}

/*******************************************************************************
* Function Name  : BusFault_Handler
* Description    : This function handles Bus Fault exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void BusFault_Handler(void)
{
  /* Go to infinite loop when Bus Fault exception occurs */
  while (1)
  {
  }
}

/*******************************************************************************
* Function Name  : UsageFault_Handler
* Description    : This function handles Usage Fault exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void UsageFault_Handler(void)
{
  /* Go to infinite loop when Usage Fault exception occurs */
  while (1)
  {
  }
}

/*******************************************************************************
* Function Name  : SVC_Handler
* Description    : This function handles SVCall exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void SVC_Handler(void)
{
}

/*******************************************************************************
* Function Name  : DebugMon_Handler
* Description    : This function handles Debug Monitor exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void DebugMon_Handler(void)
{
}

/*******************************************************************************
* Function Name  : PendSV_Handler
* Description    : This function handles PendSVC exception.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void PendSV_Handler(void)
{
}

/*******************************************************************************
* Function Name  : SysTick_Handler
* Description    : This function handles SysTick Handler.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
#if 0
void SysTick_Handler(void)
{

}
#endif
/*******************************************************************************
* Function Name  : RTC_IRQHandler
* Description    : This function handles RTC global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void RTC_IRQHandler(void)
{
 
}


/*******************************************************************************
* Function Name  : SPI2_IRQHandler
* Description    : This function handles SPI2 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void SPI2_IRQHandler(void)
{

}

/*******************************************************************************
* Function Name  : SPI2_IRQHandler
* Description    : This function handles SPI2 global interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void I2C1_ER_IRQHandler(void)
{
  
}




/*******************************************************************************
* Function Name  : RTCAlarm_IRQHandler
* Description    : This function handles RTC Alarm interrupt request.
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void RTCAlarm_IRQHandler(void)
{
  
}




/******************* (C) COPYRIGHT 2018 *****END OF FILE****/

#if 0   
   if ((USART1->SR & USART_IT_RXNE) != (uint16_t)RESET   && (address_match==ERROR))
   { 
     /*clear USART_IT_RXNE flag*/
     USART1->SR &= (uint16_t)~USART_IT_RXNE; 
     
     boardaddr=USART1->DR;
     
     if(boardaddr==Board_address)
     {
       address_match=SUCCESS;
       
       //Enable_usart_tx();
     }
     else
     {
       //Disable_usart_tx();
       address_match=ERROR;
     }
   }
  
  if((USART1->SR & USART_IT_RXNE) != (uint16_t)RESET   && (address_match==SUCCESS))
  {
      /*clear USART_IT_RXNE flag*/
      USART1->SR &= (uint16_t)~USART_IT_RXNE;
      //if recieve buf is empty recieve command  else disgard it
      if(rx_buf_empty==SUCCESS)
      {
	   rxData[rxCounter++]=USART1->DR;
          if(rxCounter==4)
          {
	     rxCounter=0;
	     address_match=ERROR;
	     rx_buf_empty=ERROR;//show recieve buf full
	  }
      }
      else
      {
        address_match=ERROR;
      }
  }
  
#endif