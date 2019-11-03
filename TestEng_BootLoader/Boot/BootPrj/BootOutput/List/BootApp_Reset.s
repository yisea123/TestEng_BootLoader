///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       03/Nov/2019  11:14:52
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_Reset.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_Reset.c
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
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_Reset.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BootDrv_Reset

        PUBLIC BootApp_GetReset_Reason
        PUBLIC BootApp_Reset_Sys
        PUBLIC BootApp_Reset_en
        PUBLIC magic_word


        SECTION ram_noinit:DATA:REORDER:ROOT(1)
magic_word:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
BootApp_Reset_en:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_GetReset_Reason:
        LDR.N    R0,??DataTable1  ;; 0x20004f00
        LDRH     R0,[R0, #+0]
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R0,#+42405
        CMP      R1,R0
        BNE.N    ??BootApp_GetReset_Reason_0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable1  ;; 0x20004f00
        STRH     R0,[R2, #+0]
        MOVS     R0,#+1
        LDR.N    R2,??DataTable1_1
        STRB     R0,[R2, #+0]
        B.N      ??BootApp_GetReset_Reason_1
??BootApp_GetReset_Reason_0:
        MOVS     R0,#+0
        LDR.N    R2,??DataTable1_1
        STRB     R0,[R2, #+0]
??BootApp_GetReset_Reason_1:
        LDR.N    R0,??DataTable1_1
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Reset_Sys:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1  ;; 0x20004f00
        STRH     R0,[R1, #+0]
        BL       BootDrv_Reset
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x20004f00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     BootApp_Reset_en

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
//  1 byte  in section .bss
// 64 bytes in section .text
//  2 bytes in section ram_noinit
// 
// 64 bytes of CODE memory
//  3 bytes of DATA memory
//
//Errors: none
//Warnings: none
