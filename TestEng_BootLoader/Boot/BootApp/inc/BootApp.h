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

#ifndef _BOOTAPP_H_
#define _BOOTAPP_H_

#include "BootApp_Cfg.h"

extern void BootApp_StateMachine(void);

#if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
void BootApp_Get_Uart(BootApp_USART_TypeDef * USART_TypeDef);
#else
void BootApp_Get_Uart(USART_TypeDef * USART_TypeDef);
#endif

extern void BootApp_Disable_usart_rx(void);
extern void BootApp_Enable_usart_rx(void);
extern void BootApp_Disable_usart_tx(void);
extern void BootApp_Enable_usart_tx(void);

#endif

/*<BASDKey>
 ***********************************************************************************************************************
 * $History___:
 *
 * U1.0.0;      20.05.2019 new created for BootLoader he.huang@feedlitech.com
 *
 * $
 ***********************************************************************************************************************
</BASDKey>*/

