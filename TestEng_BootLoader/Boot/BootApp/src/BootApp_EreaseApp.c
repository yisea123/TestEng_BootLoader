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

BootApp_Status_ten BootApp_Erease_App(void)
{
    uint8_t ret = 1;
    uint32_t str_addr = BOOTAPP_APP_START_ADDR;
    uint32_t end_addr = BOOTAPP_APP_END_ADDR;
    uint32_t sect_siz = BOOTAPP_APP_SECTOR_SIZE;
    BootApp_Status_ten status_en = BOOTAPP_EREASE_ONGOING;

    for(;str_addr < end_addr; str_addr+=sect_siz)
    {
        ret = BootDrv_EreaseFlash(str_addr, sect_siz);
        if(0 == ret)
        {
            break;
        }
        else
        {
            /**/
        }
    }

    if( ret && (str_addr == end_addr + 1) )
    {
        status_en = BOOTAPP_EREASE_OK;
    }
    else
    {
        status_en = BOOTAPP_EREASE_ERR;
    }
    return status_en;
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

