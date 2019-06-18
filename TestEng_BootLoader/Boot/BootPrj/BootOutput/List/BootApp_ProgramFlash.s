///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       18/Jun/2019  23:23:38
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_ProgramFlash.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_ProgramFlash.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_ProgramFlash.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BootApp_Get_ReceiveData_Info
        EXTERN BootDrv_ProgramFlash

        PUBLIC BootApp_Program_Flash
        PUBLIC BootApp_Program_Flash_Finish
        PUBLIC BootApp_WriteData_ast


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
BootApp_WriteData_ast:
        DS8 960

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Program_Flash:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R8,#+0
        MOVS     R9,#+0
        MOVW     R10,#+16385
        STR      R4,[SP, #+4]
        ADD      R0,SP,#+0
        BL       BootApp_Get_ReceiveData_Info
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??BootApp_Program_Flash_0
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+10]
        STRH     R0,[SP, #+12]
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+12]
        MOVS     R5,R0
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+16]
        MOVS     R6,R0
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+20]
        MOVS     R7,R0
        SUBS     R0,R7,R6
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??BootApp_Program_Flash_1
??BootApp_Program_Flash_0:
        MOVS     R0,#+0
        MOV      R8,R0
        MOVW     R0,#+16388
        MOV      R10,R0
??BootApp_Program_Flash_1:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??BootApp_Program_Flash_2
        LDRH     R0,[SP, #+12]
        CMP      R0,#+0
        BEQ.N    ??BootApp_Program_Flash_3
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??BootApp_Program_Flash_2
??BootApp_Program_Flash_3:
        MOVW     R0,#+16389
        MOV      R10,R0
        MOVS     R0,#+0
        MOV      R8,R0
??BootApp_Program_Flash_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??BootApp_Program_Flash_4
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOV      R0,#+1024
        LDR.N    R1,??DataTable1  ;; 0x800bc00
        MLA      R0,R0,R5,R1
        CMP      R6,R0
        BNE.N    ??BootApp_Program_Flash_5
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??BootApp_Program_Flash_4
??BootApp_Program_Flash_5:
        MOVW     R0,#+16390
        MOV      R10,R0
        MOVS     R0,#+0
        MOV      R8,R0
??BootApp_Program_Flash_4:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??BootApp_Program_Flash_6
        LDR      R0,[SP, #+8]
        CMP      R0,#+1024
        BNE.N    ??BootApp_Program_Flash_7
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??BootApp_Program_Flash_6
??BootApp_Program_Flash_7:
        MOVW     R0,#+16391
        MOV      R10,R0
        MOVS     R0,#+0
        MOV      R8,R0
??BootApp_Program_Flash_6:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??BootApp_Program_Flash_8
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??BootApp_Program_Flash_9
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+81
        BGE.N    ??BootApp_Program_Flash_9
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??BootApp_Program_Flash_8
??BootApp_Program_Flash_9:
        MOVW     R0,#+16392
        MOV      R10,R0
        MOVS     R0,#+0
        MOV      R8,R0
??BootApp_Program_Flash_8:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??BootApp_Program_Flash_10
        LDR      R0,[SP, #+4]
        LDRH     R0,[R0, #+2]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R0,R5
        BNE.N    ??BootApp_Program_Flash_11
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??BootApp_Program_Flash_10
??BootApp_Program_Flash_11:
        MOVW     R0,#+16393
        MOV      R10,R0
        MOVS     R0,#+0
        MOV      R8,R0
??BootApp_Program_Flash_10:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??BootApp_Program_Flash_12
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        CMP      R0,R6
        BNE.N    ??BootApp_Program_Flash_13
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+36]
        CMP      R0,R7
        BNE.N    ??BootApp_Program_Flash_13
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??BootApp_Program_Flash_12
??BootApp_Program_Flash_13:
        MOVW     R0,#+16394
        MOV      R10,R0
        MOVS     R0,#+0
        MOV      R8,R0
??BootApp_Program_Flash_12:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??BootApp_Program_Flash_14
        LDR.N    R0,??DataTable1_1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R1,#+12
        MLA      R0,R1,R5,R0
        SUBS     R0,R0,#+12
        MOV      R11,R0
        LDRH     R0,[R11, #+2]
        CMP      R0,#+0
        BNE.N    ??BootApp_Program_Flash_15
        LDR      R2,[SP, #+8]
        MOVS     R1,R7
        MOVS     R0,R6
        BL       BootDrv_ProgramFlash
        MOV      R9,R0
??BootApp_Program_Flash_15:
        STRH     R5,[R11, #+0]
        STR      R6,[R11, #+4]
        STR      R7,[R11, #+8]
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        STRH     R9,[R11, #+2]
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??BootApp_Program_Flash_16
        BL       BootApp_Program_Flash_Finish
        CMP      R0,#+0
        BEQ.N    ??BootApp_Program_Flash_17
        MOVW     R0,#+16387
        MOV      R10,R0
        B.N      ??BootApp_Program_Flash_14
??BootApp_Program_Flash_17:
        MOVW     R0,#+16386
        MOV      R10,R0
        B.N      ??BootApp_Program_Flash_14
??BootApp_Program_Flash_16:
        MOVW     R0,#+16395
        MOV      R10,R0
??BootApp_Program_Flash_14:
        MOV      R0,R10
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Program_Flash_Finish:
        MOVS     R0,#+0
        LDR.N    R3,??DataTable1_1
        MOVS     R2,R3
        MOVS     R3,#+0
        MOVS     R1,R3
??BootApp_Program_Flash_Finish_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+80
        BGE.N    ??BootApp_Program_Flash_Finish_1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R3,#+12
        MLA      R3,R3,R1,R2
        LDRH     R3,[R3, #+2]
        CMP      R3,#+0
??BootApp_Program_Flash_Finish_2:
        ADDS     R1,R1,#+1
        B.N      ??BootApp_Program_Flash_Finish_0
??BootApp_Program_Flash_Finish_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+80
        BNE.N    ??BootApp_Program_Flash_Finish_3
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??BootApp_Program_Flash_Finish_4
??BootApp_Program_Flash_Finish_3:
        MOVS     R3,#+0
        MOVS     R0,R3
??BootApp_Program_Flash_Finish_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x800bc00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     BootApp_WriteData_ast

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
// 960 bytes in section .bss
// 482 bytes in section .text
// 
// 482 bytes of CODE memory
// 960 bytes of DATA memory
//
//Errors: none
//Warnings: none
