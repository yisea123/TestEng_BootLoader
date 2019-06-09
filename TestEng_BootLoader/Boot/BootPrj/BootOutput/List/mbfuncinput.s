///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       09/Jun/2019  20:02:53
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbfuncinput.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbfuncinput.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\mbfuncinput.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN eMBRegInputCB
        EXTERN prveMBError2Exception

        PUBLIC eMBFuncReadInputRegister


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBFuncReadInputRegister:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R9,#+0
        LDRH     R0,[R5, #+0]
        CMP      R0,#+5
        BNE.N    ??eMBFuncReadInputRegister_0
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
        BEQ.N    ??eMBFuncReadInputRegister_1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+125
        BGE.N    ??eMBFuncReadInputRegister_1
        MOV      R8,R4
        MOVS     R0,#+0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+4
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
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R8
        BL       eMBRegInputCB
        MOV      R10,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??eMBFuncReadInputRegister_2
        MOV      R0,R10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       prveMBError2Exception
        MOV      R9,R0
        B.N      ??eMBFuncReadInputRegister_3
??eMBFuncReadInputRegister_2:
        LDRH     R0,[R5, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R0,R0,R7, LSL #+1
        STRH     R0,[R5, #+0]
        B.N      ??eMBFuncReadInputRegister_3
??eMBFuncReadInputRegister_1:
        MOVS     R0,#+3
        MOV      R9,R0
        B.N      ??eMBFuncReadInputRegister_3
??eMBFuncReadInputRegister_0:
        MOVS     R0,#+3
        MOV      R9,R0
??eMBFuncReadInputRegister_3:
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R10,PC}      ;; return

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
// 162 bytes in section .text
// 
// 162 bytes of CODE memory
//
//Errors: none
//Warnings: none
