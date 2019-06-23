///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  16:32:34
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbfuncholding.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbfuncholding.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\mbfuncholding.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN eMBRegHoldingCB
        EXTERN prveMBError2Exception

        PUBLIC eMBFuncReadHoldingRegister
        PUBLIC eMBFuncReadWriteMultipleHoldingRegister
        PUBLIC eMBFuncWriteHoldingRegister
        PUBLIC eMBFuncWriteMultipleHoldingRegister


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBFuncWriteHoldingRegister:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        LDRH     R0,[R5, #+0]
        CMP      R0,#+5
        BNE.N    ??eMBFuncWriteHoldingRegister_0
        LDRB     R0,[R4, #+1]
        LSLS     R0,R0,#+8
        MOV      R8,R0
        LDRB     R0,[R4, #+2]
        ORRS     R8,R0,R8
        ADDS     R8,R8,#+1
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOV      R1,R8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R4,#+3
        BL       eMBRegHoldingCB
        MOVS     R7,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??eMBFuncWriteHoldingRegister_1
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       prveMBError2Exception
        MOVS     R6,R0
        B.N      ??eMBFuncWriteHoldingRegister_1
??eMBFuncWriteHoldingRegister_0:
        MOVS     R0,#+3
        MOVS     R6,R0
??eMBFuncWriteHoldingRegister_1:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBFuncWriteMultipleHoldingRegister:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R9,#+0
        LDRH     R0,[R5, #+0]
        CMP      R0,#+6
        BLT.N    ??eMBFuncWriteMultipleHoldingRegister_0
        LDRB     R0,[R4, #+1]
        LSLS     R0,R0,#+8
        MOVS     R6,R0
        LDRB     R0,[R4, #+2]
        ORRS     R6,R0,R6
        ADDS     R6,R6,#+1
        LDRB     R0,[R4, #+3]
        LSLS     R0,R0,#+8
        MOVS     R7,R0
        LDRB     R0,[R4, #+4]
        ORRS     R7,R0,R7
        LDRB     R0,[R4, #+5]
        MOV      R8,R0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BEQ.N    ??eMBFuncWriteMultipleHoldingRegister_1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+121
        BGE.N    ??eMBFuncWriteMultipleHoldingRegister_1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LSLS     R0,R7,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R8,R0
        BNE.N    ??eMBFuncWriteMultipleHoldingRegister_1
        MOVS     R3,#+1
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R4,#+6
        BL       eMBRegHoldingCB
        MOV      R10,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??eMBFuncWriteMultipleHoldingRegister_2
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       prveMBError2Exception
        MOV      R9,R0
        B.N      ??eMBFuncWriteMultipleHoldingRegister_3
??eMBFuncWriteMultipleHoldingRegister_2:
        MOVS     R0,#+5
        STRH     R0,[R5, #+0]
        B.N      ??eMBFuncWriteMultipleHoldingRegister_3
??eMBFuncWriteMultipleHoldingRegister_1:
        MOVS     R0,#+3
        MOV      R9,R0
        B.N      ??eMBFuncWriteMultipleHoldingRegister_3
??eMBFuncWriteMultipleHoldingRegister_0:
        MOVS     R0,#+3
        MOV      R9,R0
??eMBFuncWriteMultipleHoldingRegister_3:
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBFuncReadHoldingRegister:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R9,#+0
        LDRH     R0,[R5, #+0]
        CMP      R0,#+5
        BNE.N    ??eMBFuncReadHoldingRegister_0
        LDRB     R0,[R4, #+1]
        LSLS     R0,R0,#+8
        MOVS     R6,R0
        LDRB     R0,[R4, #+2]
        ORRS     R6,R0,R6
        ADDS     R6,R6,#+1
        LDRB     R0,[R4, #+3]
        LSLS     R0,R0,#+8
        MOVS     R7,R0
        LDRB     R0,[R4, #+4]
        MOVS     R7,R0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BEQ.N    ??eMBFuncReadHoldingRegister_1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+126
        BGE.N    ??eMBFuncReadHoldingRegister_1
        MOV      R8,R4
        MOVS     R0,#+0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+3
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
        LDRH     R0,[R5, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+0]
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+1
        STRB     R0,[R8, #+0]
        ADDS     R8,R8,#+1
        LDRH     R0,[R5, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+0]
        MOVS     R3,#+0
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R8
        BL       eMBRegHoldingCB
        MOV      R10,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??eMBFuncReadHoldingRegister_2
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       prveMBError2Exception
        MOV      R9,R0
        B.N      ??eMBFuncReadHoldingRegister_3
??eMBFuncReadHoldingRegister_2:
        LDRH     R0,[R5, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R0,R0,R7, LSL #+1
        STRH     R0,[R5, #+0]
        B.N      ??eMBFuncReadHoldingRegister_3
??eMBFuncReadHoldingRegister_1:
        MOVS     R0,#+3
        MOV      R9,R0
        B.N      ??eMBFuncReadHoldingRegister_3
??eMBFuncReadHoldingRegister_0:
        MOVS     R0,#+3
        MOV      R9,R0
??eMBFuncReadHoldingRegister_3:
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBFuncReadWriteMultipleHoldingRegister:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        LDRH     R0,[R5, #+0]
        CMP      R0,#+10
        BLT.N    ??eMBFuncReadWriteMultipleHoldingRegister_0
        LDRB     R0,[R4, #+1]
        LSLS     R0,R0,#+8
        MOVS     R7,R0
        LDRB     R0,[R4, #+2]
        ORRS     R7,R0,R7
        ADDS     R7,R7,#+1
        LDRB     R0,[R4, #+3]
        LSLS     R0,R0,#+8
        MOV      R8,R0
        LDRB     R0,[R4, #+4]
        ORRS     R8,R0,R8
        LDRB     R0,[R4, #+5]
        LSLS     R0,R0,#+8
        MOV      R9,R0
        LDRB     R0,[R4, #+6]
        ORRS     R9,R0,R9
        ADDS     R9,R9,#+1
        LDRB     R0,[R4, #+7]
        LSLS     R0,R0,#+8
        MOV      R10,R0
        LDRB     R0,[R4, #+8]
        ORRS     R10,R0,R10
        LDRB     R0,[R4, #+9]
        STRB     R0,[SP, #+1]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BEQ.N    ??eMBFuncReadWriteMultipleHoldingRegister_1
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+126
        BGE.N    ??eMBFuncReadWriteMultipleHoldingRegister_1
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BEQ.N    ??eMBFuncReadWriteMultipleHoldingRegister_1
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+122
        BGE.N    ??eMBFuncReadWriteMultipleHoldingRegister_1
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        LSLS     R0,R10,#+1
        LDRB     R1,[SP, #+1]
        CMP      R0,R1
        BNE.N    ??eMBFuncReadWriteMultipleHoldingRegister_1
        MOVS     R3,#+1
        MOV      R2,R10
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R4,#+10
        BL       eMBRegHoldingCB
        STRB     R0,[SP, #+0]
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??eMBFuncReadWriteMultipleHoldingRegister_2
        MOV      R11,R4
        MOVS     R0,#+0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+23
        STRB     R0,[R11, #+0]
        ADDS     R11,R11,#+1
        LDRH     R0,[R5, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+0]
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+1
        STRB     R0,[R11, #+0]
        ADDS     R11,R11,#+1
        LDRH     R0,[R5, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+0]
        MOVS     R3,#+0
        MOV      R2,R8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R11
        BL       eMBRegHoldingCB
        STRB     R0,[SP, #+0]
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??eMBFuncReadWriteMultipleHoldingRegister_2
        LDRH     R0,[R5, #+0]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R0,R0,R8, LSL #+1
        STRH     R0,[R5, #+0]
??eMBFuncReadWriteMultipleHoldingRegister_2:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??eMBFuncReadWriteMultipleHoldingRegister_0
        LDRB     R0,[SP, #+0]
        BL       prveMBError2Exception
        MOVS     R6,R0
        B.N      ??eMBFuncReadWriteMultipleHoldingRegister_0
??eMBFuncReadWriteMultipleHoldingRegister_1:
        MOVS     R0,#+3
        MOVS     R6,R0
??eMBFuncReadWriteMultipleHoldingRegister_0:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R11,PC}   ;; return

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
// 650 bytes in section .text
// 
// 650 bytes of CODE memory
//
//Errors: none
//Warnings: none
