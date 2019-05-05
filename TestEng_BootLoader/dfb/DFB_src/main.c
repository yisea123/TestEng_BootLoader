/**
  ******************************************************************************
  * @file    main.c  burn in system
  * @author  h&h
  * @version 
  * @date    
  * @brief

  ******************************************************************************
**/ 

#include "include.h"
#include "main.h"
#include "mb.h"

#define RESET_STATE       0x00
#define INITIALIZE_STATE  0x01
#define READY_STATE       0x02
#define FAULT_STATE       0x03
#define ENGINEERING_STATE 0x04
 
#define SUB_STATE_ON_ENTRY 0x00
#define SUB_STATE_ON_LOOP  0x01
#define SUB_STATE_ON_EXIT  0x02
void state_machine(void);
volatile uint8_t state,sub_state;
static uint32_t mainloop_counter=0;

void set_module_state(uint8_t newstate)
{
    state=newstate;
    sub_state=SUB_STATE_ON_ENTRY;
}

 void main(void)
{
    uint8_t slave_addr;
    SystemInit();
    Delay_Init(72); 

    /*Disable JTAG  Enable SWD*/
    AFIO->MAPR |= AFIO_MAPR_SWJ_CFG_JTAGDISABLE;

    __disable_irq();
    init();
    slave_addr = Get_board_address();
    eMBInit(MB_RTU, slave_addr, 0x1, 19200, MB_PAR_EVEN);
    eMBEnable(); 
    __enable_irq(); 

    set_module_state(READY_STATE);


    while(1)
    {
        state_machine();
    }

}
 



/**
  * @brief   state_machine
  * @param  None
  * @retval None
  */ 
void state_machine(void)
{
    switch( state )
    {
        case RESET_STATE:
        switch( sub_state )
        {
            case SUB_STATE_ON_ENTRY:
            {
                __set_FAULTMASK(1);
                NVIC_SystemReset();
                sub_state = SUB_STATE_ON_LOOP;
            }
            break;

            case SUB_STATE_ON_LOOP:
                sub_state = SUB_STATE_ON_EXIT;
            break;

            case SUB_STATE_ON_EXIT:
                set_module_state(READY_STATE);
            break;
        }
        break;

        case INITIALIZE_STATE:
        switch( sub_state )
        {
            case SUB_STATE_ON_ENTRY:
            sub_state = SUB_STATE_ON_LOOP;
            break;

            case SUB_STATE_ON_LOOP:
            sub_state = SUB_STATE_ON_EXIT;
            break;

            case SUB_STATE_ON_EXIT:
            set_module_state(READY_STATE);
            break;
        }
        break;

        case READY_STATE:
        switch( sub_state )
        {
            case SUB_STATE_ON_ENTRY:
            sub_state = SUB_STATE_ON_LOOP;
            break;

            case SUB_STATE_ON_LOOP:
            {
                if(Get_test_n())
                {
                    Disable_sw_vs1();
                }
                eMBPoll();
                cmd_stage_fast_proc();
                mainloop_counter++;
                if(mainloop_counter==10000)
                {
                    cmd_stage_slow_proc();
                    mainloop_counter=0;
                }

                break;

                case SUB_STATE_ON_EXIT:
                break;
            }
            break;

            case FAULT_STATE:
            switch( sub_state )
            {
                case SUB_STATE_ON_ENTRY:
                sub_state = SUB_STATE_ON_LOOP;
                break;

                case SUB_STATE_ON_LOOP:
                sub_state = SUB_STATE_ON_EXIT;
                break;

                case SUB_STATE_ON_EXIT:
                set_module_state(RESET_STATE);
                break;
            }
            break;
        } 
    }
}






/******************* (C) COPYRIGHT 2018 *****END OF FILE****/
