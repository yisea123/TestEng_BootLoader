///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       18/Jun/2019  23:23:46
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_bkp.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_bkp.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\stm32f10x_bkp.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_BackupResetCmd

        PUBLIC BKP_ClearFlag
        PUBLIC BKP_ClearITPendingBit
        PUBLIC BKP_DeInit
        PUBLIC BKP_GetFlagStatus
        PUBLIC BKP_GetITStatus
        PUBLIC BKP_ITConfig
        PUBLIC BKP_RTCOutputConfig
        PUBLIC BKP_ReadBackupRegister
        PUBLIC BKP_SetRTCCalibrationValue
        PUBLIC BKP_TamperPinCmd
        PUBLIC BKP_TamperPinLevelConfig
        PUBLIC BKP_WriteBackupRegister


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_DeInit:
        PUSH     {R7,LR}
        MOVS     R0,#+1
        BL       RCC_BackupResetCmd
        MOVS     R0,#+0
        BL       RCC_BackupResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_TamperPinLevelConfig:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable10  ;; 0x420d8604
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_TamperPinCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable10_1  ;; 0x420d8600
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_ITConfig:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable10_2  ;; 0x420d8688
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_RTCOutputConfig:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable10_3  ;; 0x40006c2c
        LDRH     R2,[R2, #+0]
        MOVS     R1,R2
        MOVW     R2,#+64639
        ANDS     R1,R2,R1
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable10_3  ;; 0x40006c2c
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_SetRTCCalibrationValue:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable10_3  ;; 0x40006c2c
        LDRH     R2,[R2, #+0]
        MOVS     R1,R2
        MOVW     R2,#+65408
        ANDS     R1,R2,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable10_3  ;; 0x40006c2c
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_WriteBackupRegister:
        SUB      SP,SP,#+4
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
        LDR.N    R2,??DataTable10_4  ;; 0x40006c00
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADDS     R2,R0,R2
        STR      R2,[SP, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R2,[SP, #+0]
        STR      R1,[R2, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_ReadBackupRegister:
        SUB      SP,SP,#+4
        MOVS     R1,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable10_4  ;; 0x40006c00
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R0,R1,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_GetFlagStatus:
        LDR.N    R0,??DataTable10_5  ;; 0x420d86a0
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_ClearFlag:
        LDR.N    R0,??DataTable10_6  ;; 0x40006c34
        LDRH     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_6  ;; 0x40006c34
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_GetITStatus:
        LDR.N    R0,??DataTable10_7  ;; 0x420d86a4
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BKP_ClearITPendingBit:
        LDR.N    R0,??DataTable10_6  ;; 0x40006c34
        LDRH     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_6  ;; 0x40006c34
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x420d8604

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x420d8600

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x420d8688

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     0x40006c2c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0x40006c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     0x420d86a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x40006c34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     0x420d86a4

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
// 218 bytes in section .text
// 
// 218 bytes of CODE memory
//
//Errors: none
//Warnings: none
