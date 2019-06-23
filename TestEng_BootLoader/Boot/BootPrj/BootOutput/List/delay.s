///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  16:32:32
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootDrv\src\delay.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootDrv\src\delay.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\delay.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN SysTick_CLKSourceConfig

        PUBLIC Delay_Init
        PUBLIC Delay_ms
        PUBLIC Delay_us


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
fac_us:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
fac_ms:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Delay_Init:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MVNS     R0,#+4
        BL       SysTick_CLKSourceConfig
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+8
        SDIV     R0,R4,R0
        LDR.N    R1,??DataTable2
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable2
        LDRB     R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable2_1
        STRH     R0,[R1, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Delay_ms:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R2,??DataTable2_1
        LDRH     R2,[R2, #+0]
        MUL      R2,R2,R0
        LDR.N    R3,??DataTable2_2  ;; 0xe000e014
        STR      R2,[R3, #+0]
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_3  ;; 0xe000e018
        STR      R2,[R3, #+0]
        MOVS     R2,#+1
        LDR.N    R3,??DataTable2_4  ;; 0xe000e010
        STR      R2,[R3, #+0]
??Delay_ms_0:
        LDR.N    R2,??DataTable2_4  ;; 0xe000e010
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        ANDS     R2,R1,#0x10001
        CMP      R2,#+1
        BEQ.N    ??Delay_ms_0
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_4  ;; 0xe000e010
        STR      R2,[R3, #+0]
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_3  ;; 0xe000e018
        STR      R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Delay_us:
        LDR.N    R2,??DataTable2
        LDRB     R2,[R2, #+0]
        MUL      R2,R2,R0
        LDR.N    R3,??DataTable2_2  ;; 0xe000e014
        STR      R2,[R3, #+0]
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_3  ;; 0xe000e018
        STR      R2,[R3, #+0]
        MOVS     R2,#+1
        LDR.N    R3,??DataTable2_4  ;; 0xe000e010
        STR      R2,[R3, #+0]
??Delay_us_0:
        LDR.N    R2,??DataTable2_4  ;; 0xe000e010
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        ANDS     R2,R1,#0x10001
        CMP      R2,#+1
        BEQ.N    ??Delay_us_0
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_4  ;; 0xe000e010
        STR      R2,[R3, #+0]
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_3  ;; 0xe000e018
        STR      R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     fac_us

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     fac_ms

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0xe000e010

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
//   3 bytes in section .bss
// 166 bytes in section .text
// 
// 166 bytes of CODE memory
//   3 bytes of DATA memory
//
//Errors: none
//Warnings: none
