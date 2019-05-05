///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       06/Apr/2019  21:50:28
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\DFB_src\Boot_GetApp_Data.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\DFB_src\Boot_GetApp_Data.c
//        -lcN
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\Burn_in_2\List\
//        -lb
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\Burn_in_2\List\
//        -o
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\Burn_in_2\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --fpu=None --dlib_config "E:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\DFB_inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\..\Libraries\CMSIS\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\..\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\ascii\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\include\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\modbus_port\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\rtu\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\tcp\
//        -On -I "E:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\Burn_in_2\List\Boot_GetApp_Data.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC App_Cfg_Epilog_cpst
        PUBLIC App_Cfg_Gpio_cpst
        PUBLIC App_Cfg_Uart_cpst
        PUBLIC App_Epilog_Signature
        PUBLIC App_FwVersion
        PUBLIC App_HardVersion
        PUBLIC App_Prolog_Signature
        PUBLIC Boot_GetApp_Cfg_Gpio
        PUBLIC Boot_GetApp_Cfg_Uart
        PUBLIC Boot_GetApp_FwVersion
        PUBLIC Boot_GetApp_HardVersion
        PUBLIC Boot_GetApp_init


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
App_HardVersion:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
App_FwVersion:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
App_Prolog_Signature:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
App_Cfg_Gpio_cpst:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
App_Cfg_Uart_cpst:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
App_Cfg_Epilog_cpst:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
App_Epilog_Signature:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
Boot_GetApp_init_en:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Boot_GetApp_init:
        PUSH     {R4}
        LDR.N    R1,??DataTable4  ;; 0x800c000
        MOVS     R3,#+0
        LDR.N    R0,??DataTable4_1
        STR      R1,[R0, #+0]
        ADDS     R0,R1,#+16
        LDR.N    R4,??DataTable4_2
        STR      R0,[R4, #+0]
        ADDS     R0,R1,#+32
        LDR.N    R4,??DataTable4_3
        STR      R0,[R4, #+0]
        LDR      R0,[R1, #+48]
        LDR.N    R4,??DataTable4_4
        STR      R0,[R4, #+0]
        LDR      R0,[R1, #+52]
        LDR.N    R4,??DataTable4_5
        STR      R0,[R4, #+0]
        LDR      R0,[R1, #+56]
        LDR.N    R4,??DataTable4_6
        STR      R0,[R4, #+0]
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Boot_GetApp_init_0
        LDR.N    R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Boot_GetApp_init_0
        LDR.N    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Boot_GetApp_init_0
        LDR.N    R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Boot_GetApp_init_0
        LDR.N    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Boot_GetApp_init_0
        LDR.N    R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Boot_GetApp_init_1
??Boot_GetApp_init_0:
        MOVS     R0,#+0
        MOVS     R2,R0
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??Boot_GetApp_init_2
??Boot_GetApp_init_1:
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4  ;; 0x800c000
        CMP      R0,R4
        BCC.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4_7  ;; 0x800c400
        CMP      R0,R4
        BCS.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4  ;; 0x800c000
        CMP      R0,R4
        BCC.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4_7  ;; 0x800c400
        CMP      R0,R4
        BCS.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4  ;; 0x800c000
        CMP      R0,R4
        BCC.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4_7  ;; 0x800c400
        CMP      R0,R4
        BCS.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4  ;; 0x800c000
        CMP      R0,R4
        BCC.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4_7  ;; 0x800c400
        CMP      R0,R4
        BCS.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4  ;; 0x800c000
        CMP      R0,R4
        BCC.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4_7  ;; 0x800c400
        CMP      R0,R4
        BCS.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4_8  ;; 0x801fc00
        CMP      R0,R4
        BCC.N    ??Boot_GetApp_init_3
        LDR.N    R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4_9  ;; 0x8020000
        CMP      R0,R4
        BCC.N    ??Boot_GetApp_init_4
??Boot_GetApp_init_3:
        MOVS     R0,#+1
        MOVS     R2,R0
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??Boot_GetApp_init_2
??Boot_GetApp_init_4:
        LDR.N    R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        LDR.N    R4,??DataTable4_10
        STR      R0,[R4, #+0]
        MOVS     R0,#+0
        MOVS     R3,R0
??Boot_GetApp_init_5:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+16
        BGE.N    ??Boot_GetApp_init_6
        LDR.N    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R0,[R3, R0]
        LDR.N    R4,??DataTable4_10
        LDR      R4,[R4, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R4]
        CMP      R0,R4
        BEQ.N    ??Boot_GetApp_init_7
        MOVS     R0,#+2
        MOVS     R2,R0
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??Boot_GetApp_init_2
??Boot_GetApp_init_7:
        ADDS     R3,R3,#+1
        B.N      ??Boot_GetApp_init_5
??Boot_GetApp_init_6:
        MOVS     R0,#+1
        LDR.N    R4,??DataTable4_11
        STRB     R0,[R4, #+0]
        MOVS     R0,#+3
??Boot_GetApp_init_2:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Boot_GetApp_HardVersion:
        MOVS     R2,R0
        LDR.N    R0,??DataTable4_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??Boot_GetApp_HardVersion_0
        MOVS     R0,#+0
        B.N      ??Boot_GetApp_HardVersion_1
??Boot_GetApp_HardVersion_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BEQ.N    ??Boot_GetApp_HardVersion_2
        MOVS     R0,#+0
        B.N      ??Boot_GetApp_HardVersion_1
??Boot_GetApp_HardVersion_2:
        MOVS     R0,#+0
        MOVS     R3,R0
??Boot_GetApp_HardVersion_3:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+16
        BGE.N    ??Boot_GetApp_HardVersion_4
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R0,[R3, R0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        STRB     R0,[R3, R1]
        ADDS     R3,R3,#+1
        B.N      ??Boot_GetApp_HardVersion_3
??Boot_GetApp_HardVersion_4:
        MOVS     R0,#+1
??Boot_GetApp_HardVersion_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Boot_GetApp_FwVersion:
        MOVS     R2,R0
        LDR.N    R0,??DataTable4_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??Boot_GetApp_FwVersion_0
        MOVS     R0,#+0
        B.N      ??Boot_GetApp_FwVersion_1
??Boot_GetApp_FwVersion_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BEQ.N    ??Boot_GetApp_FwVersion_2
        MOVS     R0,#+0
        B.N      ??Boot_GetApp_FwVersion_1
??Boot_GetApp_FwVersion_2:
        MOVS     R0,#+0
        MOVS     R3,R0
??Boot_GetApp_FwVersion_3:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+16
        BGE.N    ??Boot_GetApp_FwVersion_4
        LDR.N    R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R0,[R3, R0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        STRB     R0,[R3, R1]
        ADDS     R3,R3,#+1
        B.N      ??Boot_GetApp_FwVersion_3
??Boot_GetApp_FwVersion_4:
        MOVS     R0,#+1
??Boot_GetApp_FwVersion_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Boot_GetApp_Cfg_Gpio:
        MOVS     R1,R0
        LDR.N    R0,??DataTable4_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??Boot_GetApp_Cfg_Gpio_0
        MOVS     R0,#+0
        B.N      ??Boot_GetApp_Cfg_Gpio_1
??Boot_GetApp_Cfg_Gpio_0:
        LDR.N    R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        MOVS     R1,R0
        MOVS     R0,#+1
??Boot_GetApp_Cfg_Gpio_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Boot_GetApp_Cfg_Uart:
        MOVS     R1,R0
        LDR.N    R0,??DataTable4_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??Boot_GetApp_Cfg_Uart_0
        MOVS     R0,#+0
        B.N      ??Boot_GetApp_Cfg_Uart_1
??Boot_GetApp_Cfg_Uart_0:
        LDR.N    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        MOVS     R1,R0
        MOVS     R0,#+1
??Boot_GetApp_Cfg_Uart_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x800c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     App_HardVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     App_FwVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     App_Prolog_Signature

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     App_Cfg_Gpio_cpst

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     App_Cfg_Uart_cpst

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     App_Cfg_Epilog_cpst

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x800c400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x801fc00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0x8020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     App_Epilog_Signature

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     Boot_GetApp_init_en

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
//  29 bytes in section .bss
// 500 bytes in section .text
// 
// 500 bytes of CODE memory
//  29 bytes of DATA memory
//
//Errors: none
//Warnings: none
