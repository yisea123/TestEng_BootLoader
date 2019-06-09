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

BootApp_SectBuffer_ten BootApp_SectBuffer_en = {{0},};
BootApp_CommunicationBuffer_ten BootApp_CommunicationBuffer_en = {{0},};
BootApp_ReceiveData_tst BootApp_ReceiveData_st = {0};

const uint16_t BootApp_Sect_Dirty_Msk_au16[16 + 1] =
{
    0x0000,
    0x0001, 0x0003, 0x0007, 0x000F, 0x001F, 0x003F, 0x007F, 0x00FF,
    0x01FF, 0x03FF, 0x07FF, 0x0FFF, 0x1FFF, 0x3FFF, 0x7FFF, 0xFFFF,
};


uint8_t BootApp_NewCmd_Received(const BootApp_CmdBuffer_tst *CmdBuffer_pst)
{
    uint8_t ret;
    static uint32_t magic_num = 0;
    if(CmdBuffer_pst->cmd32_07 != magic_num)
    {
        ret = 1;
    }
    else
    {
        ret = 0;
    }
    magic_num = CmdBuffer_pst->cmd32_07;

    return ret;
}



BootApp_State_ten BootApp_Get_Command(const BootApp_CmdBuffer_tst * CmdBuffer_pst)
{
    BootApp_State_ten state_en;
    state_en = (BootApp_State_ten)CmdBuffer_pst->cmd16_00;
    if(state_en < BOOTAPP_STATE_NUMB)
    {

    }
    else
    {
        state_en = BOOTAPP_STATE_RCMD;
    }
    return state_en;
}

uint8_t BootApp_SectBuffer_Write(uint16_t start_addr, uint16_t length, const uint32_t *src)
{
    uint8_t ret;
    uint32_t * des;

    if( (start_addr > BOOTAPP_APP_SECTOR_SIZE>>2 ) ||
        (start_addr + length > BOOTAPP_APP_SECTOR_SIZE>>2) ||
        (0 == length) ||
        ((void*)0 == src) )
    {
        ret = 0;
    }
    else
    {
        des = &BootApp_SectBuffer_en.buf_au32[start_addr];
        while(length--)
        {
            *des++ = *src++;
        }
        ret = 1;
    }
    return ret;
}

uint8_t BootApp_SectBuffer_Read(uint16_t start_addr, uint16_t length, uint32_t *des)
{
    uint8_t ret;
    uint32_t * src;

    if( (start_addr > BOOTAPP_APP_SECTOR_SIZE/2 - 1) ||
        (start_addr + length > BOOTAPP_APP_SECTOR_SIZE/2 -1) ||
        (0 == length) ||
        ((void*)0 == des) )
    {
        ret = 0;
    }
    else
    {
        src = &BootApp_SectBuffer_en.buf_au32[start_addr];
        while(length--)
        {
            *des++ = *src++;
        }
        ret = 1;
    }
    return ret;
}


uint8_t BootApp_PageBuffer_Read(BootApp_PageBuffer_ten * page_buffer,
                                uint16_t start_addr, uint16_t length, uint32_t *des)
{
    uint8_t ret;
    uint32_t * src;

    if( (start_addr > BOOTAPP_APP_PAGE_SIZE/2) ||
        (start_addr + length > BOOTAPP_APP_PAGE_SIZE/2) ||
        (0 == length) ||
        ((void*)0 == des) )
    {
        ret = 0;
    }
    else
    {
        src = &page_buffer->buf_au32[start_addr];
        while(length--)
        {
            *des++ = *src++;
        }
        ret = 1;
    }
    return ret;
}

