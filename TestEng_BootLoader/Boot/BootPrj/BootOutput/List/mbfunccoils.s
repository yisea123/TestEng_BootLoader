///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       29/Jun/2019  14:55:04
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbfunccoils.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbfunccoils.c
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
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\mbfunccoils.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN eMBRegCoilsCB
        EXTERN prveMBError2Exception

        PUBLIC eMBFuncReadCoils
        PUBLIC eMBFuncWriteCoil
        PUBLIC eMBFuncWriteMultipleCoils


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBFuncReadCoils:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R10,#+0
        LDRH     R0,[R5, #+0]
        CMP      R0,#+5
        BNE.N    ??eMBFuncReadCoils_0
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
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BEQ.N    ??eMBFuncReadCoils_1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+2000
        BGE.N    ??eMBFuncReadCoils_1
        MOV      R9,R4
        MOVS     R0,#+0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+1
        STRB     R0,[R9, #+0]
        ADDS     R9,R9,#+1
        LDRH     R0,[R5, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+0]
        MOVS     R1,#+7
        TST      R7,R1
        BEQ.N    ??eMBFuncReadCoils_2
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+8
        SDIV     R0,R7,R0
        ADDS     R0,R0,#+1
        MOV      R8,R0
        B.N      ??eMBFuncReadCoils_3
??eMBFuncReadCoils_2:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+8
        SDIV     R0,R7,R0
        MOV      R8,R0
??eMBFuncReadCoils_3:
        STRB     R8,[R9, #+0]
        ADDS     R9,R9,#+1
        LDRH     R0,[R5, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+0]
        MOVS     R3,#+0
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R9
        BL       eMBRegCoilsCB
        MOV      R11,R0
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BEQ.N    ??eMBFuncReadCoils_4
        MOV      R0,R11
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       prveMBError2Exception
        MOV      R10,R0
        B.N      ??eMBFuncReadCoils_5
??eMBFuncReadCoils_4:
        LDRH     R0,[R5, #+0]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R0,R8,R0
        STRH     R0,[R5, #+0]
        B.N      ??eMBFuncReadCoils_5
??eMBFuncReadCoils_1:
        MOVS     R0,#+3
        MOV      R10,R0
        B.N      ??eMBFuncReadCoils_5
??eMBFuncReadCoils_0:
        MOVS     R0,#+3
        MOV      R10,R0
??eMBFuncReadCoils_5:
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBFuncWriteCoil:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,#+0
        LDRH     R0,[R5, #+0]
        CMP      R0,#+5
        BNE.N    ??eMBFuncWriteCoil_0
        LDRB     R0,[R4, #+1]
        LSLS     R0,R0,#+8
        MOVS     R6,R0
        LDRB     R0,[R4, #+2]
        ORRS     R6,R0,R6
        ADDS     R6,R6,#+1
        LDRB     R0,[R4, #+4]
        CMP      R0,#+0
        BNE.N    ??eMBFuncWriteCoil_1
        LDRB     R0,[R4, #+3]
        CMP      R0,#+255
        BEQ.N    ??eMBFuncWriteCoil_2
        LDRB     R0,[R4, #+3]
        CMP      R0,#+0
        BNE.N    ??eMBFuncWriteCoil_1
??eMBFuncWriteCoil_2:
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
        LDRB     R0,[R4, #+3]
        CMP      R0,#+255
        BNE.N    ??eMBFuncWriteCoil_3
        MOVS     R0,#+1
        STRB     R0,[SP, #+0]
        B.N      ??eMBFuncWriteCoil_4
??eMBFuncWriteCoil_3:
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
??eMBFuncWriteCoil_4:
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADD      R0,SP,#+0
        BL       eMBRegCoilsCB
        MOV      R8,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??eMBFuncWriteCoil_5
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       prveMBError2Exception
        MOVS     R7,R0
        B.N      ??eMBFuncWriteCoil_5
??eMBFuncWriteCoil_1:
        MOVS     R0,#+3
        MOVS     R7,R0
        B.N      ??eMBFuncWriteCoil_5
??eMBFuncWriteCoil_0:
        MOVS     R0,#+3
        MOVS     R7,R0
??eMBFuncWriteCoil_5:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBFuncWriteMultipleCoils:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R9,#+0
        LDRH     R0,[R5, #+0]
        CMP      R0,#+6
        BLT.N    ??eMBFuncWriteMultipleCoils_0
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
        MOV      R11,R0
        MOVS     R1,#+7
        TST      R7,R1
        BEQ.N    ??eMBFuncWriteMultipleCoils_1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+8
        SDIV     R0,R7,R0
        ADDS     R0,R0,#+1
        MOV      R8,R0
        B.N      ??eMBFuncWriteMultipleCoils_2
??eMBFuncWriteMultipleCoils_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+8
        SDIV     R0,R7,R0
        MOV      R8,R0
??eMBFuncWriteMultipleCoils_2:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BEQ.N    ??eMBFuncWriteMultipleCoils_3
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+1968
        BGT.N    ??eMBFuncWriteMultipleCoils_3
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R8,R11
        BNE.N    ??eMBFuncWriteMultipleCoils_3
        MOVS     R3,#+1
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R4,#+6
        BL       eMBRegCoilsCB
        MOV      R10,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??eMBFuncWriteMultipleCoils_4
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       prveMBError2Exception
        MOV      R9,R0
        B.N      ??eMBFuncWriteMultipleCoils_5
??eMBFuncWriteMultipleCoils_4:
        MOVS     R0,#+5
        STRH     R0,[R5, #+0]
        B.N      ??eMBFuncWriteMultipleCoils_5
??eMBFuncWriteMultipleCoils_3:
        MOVS     R0,#+3
        MOV      R9,R0
        B.N      ??eMBFuncWriteMultipleCoils_5
??eMBFuncWriteMultipleCoils_0:
        MOVS     R0,#+3
        MOV      R9,R0
??eMBFuncWriteMultipleCoils_5:
        MOV      R0,R9
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
// 486 bytes in section .text
// 
// 486 bytes of CODE memory
//
//Errors: none
//Warnings: none
