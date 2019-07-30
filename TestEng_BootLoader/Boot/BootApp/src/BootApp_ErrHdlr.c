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

void BootApp_Log_Exe_Status(BootApp_State_ten state_en,
                            BootApp_Status_ten status_en)
{
    BootApp_StsBuffer_tst * StsBuffer_pst = (void *)0;
    BootApp_Get_StatusBuf(&StsBuffer_pst);

    StsBuffer_pst->sts16_00 = state_en;
    StsBuffer_pst->sts16_01 = status_en;
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

