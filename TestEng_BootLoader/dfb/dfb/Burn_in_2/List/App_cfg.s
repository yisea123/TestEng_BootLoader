///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       06/Apr/2019  21:55:22
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\DFB_src\App_cfg.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\DFB_src\App_cfg.c
//        -lcN
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\Burn_in_2\List\
//        -lb
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\Burn_in_2\List\
//        -o
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\Burn_in_2\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --fpu=None --dlib_config "E:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\DFB_inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\..\Libraries\CMSIS\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\..\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\ascii\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\include\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\modbus_port\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\rtu\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\..\modbus\tcp\
//        -On -I "E:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\Burn_in_2\List\App_cfg.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC App_Cfg_Epilog_st
        PUBLIC App_Cfg_GpioPin_cast
        PUBLIC App_Cfg_Gpio_cst
        PUBLIC App_Cfg_UartPort_Cast
        PUBLIC App_Cfg_Uart_cst
        PUBLIC App_Cfg_cst


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
App_Cfg_GpioPin_cast:
        DATA
        DC32 40010800H
        DC8 0, 0
        DC16 2
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 0, 0
        DC16 2
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 0, 0
        DC16 2
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 0, 0
        DC16 2
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 0, 0
        DC16 2
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 0, 0
        DC16 2
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 1, 0
        DC16 2
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 2, 0
        DC16 2
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 3, 0
        DC16 2
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 4, 0
        DC16 2
        DC8 3, 16, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
App_Cfg_Gpio_cst:
        DATA
        DC16 10, 6
        DC32 App_Cfg_GpioPin_cast

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
App_Cfg_UartPort_Cast:
        DATA
        DC32 40013800H, 19200
        DC16 4096, 0, 1024, 12, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
App_Cfg_Uart_cst:
        DATA
        DC16 1
        DC8 0, 0
        DC32 App_Cfg_UartPort_Cast

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
App_Cfg_cst:
        DATA
        DC8 "FL0001A00"
        DC8 0, 0, 0, 0, 0, 0
        DC8 "20181013"
        DC8 0, 0, 0, 0, 0, 0, 0
        DC8 "HuangHe"
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 App_Cfg_Gpio_cst, App_Cfg_Uart_cst, 801FC00H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
App_Cfg_Epilog_st:
        DATA
        DC8 "HuangHe"
        DC8 0, 0, 0, 0, 0, 0, 0, 0

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
//  16 bytes in section .data
// 216 bytes in section .rodata
// 
// 216 bytes of CONST memory
//  16 bytes of DATA  memory
//
//Errors: none
//Warnings: none
