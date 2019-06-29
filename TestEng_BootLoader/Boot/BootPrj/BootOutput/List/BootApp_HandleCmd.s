///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       29/Jun/2019  20:37:19
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_HandleCmd.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_HandleCmd.c
//        -lcN
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\
//        -lb
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\
//        -o
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --fpu=None --dlib_config "D:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootApp\inc\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootDrv\inc\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootOth\inc\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\..\Libraries\CMSIS\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\..\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\ascii\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\include\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\modbus_port\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\rtu\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\tcp\
//        -On -I "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_HandleCmd.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN eMBPoll
        EXTERN eReadMBRegHolding
        EXTERN eWriteMBRegInput

        PUBLIC BootApp_CommunicationBuffer_un
        PUBLIC BootApp_Get_CommunicationBuf
        PUBLIC BootApp_HandleCmd_Receive
        PUBLIC BootApp_HandleCmd_Send
        PUBLIC StatusBuffer_un


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
BootApp_CommunicationBuffer_un:
        DS8 512

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
StatusBuffer_un:
        DS8 256

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_HandleCmd_Receive:
        PUSH     {R7,LR}
        BL       eMBPoll
        BL       BootApp_CopyFromMb
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_HandleCmd_Send:
        PUSH     {R7,LR}
        BL       BootApp_SendToMb
        BL       eMBPoll
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_CopyFromMb:
        PUSH     {R7,LR}
        MOV      R2,#+256
        MOVS     R1,#+0
        LDR.N    R0,??DataTable2
        BL       eReadMBRegHolding
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_SendToMb:
        PUSH     {R7,LR}
        MOVS     R2,#+128
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_1
        BL       eWriteMBRegInput
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Get_CommunicationBuf:
        LDR.N    R1,??DataTable2
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     BootApp_CommunicationBuffer_un

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     StatusBuffer_un

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
// 768 bytes in section .bss
//  68 bytes in section .text
// 
//  68 bytes of CODE memory
// 768 bytes of DATA memory
//
//Errors: none
//Warnings: none
