///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  16:32:40
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\CMSIS\stm32f10x_it.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\CMSIS\stm32f10x_it.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\stm32f10x_it.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN TIM_ClearFlag

        PUBLIC BusFault_Handler
        PUBLIC DebugMon_Handler
        PUBLIC EXTI9_5_IRQHandler
        PUBLIC HardFault_Handler
        PUBLIC I2C1_ER_IRQHandler
        PUBLIC MemManage_Handler
        PUBLIC NMI_Handler
        PUBLIC PendSV_Handler
        PUBLIC RTCAlarm_IRQHandler
        PUBLIC RTC_IRQHandler
        PUBLIC SPI2_IRQHandler
        PUBLIC SVC_Handler
        PUBLIC TIM2_IRQHandler
        PUBLIC USART2_IRQHandler
        PUBLIC UsageFault_Handler


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART2_IRQHandler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI9_5_IRQHandler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM2_IRQHandler:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+1073741824
        BL       TIM_ClearFlag
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NMI_Handler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HardFault_Handler:
??HardFault_Handler_0:
        B.N      ??HardFault_Handler_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
MemManage_Handler:
??MemManage_Handler_0:
        B.N      ??MemManage_Handler_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BusFault_Handler:
??BusFault_Handler_0:
        B.N      ??BusFault_Handler_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
UsageFault_Handler:
??UsageFault_Handler_0:
        B.N      ??UsageFault_Handler_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SVC_Handler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DebugMon_Handler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PendSV_Handler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_IRQHandler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI2_IRQHandler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C1_ER_IRQHandler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTCAlarm_IRQHandler:
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
// 42 bytes in section .text
// 
// 42 bytes of CODE memory
//
//Errors: none
//Warnings: none
