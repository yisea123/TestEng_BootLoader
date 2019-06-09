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

BootApp_CommunicationBuffer_tun BootApp_CommunicationBuffer_un = {{0},};
BootApp_StatusBuffer_tun StatusBuffer_un = {{0},};


#if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)

void BootApp_HandleCmd_Receive(void)
{

}

void BootApp_HandleCmd_Send(void)
{

}

void BootApp_Get_CommunicationBuf(BootApp_CommunicationBuffer_tst ** ComBuffer_pst)
{
    *ComBuffer_pst = &BootApp_CommunicationBuffer_un.com_st;
}

#else

extern eMBErrorCode  eWriteMBRegInput( USHORT * pucRegBuffer, USHORT usAddress, USHORT usNRegs);
extern eMBErrorCode  eReadMBRegHolding( USHORT * pucRegBuffer, USHORT usAddress, USHORT usNRegs);

static void BootApp_CopyFromMb(void);
static void BootApp_SendToMb(void);


void BootApp_HandleCmd_Receive(void)
{
    eMBPoll();
    BootApp_CopyFromMb();
}

void BootApp_HandleCmd_Send(void)
{
    BootApp_SendToMb();
    eMBPoll();
}

void BootApp_CopyFromMb(void)
{
    eReadMBRegHolding( &BootApp_CommunicationBuffer_un.buf_au16[0], 0, BOOTAPP_COMMUBICATION_BUF_SIZE);
}


void BootApp_SendToMb(void)
{
    eWriteMBRegInput(&StatusBuffer_un.buf_au16[0], 2, BOOTAPP_STATUS_BUF_SIZE);
}

void BootApp_Get_CommunicationBuf(BootApp_CommunicationBuffer_tst ** ComBuffer_pst)
{
    *ComBuffer_pst = &BootApp_CommunicationBuffer_un.com_st;
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

