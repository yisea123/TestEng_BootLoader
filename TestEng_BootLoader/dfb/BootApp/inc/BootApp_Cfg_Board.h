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
#ifndef _BOOTAPP_CFG_BOARD_H_
#define _BOOTAPP_CFG_BOARD_H_

#include "BootApp_Cfg.h"

#if (BOOTAPP_BOARD_SUPPORT == TestEng_FL0001A00)

#define BOOTAPP_APP_GPIO_NUM 10
#define BOOTAPP_APP_ADDR_NUM 6
#define BOOTAPP_APP_UART_NUM 1

#define BootApp_GPIO_TypeDef      GPIO_TypeDef
#define BootApp_GPIO_InitTypeDef  GPIO_InitTypeDef
#define BootApp_GPIO_Init         GPIO_Init

#define BootApp_USART_TypeDef     USART_TypeDef
#define BootApp_USART_InitTypeDef USART_InitTypeDef
#define BootApp_UART_Init         USART_Init

#elif (BOOTAPP_BOARD_SUPPORT == TestEng_FLT804A00)

#define BOOTAPP_APP_GPIO_NUM 10
#define BOOTAPP_APP_ADDR_NUM 6
#define BOOTAPP_APP_UART_NUM 1

#define BootApp_GPIO_TypeDef      GPIO_TypeDef
#define BootApp_GPIO_InitTypeDef  GPIO_InitTypeDef
#define BootApp_GPIO_Init         GPIO_Init

#define BootApp_USART_TypeDef     USART_TypeDef
#define BootApp_USART_InitTypeDef USART_InitTypeDef
#define BootApp_UART_Init         USART_Init


#elif (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)

#define BOOTAPP_APP_GPIO_NUM 6
#define BOOTAPP_APP_ADDR_NUM 4
#define BOOTAPP_APP_UART_NUM 1

#define BootApp_GPIO_TypeDef      uint8_t
#define BootApp_GPIO_InitTypeDef  uint8_t
#define BootApp_GPIO_Init         GPIO_Init

#define BootApp_USART_TypeDef     uint8_t
#define BootApp_USART_InitTypeDef uint8_t
#define BootApp_UART_Init         USART_Init

extern void GPIO_Init(BootApp_GPIO_TypeDef * GPIO_TypeDef, const BootApp_GPIO_InitTypeDef * GPIO_InitTypeDef);
extern void USART_Init(BootApp_USART_TypeDef * USART_TypeDef, const BootApp_USART_InitTypeDef * USART_InitTypeDef);

#endif



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

