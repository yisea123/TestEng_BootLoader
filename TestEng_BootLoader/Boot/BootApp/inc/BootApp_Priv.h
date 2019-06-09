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
#ifndef _BOOTAPP_PRIV_H_
#define _BOOTAPP_PRIV_H_


#define BootApp_Get_MagicWord()     (*((uint16_t *)BOOTAPP_MAGIC_WORD_ADDR))
#define BootApp_Set_MagicWord(val)  ( (*((uint16_t *)BOOTAPP_MAGIC_WORD_ADDR)) = (val) )


extern const BootApp_Flash_Info_tst * const BootApp_Flash_Info_cpcst;
extern const BootApp_App_Cfg_tst * const BootApp_App_Cfg_cpcst;

extern const BootApp_GpioPin_tst BootApp_App_GpioPin_cast[BOOTAPP_APP_GPIO_NUM];
extern const BootApp_UartPort_tst BootApp_UartPort_cast[BOOTAPP_APP_UART_NUM];
extern const BootApp_Prolog_tst BootApp_App_Prolog_st;
extern const BootApp_Epilog_tst BootApp_Epilog_st;

extern BootApp_Reset_ten BootApp_GetReset_Reason(void);
extern void BootApp_Prog_init(void);
extern uint8_t BootApp_Get_Cfg_Gpio(const BootApp_Gpio_tst ** gpio_cfg);
extern uint8_t BootApp_Get_Cfg_Uart(const BootApp_Uart_tst ** uart_cfg);
extern uint8_t BootApp_Get_board_address(void);
extern void BootApp_Disable_run_led(void);
extern void BootApp_Enable_run_led(void);
extern void BootApp_Disable_err_led(void);
extern void BootApp_Enable_err_led(void);

extern void BootApp_State_Init_Act(void);
extern void BootApp_Reset_Sys(void);
extern void BootApp_Run_App(void);
extern void BootApp_Set_State(BootApp_State_ten state_en);
extern BootApp_State_ten BootApp_Get_State(void);

extern void BootApp_Log_Exe_Status(BootApp_State_ten state_en,  BootApp_Status_ten status_en);

extern void BootApp_HandleCmd_Receive(void);
extern void BootApp_HandleCmd_Send(void);
extern void BootApp_Get_CommunicationBuf(BootApp_CommunicationBuffer_tst ** ComBuffer_pst);

extern uint8_t BootApp_SectBuffer_Write(uint16_t start_addr, uint16_t length, const uint32_t *src);
extern uint8_t BootApp_SectBuffer_Read(uint16_t start_addr, uint16_t length, uint32_t *des);
extern uint8_t BootApp_PageBuffer_Read(BootApp_PageBuffer_ten * page_buffer,
                                             uint16_t start_addr,
                                             uint16_t length,
                                             uint32_t *des);
extern BootApp_Status_ten BootApp_Receive_Data(const BootApp_CommunicationBuffer_tst *ComBuffer_pst);
extern uint8_t BootApp_Receive_Data_Finish(void);
extern void BootApp_Get_ReceiveData_Info(const BootApp_ReceiveData_tst ** receivedata_ppst);
extern void BootApp_Enable_ReceiveData(void);

extern uint8_t BootApp_NewCmd_Received(const BootApp_CmdBuffer_tst *CmdBuffer_pst);
extern BootApp_State_ten BootApp_Get_Command(const BootApp_CmdBuffer_tst * CmdBuffer_pst);

extern BootApp_Status_ten BootApp_Erease_App(void);

extern BootApp_Status_ten BootApp_Program_Flash(const BootApp_CommunicationBuffer_tst *ComBuffer_pst);
extern uint8_t BootApp_Program_Flash_Finish(void);

extern BootApp_Status_ten BootApp_Validate_App(void);

extern void BootDrv_Reset(void);
extern uint8_t BootDrv_EreaseFlash(uint32_t str_addr, uint32_t sect_siz);
extern uint8_t BootDrv_ProgramFlash(uint32_t start_addr_u32, uint32_t end_addr_u32, uint32_t length_u32);


#if (BOOTAPP_BOARD_SUPPORT == TestEng_Debug)
#define BootApp_Addr_Prolog_Validate(a)  1
#define BootApp_Addr_Epilog_Validate(a)  1

#else

#define BootApp_Addr_Prolog_Validate(a)  ( ((uint32_t)(a)>=(uint32_t)BOOTAPP_PROLOG_BASE_ADDR) && ((uint32_t)(a)<=(uint32_t)BOOTAPP_PROLOG_END_ADDR) )
#define BootApp_Addr_Epilog_Validate(a)  ( ((uint32_t)(a)>=(uint32_t)BOOTAPP_EPILOG_BASE_ADDR) && ((uint32_t)(a)<=(uint32_t)BOOTAPP_EPILOG_END_ADDR) )

#endif


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

