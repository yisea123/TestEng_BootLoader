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


const BootApp_Flash_Info_tst BootApp_Flash_Info_cst =
{
    BOOTAPP_APP_START_ADDR,
    BOOTAPP_APP_END_ADDR,
    BOOTAPP_APP_LENGTH,
    BOOTAPP_APP_SECTOR_NUM,
    BOOTAPP_APP_SECTOR_SIZE,
    BOOTAPP_APP_PAGE_NUM,
    BOOTAPP_APP_PAGE_SIZE,
};



BootApp_Gpio_tst BootApp_Gpio_cst =
{
    BOOTAPP_APP_GPIO_NUM,
    BOOTAPP_APP_ADDR_NUM,
    &BootApp_App_GpioPin_cast[0],
};


BootApp_Uart_tst BootApp_Uart_cst =
{
    BOOTAPP_APP_UART_NUM,
    &BootApp_UartPort_cast[0],
};


const BootApp_App_Cfg_tst BootApp_App_Cfg_cst =
{
    &BootApp_Gpio_cst,
    &BootApp_Uart_cst,
#if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
    &BootApp_App_Prolog_st,
    &BootApp_Epilog_st,
#else
    (const BootApp_Prolog_tst *)BOOTAPP_PROLOG_BASE_ADDR,
    (const BootApp_Epilog_tst *)BOOTAPP_EPILOG_BASE_ADDR,
#endif
};

const BootApp_App_Cfg_tst * const BootApp_App_Cfg_cpcst = &BootApp_App_Cfg_cst;



/*<BASDKey>
 ***********************************************************************************************************************
 * $History___:
 *
 * U1.0.0;      20.05.2019 new created for BootLoader  he.huang@feedlitech.com
 *
 * $
 ***********************************************************************************************************************
</BASDKey>*/

