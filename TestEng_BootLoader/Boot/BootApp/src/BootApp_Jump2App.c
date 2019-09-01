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

    __disable_irq();
    if(((*(uint32_t*)BOOTAPP_MAIN_ADDR)&0x2FFE0000)==0x20000000)
    {
        uint32_t   *app_main;
        app_main = (uint32_t *)(BOOTAPP_MAIN_ADDR + 4);
        __set_MSP(*(volatile uint32_t*) BOOTAPP_MAIN_ADDR);
        ((void (*)())(*app_main))();
    }

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
