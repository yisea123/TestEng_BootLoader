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
#ifndef _BOOTAPP_CFG_H_
#define _BOOTAPP_CFG_H_

#define TestEng_FL0001A00   0
#define TestEng_FLT804A00   1
#define TestEng_Debug       2

#define BOOTAPP_BOARD_SUPPORT      TestEng_FL0001A00

#if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
typedef unsigned char   uint8_t;
typedef unsigned short  uint16_t;
typedef unsigned long   uint32_t;
#define BootApp_Enter_Schm()
#define BootApp_Exit_Schm()

#elif
#include "include.h"
#define BootApp_Enter_Schm() __disable_irq()
#define BootApp_Exit_Schm()  __enable_irq()

#endif

#define BOOTAPP_APP_START_ADDR     0x0800C000
#define BOOTAPP_APP_END_ADDR       0x0801FFFF
#define BOOTAPP_APP_SECTOR_SIZE    0x400
#define BOOTAPP_APP_LENGTH         (BOOTAPP_APP_END_ADDR - BOOTAPP_APP_START_ADDR + 1)
#define BOOTAPP_APP_SECTOR_NUM     ( BOOTAPP_APP_LENGTH/ BOOTAPP_APP_SECTOR_SIZE)
#define BOOTAPP_APP_PAGE_SIZE      0x200
#define BOOTAPP_APP_PAGE_NUM       (BOOTAPP_APP_SECTOR_SIZE / BOOTAPP_APP_PAGE_SIZE)
#define BOOTAPP_APP_MAX_PAGE_NUM   (16)



#define BOOTAPP_PROLOG_BASE_ADDR   0x0800C400
#define BOOTAPP_PROLOG_END_ADDR    0x0800C7FF
#define BOOTAPP_PROLOG_SIZE        (BOOTAPP_PROLOG_END_ADDR - BOOTAPP_PROLOG_BASE_ADDR + 1)


#define BOOTAPP_EPILOG_BASE_ADDR   0x0801FC00
#define BOOTAPP_EPILOG_END_ADDR    0x0801FFFF
#define BOOTAPP_EPILOG_SIZE       (BOOTAPP_EPILOG_END_ADDR - BOOTAPP_EPILOG_BASE_ADDR + 1)


#if(BOOTAPP_APP_PAGE_NUM > BOOTAPP_APP_MAX_PAGE_NUM)
#error "Invalid page length configured!"
#endif



#define BOOTAPP_MAGIC_WORD_ADDR    0x20000000
#define BOOTAPP_MAGIC_WORD         0xABCD
#define BOOTAPP_MAGIC_WORD_DATA    0xDCBA
#define BOOTAPP_MAGIC_WORD_DEFAULT 0x0000

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

