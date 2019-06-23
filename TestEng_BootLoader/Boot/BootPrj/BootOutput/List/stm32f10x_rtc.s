///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  15:42:57
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_rtc.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_rtc.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\stm32f10x_rtc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC RTC_ClearFlag
        PUBLIC RTC_ClearITPendingBit
        PUBLIC RTC_EnterConfigMode
        PUBLIC RTC_ExitConfigMode
        PUBLIC RTC_GetCounter
        PUBLIC RTC_GetDivider
        PUBLIC RTC_GetFlagStatus
        PUBLIC RTC_GetITStatus
        PUBLIC RTC_ITConfig
        PUBLIC RTC_SetAlarm
        PUBLIC RTC_SetCounter
        PUBLIC RTC_SetPrescaler
        PUBLIC RTC_WaitForLastTask
        PUBLIC RTC_WaitForSynchro


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ITConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RTC_ITConfig_0
        LDR.N    R2,??DataTable13  ;; 0x40002800
        LDRH     R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable13  ;; 0x40002800
        STRH     R2,[R3, #+0]
        B.N      ??RTC_ITConfig_1
??RTC_ITConfig_0:
        LDR.N    R2,??DataTable13  ;; 0x40002800
        LDRH     R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable13  ;; 0x40002800
        STRH     R2,[R3, #+0]
??RTC_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_EnterConfigMode:
        LDR.N    R0,??DataTable13_1  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable13_1  ;; 0x40002804
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ExitConfigMode:
        LDR.N    R0,??DataTable13_1  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+65519
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable13_1  ;; 0x40002804
        STRH     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetCounter:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_2  ;; 0x4000281c
        LDRH     R1,[R1, #+0]
        MOVS     R0,R1
        LDR.N    R1,??DataTable13_3  ;; 0x40002818
        LDRH     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ORRS     R0,R0,R1, LSL #+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_SetCounter:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       RTC_EnterConfigMode
        LSRS     R0,R4,#+16
        LDR.N    R1,??DataTable13_3  ;; 0x40002818
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable13_2  ;; 0x4000281c
        STRH     R4,[R0, #+0]
        BL       RTC_ExitConfigMode
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_SetPrescaler:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       RTC_EnterConfigMode
        LSRS     R0,R4,#+16
        ANDS     R0,R0,#0xF
        LDR.N    R1,??DataTable13_4  ;; 0x40002808
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable13_5  ;; 0x4000280c
        STRH     R4,[R0, #+0]
        BL       RTC_ExitConfigMode
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_SetAlarm:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       RTC_EnterConfigMode
        LSRS     R0,R4,#+16
        LDR.N    R1,??DataTable13_6  ;; 0x40002820
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable13_7  ;; 0x40002824
        STRH     R4,[R0, #+0]
        BL       RTC_ExitConfigMode
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetDivider:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_8  ;; 0x40002810
        LDRH     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R1,R1,#0xF
        LSLS     R1,R1,#+16
        MOVS     R0,R1
        LDR.N    R1,??DataTable13_9  ;; 0x40002814
        LDRH     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_WaitForLastTask:
??RTC_WaitForLastTask_0:
        LDR.N    R0,??DataTable13_1  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??RTC_WaitForLastTask_0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_WaitForSynchro:
        LDR.N    R0,??DataTable13_1  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+65527
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable13_1  ;; 0x40002804
        STRH     R0,[R1, #+0]
??RTC_WaitForSynchro_0:
        LDR.N    R0,??DataTable13_1  ;; 0x40002804
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??RTC_WaitForSynchro_0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetFlagStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable13_1  ;; 0x40002804
        LDRH     R2,[R2, #+0]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        TST      R2,R1
        BEQ.N    ??RTC_GetFlagStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??RTC_GetFlagStatus_1
??RTC_GetFlagStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??RTC_GetFlagStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ClearFlag:
        LDR.N    R1,??DataTable13_1  ;; 0x40002804
        LDRH     R1,[R1, #+0]
        BICS     R1,R1,R0
        LDR.N    R2,??DataTable13_1  ;; 0x40002804
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetITStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable13_1  ;; 0x40002804
        LDRH     R2,[R2, #+0]
        ANDS     R2,R1,R2
        MOVS     R0,R2
        LDR.N    R2,??DataTable13  ;; 0x40002800
        LDRH     R2,[R2, #+0]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        TST      R2,R1
        BEQ.N    ??RTC_GetITStatus_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??RTC_GetITStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??RTC_GetITStatus_1
??RTC_GetITStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??RTC_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ClearITPendingBit:
        LDR.N    R1,??DataTable13_1  ;; 0x40002804
        LDRH     R1,[R1, #+0]
        BICS     R1,R1,R0
        LDR.N    R2,??DataTable13_1  ;; 0x40002804
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x40002800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0x40002804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     0x4000281c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     0x40002818

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     0x40002808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     0x4000280c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     0x40002820

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     0x40002824

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     0x40002810

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     0x40002814

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
// 352 bytes in section .text
// 
// 352 bytes of CODE memory
//
//Errors: none
//Warnings: none
