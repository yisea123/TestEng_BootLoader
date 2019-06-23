///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  15:42:57
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_iwdg.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_iwdg.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\stm32f10x_iwdg.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC IWDG_Enable
        PUBLIC IWDG_GetFlagStatus
        PUBLIC IWDG_ReloadCounter
        PUBLIC IWDG_SetPrescaler
        PUBLIC IWDG_SetReload
        PUBLIC IWDG_WriteAccessCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_WriteAccessCmd:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable5  ;; 0x40003000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_SetPrescaler:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable5_1  ;; 0x40003004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_SetReload:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable5_2  ;; 0x40003008
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_ReloadCounter:
        MOVW     R0,#+43690
        LDR.N    R1,??DataTable5  ;; 0x40003000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_Enable:
        MOVW     R0,#+52428
        LDR.N    R1,??DataTable5  ;; 0x40003000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_GetFlagStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable5_3  ;; 0x4000300c
        LDR      R2,[R2, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        TST      R2,R1
        BEQ.N    ??IWDG_GetFlagStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??IWDG_GetFlagStatus_1
??IWDG_GetFlagStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??IWDG_GetFlagStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x40003000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x40003004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x40003008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x4000300c

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
// 88 bytes in section .text
// 
// 88 bytes of CODE memory
//
//Errors: none
//Warnings: none
