#include "BootApp_Cfg.h"
#include "BootApp_Cfg_Board.h"
#include "BootApp_Type.h"
#include "BootApp_Priv.h"
#include "BootApp.h"

int main(void)
{
    uint16_t i;
    for(i=0;i<BOOTAPP_APP_PAGE_SIZE;i++)
    {
        BootApp_CommunicationBuffer_en.com_st.pagebuffer_en.buf_au8[i] = i;
    }
    while(1)
    {
        BootApp_StateMachine();
    }

    return 0;

}
