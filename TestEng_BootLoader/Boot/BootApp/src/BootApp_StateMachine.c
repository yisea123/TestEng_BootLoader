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

BootApp_State_ten BootApp_State_en = BOOTAPP_STATE_INIT;


void BootApp_Set_State(BootApp_State_ten state_en)
{
    BootApp_State_en = state_en;
}

BootApp_State_ten BootApp_Get_State(void)
{
    return BootApp_State_en;
}

void BootApp_StateMachine(void)
{
    uint8_t newcmd;
    BootApp_State_ten state_en;
    BootApp_State_ten new_state_en;

    state_en = BootApp_Get_State();
    BootApp_Status_ten status_en = BOOTAPP_STATUS_INI;

    BootApp_CommunicationBuffer_tst * ComBuffer_pst = (void *)0;
    BootApp_Get_CommunicationBuf(&ComBuffer_pst);

    BootApp_CmdBuffer_tst * CmdBuffer_pst = &(ComBuffer_pst->cmdbuffer_st);
    BootApp_PageBuffer_ten * PageBuffer_pen = &(ComBuffer_pst->pagebuffer_en);
    PageBuffer_pen = PageBuffer_pen;

    BootApp_HandleCmd_Receive();

    switch(state_en)
    {
    case BOOTAPP_STATE_INIT:
    {
        BootApp_State_Init_Act();
        BootApp_Set_State(BOOTAPP_STATE_RCMD);
        break;
    }
    case BOOTAPP_STATE_RCMD:
    {
        newcmd = BootApp_NewCmd_Received(CmdBuffer_pst);
        if(newcmd)
        {
            new_state_en = BootApp_Get_Command(CmdBuffer_pst);
            BootApp_Set_State(new_state_en);
        }
        else
        {

        }
        break;
    }
    case BOOTAPP_STATE_STRP:
    {
        BootApp_Log_Exe_Status(BOOTAPP_STATE_STRP, BOOTAPP_EREASE_ONGOING);
        status_en = BootApp_Erease_App();
        BootApp_Log_Exe_Status(BOOTAPP_STATE_STRP, status_en);
        if(status_en != BOOTAPP_EREASE_OK)
        {
            BootApp_Reset_Sys();
        }
        else
        {
            BootApp_Set_State(BOOTAPP_STATE_RCMD);
        }
        break;
    }
    case BOOTAPP_STATE_RDAT:
    {
        BootApp_Log_Exe_Status(BOOTAPP_STATE_RDAT, BOOTAPP_RDATA_ONGOING);
        status_en = BootApp_Receive_Data(ComBuffer_pst);
        BootApp_Log_Exe_Status(BOOTAPP_STATE_RDAT, status_en);
        if(BootApp_Receive_Data_Finish())
        {
            BootApp_Set_State(BOOTAPP_STATE_RCMD);
        }
        else
        {

        }
        break;
    }
    case BOOTAPP_STATE_WDAT:
    {
        BootApp_Log_Exe_Status(BOOTAPP_STATE_WDAT, BOOTAPP_WDAT_ONGOING);
        status_en = BootApp_Program_Flash(ComBuffer_pst);
        BootApp_Log_Exe_Status(BOOTAPP_STATE_WDAT, status_en);
        if(BOOTAPP_WDAT_SEC_FINISH == status_en)
        {
            BootApp_Enable_ReceiveData();
            BootApp_Set_State(BOOTAPP_STATE_RCMD);
        }
        else if(BOOTAPP_WDAT_FINISH == status_en)
        {
            BootApp_Set_State(BOOTAPP_STATE_VALI);
        }
        else if(BOOTAPP_WDAT_PROG_FLASH_ERR == status_en)
        {
            BootApp_Reset_Sys();
        }
        else
        {
            BootApp_Set_State(BOOTAPP_STATE_RCMD);
        }
        break;
    }
    case BOOTAPP_STATE_VALI:
    {
        BootApp_Log_Exe_Status(BOOTAPP_STATE_VALI, BOOTAAPP_VALI_ONGOING);
        status_en = BootApp_Validate_App();
        BootApp_Log_Exe_Status(BOOTAPP_STATE_VALI, status_en);
        if(BOOTAAPP_VALI_COMPLETE == status_en)
        {
            BootApp_Set_State(BOOTAPP_STATE_JUMP);
        }
        else if(BOOTAAPP_VALI_NOT_COMPLETE == status_en)
        {
            BootApp_Reset_Sys();
        }
        break;
    }
    case BOOTAPP_STATE_JUMP:
    {
        BootApp_Log_Exe_Status(BOOTAPP_STATE_JUMP, BOOTAPP_JUMP_TO_APP);
        BootApp_Run_App();
        break;
    }
    default :
        break;
    }

    BootApp_HandleCmd_Send();
}

void BootApp_State_Init_Act(void)
{
    /*callout for state machine*/
    BootApp_Reset_ten reset_en;
    BootApp_Status_ten  status_en;

    #if 1
    reset_en = BootApp_GetReset_Reason();

    if(BOOTAPP_RESET_POWERON == reset_en)
    {
        status_en = BootApp_Validate_App();
        if(BOOTAAPP_VALI_COMPLETE == status_en)
        {
            BootApp_Run_App();
        }
        else
        {
            BootApp_Prog_init();
        }
    }
    else if(BOOTAPP_RESET_PROG == reset_en)
    {
        BootApp_Prog_init();
    }
    else
    {
        BootApp_Reset_Sys();
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
