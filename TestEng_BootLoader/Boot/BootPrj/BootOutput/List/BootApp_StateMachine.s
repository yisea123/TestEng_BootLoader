///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       09/Jun/2019  21:27:05
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_StateMachine.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_StateMachine.c
//        -lcN
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\
//        -lb
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\
//        -o
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --fpu=None --dlib_config "E:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootApp\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootDrv\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootOth\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\..\Libraries\CMSIS\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\..\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\ascii\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\include\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\modbus_port\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\rtu\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\tcp\
//        -On -I "E:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_StateMachine.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BootApp_Enable_ReceiveData
        EXTERN BootApp_Erease_App
        EXTERN BootApp_GetReset_Reason
        EXTERN BootApp_Get_Command
        EXTERN BootApp_Get_CommunicationBuf
        EXTERN BootApp_HandleCmd_Receive
        EXTERN BootApp_HandleCmd_Send
        EXTERN BootApp_Log_Exe_Status
        EXTERN BootApp_NewCmd_Received
        EXTERN BootApp_Prog_init
        EXTERN BootApp_Program_Flash
        EXTERN BootApp_Receive_Data
        EXTERN BootApp_Receive_Data_Finish
        EXTERN BootApp_Reset_Sys
        EXTERN BootApp_Run_App
        EXTERN BootApp_Validate_App

        PUBLIC BootApp_Get_State
        PUBLIC BootApp_Set_State
        PUBLIC BootApp_StateMachine
        PUBLIC BootApp_State_Init_Act
        PUBLIC BootApp_State_en


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
BootApp_State_en:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Set_State:
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Get_State:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     BootApp_State_en

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_StateMachine:
        PUSH     {R3-R9,LR}
        BL       BootApp_Get_State
        MOVS     R5,R0
        MOVS     R7,#+0
        ADD      R0,SP,#+0
        BL       BootApp_Get_CommunicationBuf
        LDR      R8,[SP, #+0]
        LDR      R0,[SP, #+0]
        ADDS     R9,R0,#+256
        BL       BootApp_HandleCmd_Receive
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??BootApp_StateMachine_0
        CMP      R5,#+2
        BEQ.N    ??BootApp_StateMachine_1
        BCC.N    ??BootApp_StateMachine_2
        CMP      R5,#+4
        BEQ.N    ??BootApp_StateMachine_3
        BCC.N    ??BootApp_StateMachine_4
        CMP      R5,#+6
        BEQ.W    ??BootApp_StateMachine_5
        BCC.N    ??BootApp_StateMachine_6
        B.N      ??BootApp_StateMachine_7
??BootApp_StateMachine_0:
        BL       BootApp_State_Init_Act
        MOVS     R0,#+1
        BL       BootApp_Set_State
        B.N      ??BootApp_StateMachine_8
??BootApp_StateMachine_2:
        MOV      R0,R8
        BL       BootApp_NewCmd_Received
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_StateMachine_9
        MOV      R0,R8
        BL       BootApp_Get_Command
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       BootApp_Set_State
??BootApp_StateMachine_9:
        B.N      ??BootApp_StateMachine_8
??BootApp_StateMachine_1:
        MOVW     R1,#+4098
        MOVS     R0,#+2
        BL       BootApp_Log_Exe_Status
        BL       BootApp_Erease_App
        MOVS     R7,R0
        MOVS     R1,R7
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,#+2
        BL       BootApp_Log_Exe_Status
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        MOVW     R0,#+4097
        CMP      R7,R0
        BEQ.N    ??BootApp_StateMachine_10
        BL       BootApp_Reset_Sys
        B.N      ??BootApp_StateMachine_11
??BootApp_StateMachine_10:
        MOVS     R0,#+1
        BL       BootApp_Set_State
??BootApp_StateMachine_11:
        B.N      ??BootApp_StateMachine_8
??BootApp_StateMachine_4:
        MOVW     R1,#+12289
        MOVS     R0,#+3
        BL       BootApp_Log_Exe_Status
        LDR      R0,[SP, #+0]
        BL       BootApp_Receive_Data
        MOVS     R7,R0
        MOVS     R1,R7
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,#+3
        BL       BootApp_Log_Exe_Status
        BL       BootApp_Receive_Data_Finish
        CMP      R0,#+0
        BEQ.N    ??BootApp_StateMachine_12
        MOVS     R0,#+1
        BL       BootApp_Set_State
??BootApp_StateMachine_12:
        B.N      ??BootApp_StateMachine_8
??BootApp_StateMachine_3:
        MOVW     R1,#+16385
        MOVS     R0,#+4
        BL       BootApp_Log_Exe_Status
        LDR      R0,[SP, #+0]
        BL       BootApp_Program_Flash
        MOVS     R7,R0
        MOVS     R1,R7
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,#+4
        BL       BootApp_Log_Exe_Status
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        MOVW     R0,#+16386
        CMP      R7,R0
        BNE.N    ??BootApp_StateMachine_13
        BL       BootApp_Enable_ReceiveData
        MOVS     R0,#+1
        BL       BootApp_Set_State
        B.N      ??BootApp_StateMachine_14
??BootApp_StateMachine_13:
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        MOVW     R0,#+16387
        CMP      R7,R0
        BNE.N    ??BootApp_StateMachine_15
        MOVS     R0,#+5
        BL       BootApp_Set_State
        B.N      ??BootApp_StateMachine_14
??BootApp_StateMachine_15:
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        MOVW     R0,#+16395
        CMP      R7,R0
        BNE.N    ??BootApp_StateMachine_16
        BL       BootApp_Reset_Sys
        B.N      ??BootApp_StateMachine_14
??BootApp_StateMachine_16:
        MOVS     R0,#+1
        BL       BootApp_Set_State
??BootApp_StateMachine_14:
        B.N      ??BootApp_StateMachine_8
??BootApp_StateMachine_6:
        MOVW     R1,#+20481
        MOVS     R0,#+5
        BL       BootApp_Log_Exe_Status
        BL       BootApp_Validate_App
        MOVS     R7,R0
        MOVS     R1,R7
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,#+5
        BL       BootApp_Log_Exe_Status
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        MOVW     R0,#+20483
        CMP      R7,R0
        BNE.N    ??BootApp_StateMachine_17
        MOVS     R0,#+6
        BL       BootApp_Set_State
        B.N      ??BootApp_StateMachine_18
??BootApp_StateMachine_17:
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        MOVW     R0,#+20482
        CMP      R7,R0
        BNE.N    ??BootApp_StateMachine_18
        BL       BootApp_Reset_Sys
??BootApp_StateMachine_18:
        B.N      ??BootApp_StateMachine_8
??BootApp_StateMachine_5:
        MOVW     R1,#+24577
        MOVS     R0,#+6
        BL       BootApp_Log_Exe_Status
        BL       BootApp_Run_App
        B.N      ??BootApp_StateMachine_8
??BootApp_StateMachine_7:
??BootApp_StateMachine_8:
        BL       BootApp_HandleCmd_Send
        POP      {R0,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_State_Init_Act:
        PUSH     {R3-R5,LR}
        BL       BootApp_GetReset_Reason
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??BootApp_State_Init_Act_0
        BL       BootApp_Validate_App
        MOVS     R5,R0
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVW     R0,#+20483
        CMP      R5,R0
        BNE.N    ??BootApp_State_Init_Act_1
        BL       BootApp_Run_App
        B.N      ??BootApp_State_Init_Act_2
??BootApp_State_Init_Act_1:
        BL       BootApp_Prog_init
        B.N      ??BootApp_State_Init_Act_2
??BootApp_State_Init_Act_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??BootApp_State_Init_Act_3
        BL       BootApp_Prog_init
        B.N      ??BootApp_State_Init_Act_2
??BootApp_State_Init_Act_3:
        BL       BootApp_Reset_Sys
??BootApp_State_Init_Act_2:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//   1 byte  in section .bss
// 450 bytes in section .text
// 
// 450 bytes of CODE memory
//   1 byte  of DATA memory
//
//Errors: none
//Warnings: none
