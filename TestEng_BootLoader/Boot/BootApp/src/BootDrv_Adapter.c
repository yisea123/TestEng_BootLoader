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

#if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
void BootDrv_Reset(void)
{

}

uint8_t BootDrv_EreaseFlash(uint32_t str_addr_u32, uint32_t sect_siz_u32)
{
    return 1;
}

uint8_t BootDrv_ProgramFlash(uint32_t start_addr_u32, uint32_t end_addr_u32, uint32_t length_u32)
{
    return 1;
}

#else

void BootDrv_Reset(void)
{
    __set_FAULTMASK(1);
    NVIC_SystemReset();
}

uint8_t BootDrv_EreaseFlash(uint32_t str_addr_u32, uint32_t sect_siz_u32)
{
    uint8_t ret;
    
    FLASH_Status sts;
    if( (str_addr_u32 >= BOOTAPP_APP_START_ADDR) &&
        (str_addr_u32 < BOOTAPP_APP_END_ADDR) )
    {
        BootApp_Enter_Schm();
        FLASH_Unlock();
        str_addr_u32 &= BOOTAPP_APP_SECTOR_SIZE;
        sts = FLASH_ErasePage(str_addr_u32);
        FLASH_Lock();
        BootApp_Exit_Schm();

        if(FLASH_COMPLETE == sts)
        {
            ret = 1;
        }
        else
        {
            ret = 0;
        }
    }
    else
    {
        ret = 0;
    }
    return ret;
}

uint8_t BootDrv_ProgramFlash(uint32_t start_addr_u32, uint32_t end_addr_u32, uint32_t length_u32)
{
    uint8_t ret;
    uint16_t i;
    uint32_t data;
    FLASH_Status sts = FLASH_BUSY;

    (void)length_u32;
    if( (start_addr_u32 >= BOOTAPP_APP_START_ADDR) &&
        (start_addr_u32 < BOOTAPP_APP_END_ADDR) )
    {
        BootApp_Enter_Schm();
        FLASH_Unlock();

        for(i=0; i<BOOTAPP_APP_SECTOR_SIZE/4; i++)
        {
            
            ret = BootApp_SectBuffer_Read(i, 1, &data);
            if(ret)
            {
                sts = FLASH_ProgramWord(start_addr_u32, data);
            }
            else
            {
                break;
            }
        }
        FLASH_Lock();
        BootApp_Exit_Schm();

        if(FLASH_COMPLETE == sts)
        {
            ret = 1;
        }
        else
        {
            ret = 0;
        }
    }
    else
    {
        ret = 0;
    }
    return ret;

}


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

