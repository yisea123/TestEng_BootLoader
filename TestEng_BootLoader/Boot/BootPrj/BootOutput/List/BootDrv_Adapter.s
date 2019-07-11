///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       03/Jul/2019  23:23:51
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootDrv_Adapter.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootDrv_Adapter.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootDrv_Adapter.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BootApp_SectBuffer_Read
        EXTERN FLASH_ErasePage
        EXTERN FLASH_Lock
        EXTERN FLASH_ProgramWord
        EXTERN FLASH_Unlock

        PUBLIC BootDrv_EreaseFlash
        PUBLIC BootDrv_ProgramFlash
        PUBLIC BootDrv_Reset


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootDrv_Reset:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootDrv_EreaseFlash:
        PUSH     {R3-R7,LR}
        MOVS     R7,R0
        MOVS     R4,R1
        LDR.N    R0,??DataTable1  ;; 0x800c400
        CMP      R7,R0
        BCC.N    ??BootDrv_EreaseFlash_0
        LDR.N    R0,??DataTable1_1  ;; 0x801ffff
        CMP      R7,R0
        BCS.N    ??BootDrv_EreaseFlash_0
        CPSID    I
        BL       FLASH_Unlock
        LSRS     R7,R7,#+10
        LSLS     R7,R7,#+10
        MOVS     R0,R7
        BL       FLASH_ErasePage
        MOVS     R6,R0
        BL       FLASH_Lock
        CPSIE    I
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.N    ??BootDrv_EreaseFlash_1
        MOVS     R0,#+1
        MOVS     R5,R0
        B.N      ??BootDrv_EreaseFlash_2
??BootDrv_EreaseFlash_1:
        MOVS     R0,#+0
        MOVS     R5,R0
        B.N      ??BootDrv_EreaseFlash_2
??BootDrv_EreaseFlash_0:
        MOVS     R0,#+0
        MOVS     R5,R0
??BootDrv_EreaseFlash_2:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootDrv_ProgramFlash:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R9,#+1
        LDR.N    R0,??DataTable1  ;; 0x800c400
        CMP      R4,R0
        BCC.N    ??BootDrv_ProgramFlash_0
        LDR.N    R0,??DataTable1_1  ;; 0x801ffff
        CMP      R4,R0
        BCS.N    ??BootDrv_ProgramFlash_0
        CPSID    I
        BL       FLASH_Unlock
        MOVS     R0,#+0
        MOV      R8,R0
??BootDrv_ProgramFlash_1:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+255
        BGT.N    ??BootDrv_ProgramFlash_2
        ADD      R2,SP,#+0
        MOVS     R1,#+1
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       BootApp_SectBuffer_Read
        MOVS     R7,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??BootDrv_ProgramFlash_3
        LDR      R1,[SP, #+0]
        MOVS     R0,R4
        BL       FLASH_ProgramWord
        MOV      R9,R0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+4
        BNE.N    ??BootDrv_ProgramFlash_4
        ADDS     R4,R4,#+4
        ADDS     R8,R8,#+1
        B.N      ??BootDrv_ProgramFlash_1
??BootDrv_ProgramFlash_4:
        B.N      ??BootDrv_ProgramFlash_2
??BootDrv_ProgramFlash_3:
??BootDrv_ProgramFlash_2:
        BL       FLASH_Lock
        CPSIE    I
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+4
        BNE.N    ??BootDrv_ProgramFlash_5
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??BootDrv_ProgramFlash_6
??BootDrv_ProgramFlash_5:
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??BootDrv_ProgramFlash_6
??BootDrv_ProgramFlash_0:
        MOVS     R0,#+0
        MOVS     R7,R0
??BootDrv_ProgramFlash_6:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x800c400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x801ffff

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
// 216 bytes in section .text
// 
// 216 bytes of CODE memory
//
//Errors: none
//Warnings: none
