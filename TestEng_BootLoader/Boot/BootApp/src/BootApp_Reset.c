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

#pragma location = "ram_noinit" 
__root uint16_t magic_word;

BootApp_Reset_ten BootApp_Reset_en = BOOTAPP_RESET_POWERON;

BootApp_Reset_ten BootApp_GetReset_Reason(void)
{
#if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
    return BOOTAPP_RESET_POWERON;
#else
    uint16_t magic_word;
    magic_word = BootApp_Get_MagicWord();
    if(BOOTAPP_MAGIC_WORD == magic_word)
    {
        BootApp_Set_MagicWord(BOOTAPP_MAGIC_WORD_DEFAULT);
        BootApp_Reset_en = BOOTAPP_RESET_PROG;
    }
    else
    {
        BootApp_Reset_en = BOOTAPP_RESET_POWERON;
    }
    return BootApp_Reset_en;

#endif
}


void BootApp_Reset_Sys(void)
{
    BootApp_Set_MagicWord(BOOTAPP_MAGIC_WORD_DEFAULT);
    BootDrv_Reset();
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
