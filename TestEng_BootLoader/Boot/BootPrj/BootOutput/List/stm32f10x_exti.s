///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       29/Jun/2019  14:55:10
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_exti.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_exti.c
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
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\stm32f10x_exti.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC EXTI_ClearFlag
        PUBLIC EXTI_ClearITPendingBit
        PUBLIC EXTI_DeInit
        PUBLIC EXTI_GenerateSWInterrupt
        PUBLIC EXTI_GetFlagStatus
        PUBLIC EXTI_GetITStatus
        PUBLIC EXTI_Init
        PUBLIC EXTI_StructInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_DeInit:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6  ;; 0x40010400
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x40010404
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2  ;; 0x40010408
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_3  ;; 0x4001040c
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable6_4  ;; 0xfffff
        LDR.N    R1,??DataTable6_5  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_Init:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable6  ;; 0x40010400
        MOVS     R1,R2
        LDRB     R2,[R0, #+6]
        CMP      R2,#+0
        BEQ.N    ??EXTI_Init_0
        LDR.N    R2,??DataTable6  ;; 0x40010400
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR.N    R3,??DataTable6  ;; 0x40010400
        STR      R2,[R3, #+0]
        LDR.N    R2,??DataTable6_1  ;; 0x40010404
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR.N    R3,??DataTable6_1  ;; 0x40010404
        STR      R2,[R3, #+0]
        LDRB     R2,[R0, #+4]
        ADDS     R1,R2,R1
        LDR      R2,[R1, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R2,R3,R2
        STR      R2,[R1, #+0]
        LDR.N    R2,??DataTable6_2  ;; 0x40010408
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR.N    R3,??DataTable6_2  ;; 0x40010408
        STR      R2,[R3, #+0]
        LDR.N    R2,??DataTable6_3  ;; 0x4001040c
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR.N    R3,??DataTable6_3  ;; 0x4001040c
        STR      R2,[R3, #+0]
        LDRB     R2,[R0, #+5]
        CMP      R2,#+16
        BNE.N    ??EXTI_Init_1
        LDR.N    R2,??DataTable6_2  ;; 0x40010408
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R2,R3,R2
        LDR.N    R3,??DataTable6_2  ;; 0x40010408
        STR      R2,[R3, #+0]
        LDR.N    R2,??DataTable6_3  ;; 0x4001040c
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R2,R3,R2
        LDR.N    R3,??DataTable6_3  ;; 0x4001040c
        STR      R2,[R3, #+0]
        B.N      ??EXTI_Init_2
??EXTI_Init_1:
        LDR.N    R2,??DataTable6  ;; 0x40010400
        MOVS     R1,R2
        LDRB     R2,[R0, #+5]
        ADDS     R1,R2,R1
        LDR      R2,[R1, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R2,R3,R2
        STR      R2,[R1, #+0]
        B.N      ??EXTI_Init_2
??EXTI_Init_0:
        LDRB     R2,[R0, #+4]
        ADDS     R1,R2,R1
        LDR      R2,[R1, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        STR      R2,[R1, #+0]
??EXTI_Init_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+4]
        MOVS     R1,#+12
        STRB     R1,[R0, #+5]
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GenerateSWInterrupt:
        LDR.N    R1,??DataTable6_6  ;; 0x40010410
        LDR      R1,[R1, #+0]
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable6_6  ;; 0x40010410
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GetFlagStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable6_5  ;; 0x40010414
        LDR      R2,[R2, #+0]
        TST      R2,R1
        BEQ.N    ??EXTI_GetFlagStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??EXTI_GetFlagStatus_1
??EXTI_GetFlagStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??EXTI_GetFlagStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_ClearFlag:
        LDR.N    R1,??DataTable6_5  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GetITStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6  ;; 0x40010400
        LDR      R3,[R3, #+0]
        ANDS     R3,R1,R3
        MOVS     R2,R3
        LDR.N    R3,??DataTable6_5  ;; 0x40010414
        LDR      R3,[R3, #+0]
        TST      R3,R1
        BEQ.N    ??EXTI_GetITStatus_0
        CMP      R2,#+0
        BEQ.N    ??EXTI_GetITStatus_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??EXTI_GetITStatus_1
??EXTI_GetITStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??EXTI_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_ClearITPendingBit:
        LDR.N    R1,??DataTable6_5  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x40010400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x40010404

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x40010408

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x4001040c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0xfffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x40010414

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x40010410

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
// 304 bytes in section .text
// 
// 304 bytes of CODE memory
//
//Errors: none
//Warnings: none
