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


#include "include.h"
#include "mb.h"

#include "BootApp_Cfg.h"
#include "BootApp_Cfg_Board.h"
#include "BootApp_Type.h"
#include "BootApp_Priv.h"
#include "BootApp.h"


 void main(void)
{
    uint8_t slave_addr;
    SystemInit();
    Delay_Init(72); 

    /*Disable JTAG  Enable SWD*/
    AFIO->MAPR |= AFIO_MAPR_SWJ_CFG_JTAGDISABLE;

    while(1)
    {
        BootApp_StateMachine();
    }

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

