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

BootApp_Status_ten BootApp_App_Valid_en = BOOTAAPP_VALI_NOT_COMPLETE;
static uint8_t BootApp_Validate_Info(const BootApp_App_Cfg_tst * App_Cfg_cpcst);

BootApp_Status_ten BootApp_Validate_App(void)
{
    uint8_t ret;
    if( (void *)0 != BootApp_App_Cfg_cpcst )
    {
        ret = BootApp_Validate_Info(BootApp_App_Cfg_cpcst);
        if(ret)
        {
            BootApp_App_Valid_en = BOOTAAPP_VALI_COMPLETE;
        }
        else
        {
            BootApp_App_Valid_en = BOOTAAPP_VALI_NOT_COMPLETE;
        }
    }
    else
    {
        BootApp_App_Valid_en = BOOTAAPP_VALI_APPCFG_INVALID;
    }

    return BootApp_App_Valid_en;
}

uint8_t BootApp_Validate_Info(const BootApp_App_Cfg_tst * App_Cfg_cpcst)
{
    uint8_t i;
    uint8_t ret = 0;

    const BootApp_Prolog_tst * app_cfg_prolog_cpcst = App_Cfg_cpcst->app_cfg_prolog_cpcst;
    const BootApp_Epilog_tst * app_cfg_epilog_cpcst = App_Cfg_cpcst->app_cfg_epilog_cpcst;

    if( BootApp_Addr_Prolog_Validate(app_cfg_prolog_cpcst) &&
        BootApp_Addr_Epilog_Validate(app_cfg_epilog_cpcst) )
    {
        for(i=0; i<16; i++)
        {
            if(app_cfg_prolog_cpcst->app_cfg_hardversion[i] !=
                    app_cfg_epilog_cpcst->app_cfg_hardversion[i])
            {
                ret = 0;
                break;
            }
            else
            {
                ret = 1;
            }
        }

        if(ret)
        {
            for(i=0; i<16; i++)
            {
                if(app_cfg_prolog_cpcst->app_cfg_signature[i] !=
                            app_cfg_epilog_cpcst->app_cfg_signature[i])
                {
                    ret = 0;
                    break;
                }
                else
                {
                    ret = 1;
                }
            }
        }

        if(ret)
        {
            for(i=0; i<16; i++)
            {
                if(app_cfg_prolog_cpcst->app_cfg_fwversion[i] !=
                            app_cfg_epilog_cpcst->app_cfg_fwversion[i])
                {
                    ret = 0;
                    break;
                }
                else
                {
                    ret = 1;
                }
            }
        }

    }
    else
    {
        ret = 0;
    }

    return ret;
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
