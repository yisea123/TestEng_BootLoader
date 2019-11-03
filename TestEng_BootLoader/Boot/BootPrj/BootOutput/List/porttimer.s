///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       03/Nov/2019  11:14:57
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\modbus_port\porttimer.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\modbus_port\porttimer.c
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
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\porttimer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN NVIC_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN SystemCoreClock
        EXTERN TIM_ARRPreloadConfig
        EXTERN TIM_ClearITPendingBit
        EXTERN TIM_Cmd
        EXTERN TIM_GetITStatus
        EXTERN TIM_ITConfig
        EXTERN TIM_SetCounter
        EXTERN TIM_TimeBaseInit
        EXTERN pxMBPortCBTimerExpired

        PUBLIC TIM4_IRQHandler
        PUBLIC vMBPortTimersDelay
        PUBLIC vMBPortTimersDisable
        PUBLIC vMBPortTimersEnable
        PUBLIC xMBPortTimersInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBPortTimersInit:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB1PeriphClockCmd
        LDR.N    R0,??DataTable4
        LDR      R0,[R0, #+0]
        MOVW     R1,#+20000
        UDIV     R0,R0,R1
        SUBS     R0,R0,#+1
        MOVS     R5,R0
        STRH     R4,[SP, #+8]
        STRH     R5,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+10]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        ADD      R1,SP,#+4
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_TimeBaseInit
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_ARRPreloadConfig
        MOV      R0,#+1536
        BL       NVIC_PriorityGroupConfig
        MOVS     R0,#+30
        STRB     R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+1
        STRB     R0,[SP, #+3]
        ADD      R0,SP,#+0
        BL       NVIC_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_ClearITPendingBit
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_ITConfig
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_Cmd
        MOVS     R0,#+1
        ADD      SP,SP,#+20
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
vMBPortTimersEnable:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_ClearITPendingBit
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_ITConfig
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_SetCounter
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_Cmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
vMBPortTimersDisable:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_ClearITPendingBit
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_ITConfig
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_SetCounter
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_Cmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
vMBPortTimersDelay:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
prvvTIMERExpiredISR:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        BLX      R0
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM4_IRQHandler:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_GetITStatus
        CMP      R0,#+0
        BEQ.N    ??TIM4_IRQHandler_0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_1  ;; 0x40000800
        BL       TIM_ClearITPendingBit
        BL       prvvTIMERExpiredISR
??TIM4_IRQHandler_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     SystemCoreClock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40000800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     pxMBPortCBTimerExpired

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
// 266 bytes in section .text
// 
// 266 bytes of CODE memory
//
//Errors: none
//Warnings: none
