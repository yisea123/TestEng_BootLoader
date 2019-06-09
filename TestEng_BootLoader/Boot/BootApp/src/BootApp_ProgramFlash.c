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

BootApp_WriteData_tst BootApp_WriteData_ast[BOOTAPP_APP_SECTOR_NUM] = {{0},};

BootApp_Status_ten BootApp_Program_Flash(const BootApp_CommunicationBuffer_tst *ComBuffer_pst)
{
    uint16_t sec_ready_u16;
    uint16_t sec_num_u16;
    uint32_t start_addr_u32;
    uint32_t end_addr_u32;
    uint32_t length_u32;
    uint8_t validate_res = 0;
    uint8_t w_flash_st = 0;

    BootApp_Status_ten status_en = BOOTAPP_WDAT_ONGOING;

    const BootApp_ReceiveData_tst * receivedata_pcst;
    const BootApp_CmdBuffer_tst * CmdBuffer_pst = &(ComBuffer_pst->cmdbuffer_st);
    BootApp_WriteData_tst * BootApp_WriteData_Pst;

    BootApp_Get_ReceiveData_Info(&receivedata_pcst);
    if((void *)0 != receivedata_pcst)
    {
        sec_ready_u16 = receivedata_pcst->sect_ready_u16;
        sec_num_u16 = receivedata_pcst->sect_num_u16;
        start_addr_u32 = receivedata_pcst->start_addr_u32;
        end_addr_u32 = receivedata_pcst->end_addr_u32;
        length_u32 = end_addr_u32 - start_addr_u32 + 1;
        validate_res = 1;
    }
    else
    {
        validate_res = 0;
        status_en = BOOTAPP_WDAT_GET_DATAINFO_ERR;
    }

    if(1 == validate_res)
    {
        if(sec_ready_u16)
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_WDAT_DATA_NOT_READY_ERR;
            validate_res = 0;
        }
    }

    if(1 == validate_res)
    {
        if( start_addr_u32 == BOOTAPP_APP_START_ADDR + (sec_num_u16 - 1u)*BOOTAPP_APP_SECTOR_SIZE )
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_WDAT_SEC_ADDR_ALIGN_ERR;
            validate_res = 0;
        }
    }

    if(1 == validate_res)
    {
        if(BOOTAPP_APP_SECTOR_SIZE == length_u32)
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_WDAT_SEC_LEN_ERR;
            validate_res = 0;
        }
    }
    if(1 == validate_res)
    {
        if( (sec_num_u16 >= 1) && (sec_num_u16 <= BOOTAPP_APP_SECTOR_NUM) )
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_WDAT_SEC_NUM_ERR;
            validate_res = 0;
        }
    }
    if(1 == validate_res)
    {
        if(CmdBuffer_pst->cmd16_01 == sec_num_u16)
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_WDAT_SEC_NOT_MATCH_ERR;
            validate_res = 0;
        }
    }

    if(1 == validate_res)
    {
        if( (CmdBuffer_pst->cmd32_00 == start_addr_u32)&&
            (CmdBuffer_pst->cmd32_01 == end_addr_u32) )
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_WDAT_ADDR_NOT_MATCH_ERR;
            validate_res = 0;
        }
    }

    if(1 == validate_res)
    {
        BootApp_WriteData_Pst = &BootApp_WriteData_ast[sec_num_u16 - 1];
        /*sector empty*/
        if(! BootApp_WriteData_Pst->sect_prog_u16)
        {
            w_flash_st = BootDrv_ProgramFlash(start_addr_u32, end_addr_u32, length_u32);
        }

        BootApp_WriteData_Pst->sect_num_u16 = sec_num_u16;
        BootApp_WriteData_Pst->start_addr_u32 = start_addr_u32;
        BootApp_WriteData_Pst->end_addr_u32 = end_addr_u32;
        BootApp_WriteData_Pst->sect_prog_u16 = w_flash_st;

        if(w_flash_st)
        {
            if(BootApp_Program_Flash_Finish())
            {
                status_en = BOOTAPP_WDAT_FINISH;
            }
            else
            {
                status_en = BOOTAPP_WDAT_SEC_FINISH;
            }
        }
        else
        {
            status_en = BOOTAPP_WDAT_PROG_FLASH_ERR;
        }

    }

    return status_en;
}

uint8_t BootApp_Program_Flash_Finish(void)
{
    uint8_t ret = 0;
    uint16_t i;
    BootApp_WriteData_tst * BootApp_WriteData_past;
    BootApp_WriteData_past = &BootApp_WriteData_ast[0];
    for(i=0; i<BOOTAPP_APP_SECTOR_NUM; i++)
    {
        if( (BootApp_WriteData_past + i)->sect_prog_u16 )
            continue;
    }

    if(BOOTAPP_APP_SECTOR_NUM == i)
    {
        ret = 1;
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
