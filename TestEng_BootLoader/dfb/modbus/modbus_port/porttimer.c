
#include "include.h"
#include "port.h"
#include "mb.h"
#include "mbport.h"



static void prvvTIMERExpiredISR( void );

BOOL xMBPortTimersInit( USHORT usTim1Timerout50us )
{
  TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
  NVIC_InitTypeDef NVIC_InitStructure;
  //
  uint16_t PrescalerValue = 0;
  

  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4, ENABLE);
  

  PrescalerValue = (uint16_t) (SystemCoreClock / 20000) - 1; 

  TIM_TimeBaseStructure.TIM_Period = (uint16_t) usTim1Timerout50us;
  TIM_TimeBaseStructure.TIM_Prescaler = PrescalerValue;
  TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
  TIM_TimeBaseInit(TIM4, &TIM_TimeBaseStructure);

  TIM_ARRPreloadConfig(TIM4, ENABLE);
  
  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_1);

  NVIC_InitStructure.NVIC_IRQChannel = TIM4_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 3;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  

  TIM_ClearITPendingBit(TIM4,TIM_IT_Update);

  TIM_ITConfig(TIM4, TIM_IT_Update, DISABLE);

  TIM_Cmd(TIM4,  DISABLE);
  return TRUE;
}


void vMBPortTimersEnable( )
{
    TIM_ClearITPendingBit(TIM4, TIM_IT_Update);
    TIM_ITConfig(TIM4, TIM_IT_Update, ENABLE);
    TIM_SetCounter(TIM4,0x0000); 
    TIM_Cmd(TIM4, ENABLE);
}

void vMBPortTimersDisable(  )
{
    TIM_ClearITPendingBit(TIM4, TIM_IT_Update);
    TIM_ITConfig(TIM4, TIM_IT_Update, DISABLE);
    TIM_SetCounter(TIM4,0x0000); 
    TIM_Cmd(TIM4, DISABLE);
}
void vMBPortTimersDelay( USHORT usTimeOutMS )
{


}

static void prvvTIMERExpiredISR( void )
{
    ( void )pxMBPortCBTimerExpired();
}

void TIM4_IRQHandler(void)
{
    if (TIM_GetITStatus(TIM4, TIM_IT_Update) != RESET)
    {
        TIM_ClearITPendingBit(TIM4, TIM_IT_Update);
        prvvTIMERExpiredISR();
    }
}