BootApp_Status_ten BootApp_Receive_Data(const BootApp_CommunicationBuffer_tst *ComBuffer_pst)
{
    uint8_t validate_res = 0;
    uint8_t w_buffer_st = 0;

    BootApp_Status_ten status_en = BOOTAPP_RDATA_ONGOING;
    BootApp_ReceiveData_tst receivedata_st = {0};
    BootApp_ReceiveData_tst *receivedata_pst = &BootApp_ReceiveData_st;

    const BootApp_CmdBuffer_tst * CmdBuffer_pst = &(ComBuffer_pst->cmdbuffer_st);
    const BootApp_PageBuffer_ten * PageBuffer_pen = &(ComBuffer_pst->pagebuffer_en);

    BootApp_Enter_Schm();
    receivedata_st.sect_num_u16 = CmdBuffer_pst->cmd16_01;
    receivedata_st.page_num_u16 = CmdBuffer_pst->cmd16_02;
    receivedata_st.page_len_u16 = CmdBuffer_pst->cmd16_03;
    receivedata_st.page_str_addr_u16 = CmdBuffer_pst->cmd16_04;
    receivedata_st.page_end_addr_u16 = CmdBuffer_pst->cmd16_05;
    receivedata_st.start_addr_u32 = CmdBuffer_pst->cmd32_00;
    receivedata_st.end_addr_u32 = CmdBuffer_pst->cmd32_01;
    BootApp_Exit_Schm();

    receivedata_st.sect_dirty_u16 = receivedata_pst->sect_dirty_u16;
    receivedata_st.sect_ready_u16 = receivedata_pst->sect_ready_u16;
    /*sector buffer not empty*/
    if(receivedata_st.sect_ready_u16)
    {
        status_en = BOOTAPP_RDATA_BUF_FUL_ERR;
        return status_en;
    }
    /*validate sector number sector number starts from 1 to N, N...4*/
    if( (receivedata_st.sect_num_u16 <= BOOTAPP_APP_SECTOR_NUM) &&
        (receivedata_st.sect_num_u16 >= 1) )
    {
        /*sector not finished*/
        if(receivedata_st.sect_dirty_u16 != 0)
        {
            /*continue write current sector*/
            if(receivedata_pst->sect_num_u16 == receivedata_st.sect_num_u16)
            {
                validate_res = 1;
            }
            else
            {
                status_en = BOOTAPP_RDATA_SEC_N_COMPLETE_ERR;
                validate_res = 0;
            }
        }
        else
        {
            /*previous sector write finished, latest sector shall be the next one*/
            if(receivedata_st.sect_num_u16 == receivedata_pst->sect_num_u16 + 1)
            {
                validate_res = 1;
            }
            else
            {
                status_en = BOOTAPP_RDATA_SEC_N_CONTIOUS_ERR;
                validate_res = 0;
            }
        }
    }
    else
    {
        status_en = BOOTAPP_RDATA_INVALID_SEC_ERR;
        validate_res = 0;
    }

    /*validate page info*/
    if(validate_res)
    {
        if( (receivedata_st.page_num_u16 <= BOOTAPP_APP_PAGE_NUM) &&
            (receivedata_st.page_num_u16 >= 1) )
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_RDATA_INVALID_PAGE_ERR;
            validate_res = 0;
        }
    }
    else
    {

    }

    if(validate_res)
    {
        if( (receivedata_st.page_len_u16 == BOOTAPP_APP_PAGE_SIZE) &&
            (receivedata_st.page_len_u16 == receivedata_st.page_end_addr_u16 - receivedata_st.page_str_addr_u16 + 1) )
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_RDATA_INVALID_PAGE_LEN_ERR;
            validate_res = 0;
        }
    }

    if(validate_res)
    {
        if( ((receivedata_st.page_str_addr_u16 & (BOOTAPP_APP_PAGE_SIZE - 1) ) == 0) &&
            (receivedata_st.page_str_addr_u16 == BOOTAPP_APP_PAGE_SIZE * (receivedata_st.page_num_u16 - 1)) )
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_RDATA_INVALID_STR_ADDR_ERR;
            validate_res = 0;
        }
    }
    if(validate_res)
    {
        if(receivedata_st.sect_dirty_u16 == BootApp_Sect_Dirty_Msk_au16[receivedata_st.page_num_u16 -1])
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_RDATA_PAGE_N_CONTIOUS_ERR;
            validate_res = 0;
        }
    }

    /*validate hex addr info*/
    if(validate_res)
    {
        if(BOOTAPP_APP_SECTOR_SIZE == receivedata_st.end_addr_u32 - receivedata_st.start_addr_u32 + 1)
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_RDATA_INVALID_SEC_BOUND_ERR;
            validate_res = 0;
        }
    }
    if(validate_res)
    {
        if( (receivedata_st.start_addr_u32 >= BOOTAPP_APP_START_ADDR) &&
            (receivedata_st.end_addr_u32 <= BOOTAPP_APP_END_ADDR) )
        {
            validate_res = 1;
        }
        else
        {
            status_en = BOOTAPP_RDATA_HEX_ADDR_ERR;
            validate_res = 0;
        }
    }
    if(validate_res)
    {
        if(receivedata_pst->sect_num_u16 == 0)
        {
            if(receivedata_st.start_addr_u32 == BOOTAPP_APP_START_ADDR)
            {
                validate_res = 1;
            }
            else
            {
                status_en = BOOTAPP_RDATA_SEC0_ADDR_ALIGN_ERR;
                validate_res = 0;
            }
        }
        else
        {
            if(receivedata_st.start_addr_u32 == BOOTAPP_APP_START_ADDR +  BOOTAPP_APP_SECTOR_SIZE * \
                (receivedata_st.sect_num_u16 - 1) )
            {
                validate_res = 1;
            }
            else
            {
                status_en = BOOTAPP_RDATA_SECN_ADDR_ALIGN_ERR;
                validate_res = 0;
            }
        }

    }
    /*validate buf crc*/
    /*to be done*/

    /*page data ok, write to sector buffer*/
    if(validate_res)
    {
        w_buffer_st = BootApp_SectBuffer_Write(receivedata_st.page_str_addr_u16>>2,
                                            receivedata_st.page_len_u16>>2,
                                            &PageBuffer_pen->buf_au32[0]);
        if(w_buffer_st)
        {
            receivedata_pst->page_num_u16 = receivedata_st.page_num_u16;
            receivedata_pst->page_len_u16 = receivedata_st.page_len_u16;
            receivedata_pst->page_str_addr_u16 = receivedata_st.page_str_addr_u16;
            receivedata_pst->page_end_addr_u16 = receivedata_st.page_end_addr_u16;
            receivedata_pst->sect_num_u16 = receivedata_st.sect_num_u16;
            receivedata_pst->start_addr_u32 = receivedata_st.start_addr_u32;
            receivedata_pst->end_addr_u32 = receivedata_st.end_addr_u32;

            receivedata_pst->sect_dirty_u16 |= 1 << (receivedata_st.page_num_u16 - 1);

            if(receivedata_pst->sect_dirty_u16 == BootApp_Sect_Dirty_Msk_au16[BOOTAPP_APP_PAGE_NUM])
            {
                receivedata_pst->sect_ready_u16 = 1;
                receivedata_pst->sect_dirty_u16 = 0;
                receivedata_pst->page_num_u16 = 0;
                receivedata_pst->page_len_u16 = 0;
                receivedata_pst->page_str_addr_u16 = 0;
                receivedata_pst->page_end_addr_u16 = 0;

                status_en = BOOTAPP_RDATA_FINISH;
            }
            else
            {
                receivedata_pst->sect_ready_u16 = 0;
                status_en = BOOTAPP_RDATA_PAGEOK;
            }
        }
        else
        {
            status_en = BOOTAPP_RDATA_SEC_WBUF_ERR;
            receivedata_pst->sect_ready_u16 = 0;
        }

    }
    else
    {

    }

    return status_en;

}

uint8_t BootApp_Receive_Data_Finish(void)
{
    return (uint8_t)BootApp_ReceiveData_st.sect_ready_u16;
}

void BootApp_Get_ReceiveData_Info(const BootApp_ReceiveData_tst ** receivedata_ppst)
{
    *receivedata_ppst = &BootApp_ReceiveData_st;
}

void BootApp_Enable_ReceiveData(void)
{
    BootApp_ReceiveData_st.sect_ready_u16 = 0;
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
