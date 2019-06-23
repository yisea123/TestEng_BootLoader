///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  16:32:34
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbfuncother.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\functions\mbfuncother.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\mbfuncother.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy

        PUBLIC eMBFuncReportSlaveID
        PUBLIC eMBSetSlaveID


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
ucMBSlaveID:
        DS8 32

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
usMBSlaveIDLen:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBSetSlaveID:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R8,R2
        MOVS     R7,R3
        MOVS     R6,#+0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R0,R7,#+2
        CMP      R0,#+32
        BGE.N    ??eMBSetSlaveID_0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable1_1
        LDR.N    R1,??DataTable1
        LDRH     R1,[R1, #+0]
        STRB     R4,[R1, R0]
        LDR.N    R0,??DataTable1
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable1
        LDRH     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.N    R2,??DataTable1
        STRH     R1,[R2, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??eMBSetSlaveID_1
        MOVS     R1,#+255
        B.N      ??eMBSetSlaveID_2
??eMBSetSlaveID_1:
        MOVS     R1,#+0
??eMBSetSlaveID_2:
        LDR.N    R2,??DataTable1_1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STRB     R1,[R0, R2]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BEQ.N    ??eMBSetSlaveID_3
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.N    R0,??DataTable1_1
        LDR.N    R1,??DataTable1
        LDRH     R1,[R1, #+0]
        ADDS     R9,R1,R0
        MOVS     R2,R7
        MOV      R1,R8
        MOV      R0,R9
        BL       __aeabi_memcpy
        LDR.N    R0,??DataTable1
        LDRH     R0,[R0, #+0]
        ADDS     R0,R7,R0
        LDR.N    R1,??DataTable1
        STRH     R0,[R1, #+0]
        B.N      ??eMBSetSlaveID_3
??eMBSetSlaveID_0:
        MOVS     R0,#+4
        MOVS     R6,R0
??eMBSetSlaveID_3:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBFuncReportSlaveID:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable1
        LDRH     R6,[R0, #+0]
        LDR.N    R7,??DataTable1_1
        ADDS     R8,R4,#+1
        MOVS     R2,R6
        MOVS     R1,R7
        MOV      R0,R8
        BL       __aeabi_memcpy
        LDR.N    R0,??DataTable1
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+0]
        MOVS     R0,#+0
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     usMBSlaveIDLen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     ucMBSlaveID

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
//  34 bytes in section .bss
// 176 bytes in section .text
// 
// 176 bytes of CODE memory
//  34 bytes of DATA memory
//
//Errors: none
//Warnings: none
