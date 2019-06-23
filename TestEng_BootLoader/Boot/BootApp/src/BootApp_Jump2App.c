/*<BASDKey>
 **********************************************************************************************************************
 *
 * COPYRIGHT RESERVED, FeedLiTech, 2019. All rights reserved.
 * The reproduction, distribution and utilization of this document as well as the communication of its contents to
 * others without explicit authorization is prohibited. Offenders will be held liable for the payment of damages.
 * All rights reserved in the event of the grant of a patent, utility model or design.
 *
 **********************************************************************************************************************
</BASDKey>*/

#include "BootApp_Cfg.h"
#include "BootApp_Cfg_Board.h"
#include "BootApp_Type.h"
#include "BootApp_Priv.h"

void BootApp_Run_App(void)
{
#if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
    ;
#else

      if(((*(uint32_t*)BOOTAPP_APP_START_ADDR)&0x2FFE0000)==0x20000000)
      {
          //__set_PSP(*(volatile uint32_t*) BOOTAPP_APP_START_ADDR);
          //__set_CONTROL(0);
          __set_MSP(*(volatile uint32_t*) BOOTAPP_APP_START_ADDR);
          NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0xC000);
          ((*((ptf)(BOOTAPP_APP_START_ADDR + 4)))());
      }
  
#if 0
  TIM_ITConfig(TIM4,TIM_IT_Update,DISABLE);
  TIM_Cmd(TIM4, DISABLE);
  USART_DeInit(USART1);
  USART_DeInit(USART2);
  USART_ITConfig(USART1, USART_IT_RXNE, DISABLE);
  USART_ITConfig(USART1, USART_IT_TXE, DISABLE);
  USART_ITConfig(USART2, USART_IT_RXNE, DISABLE);
  USART_ITConfig(USART2, USART_IT_TXE, DISABLE);
  Delay_ms(10);
  
  __disable_irq();
  ptf app_main;
  if(((*(uint32_t*)BOOTAPP_APP_START_ADDR)&0x2FFE0000)==0x20000000)
  {
      __set_MSP(*(volatile uint32_t*)BOOTAPP_APP_START_ADDR);
      app_main = (ptf)(volatile uint32_t *)(BOOTAPP_APP_START_ADDR + 4);
      app_main();
      //((*((ptf)(BOOTAPP_APP_START_ADDR + 4)))());
  }
#endif

#endif
}


/*<BASDKey>
 ***********************************************************************************************************************
 * $History___:
 *
 * U1.0.0;      20.05.2019 new created for BootLoader he.huang@feedlitech.com
 *
 * $
 ***********************************************************************************************************************
</BASDKey>*/
