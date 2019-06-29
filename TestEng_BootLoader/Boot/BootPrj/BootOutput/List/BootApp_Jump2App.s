///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       29/Jun/2019  20:37:20
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_Jump2App.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_Jump2App.c
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
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_Jump2App.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC BootApp_Run_App


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
BootApp_Run_App:
        PUSH     {R4,LR}
        CPSID    I
        LDR.N    R0,??BootApp_Run_App_0  ;; 0x800c000
        LDR      R0,[R0, #+0]
        LDR.N    R1,??BootApp_Run_App_0+0x4  ;; 0x2ffe0000
        ANDS     R0,R1,R0
        CMP      R0,#+536870912
        BNE.N    ??BootApp_Run_App_1
        LDR.N    R0,??BootApp_Run_App_0+0x8  ;; 0x800c004
        MOVS     R4,R0
        LDR.N    R0,??BootApp_Run_App_0  ;; 0x800c000
        LDR      R0,[R0, #+0]
        MSR      MSP,R0
        LDR      R0,[R4, #+0]
        BLX      R0
??BootApp_Run_App_1:
        POP      {R4,PC}          ;; return
        DATA
??BootApp_Run_App_0:
        DC32     0x800c000
        DC32     0x2ffe0000
        DC32     0x800c004

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
// 48 bytes in section .text
// 
// 48 bytes of CODE memory
//
//Errors: none
//Warnings: none
