///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       01/Sep/2019  10:25:26
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbutils.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbutils.c
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
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\mbutils.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC prveMBError2Exception
        PUBLIC xMBUtilGetBits
        PUBLIC xMBUtilSetBits


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBUtilSetBits:
        PUSH     {R4-R8,LR}
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R7,R3
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     LR,R1,#+3
        MOV      R5,LR
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     LR,R1,R5, LSL #+3
        MOV      R6,LR
        LSLS     R7,R7,R6
        MOVS     LR,#+1
        LSLS     LR,LR,R2
        SUBS     LR,LR,#+1
        MOV      R12,LR
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     LR,R1,R5, LSL #+3
        LSLS     R12,R12,LR
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDRB     LR,[R5, R0]
        MOV      R4,LR
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     LR,R5,R0
        LDRB     LR,[LR, #+1]
        ORRS     R4,R4,LR, LSL #+8
        BICS     R4,R4,R12
        ORRS     R4,R7,R4
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        STRB     R4,[R5, R0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSRS     LR,R4,#+8
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R8,R5,R0
        STRB     LR,[R8, #+1]
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBUtilGetBits:
        PUSH     {R4-R7}
        MOVS     R3,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R7,R1,#+3
        MOVS     R5,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        SUBS     R7,R1,R5, LSL #+3
        MOVS     R6,R7
        MOVS     R7,#+1
        LSLS     R7,R7,R2
        SUBS     R7,R7,#+1
        MOVS     R4,R7
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDRB     R7,[R5, R3]
        MOVS     R0,R7
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R7,R5,R3
        LDRB     R7,[R7, #+1]
        ORRS     R0,R0,R7, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,R6
        ANDS     R0,R4,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
prveMBError2Exception:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,R1
        CMP      R2,#+0
        BEQ.N    ??prveMBError2Exception_0
        CMP      R2,#+1
        BEQ.N    ??prveMBError2Exception_1
        CMP      R2,#+7
        BEQ.N    ??prveMBError2Exception_2
        B.N      ??prveMBError2Exception_3
??prveMBError2Exception_0:
        MOVS     R2,#+0
        MOVS     R0,R2
        B.N      ??prveMBError2Exception_4
??prveMBError2Exception_1:
        MOVS     R2,#+2
        MOVS     R0,R2
        B.N      ??prveMBError2Exception_4
??prveMBError2Exception_2:
        MOVS     R2,#+6
        MOVS     R0,R2
        B.N      ??prveMBError2Exception_4
??prveMBError2Exception_3:
        MOVS     R2,#+4
        MOVS     R0,R2
??prveMBError2Exception_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

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
// 208 bytes in section .text
// 
// 208 bytes of CODE memory
//
//Errors: none
//Warnings: none
