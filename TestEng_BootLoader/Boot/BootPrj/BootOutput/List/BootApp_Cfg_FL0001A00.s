///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       09/Jun/2019  18:04:57
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_Cfg_FL0001A00.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_Cfg_FL0001A00.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_Cfg_FL0001A00.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC BootApp_App_GpioPin_cast
        PUBLIC BootApp_App_Prolog_st
        PUBLIC BootApp_Epilog_st
        PUBLIC BootApp_UartPort_cast


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
BootApp_App_GpioPin_cast:
        DATA
        DC32 40010C00H
        DC8 0, 0
        DC16 1
        DC8 3, 40, 0, 0
        DC32 40010C00H
        DC8 0, 0
        DC16 2
        DC8 3, 40, 0, 0
        DC32 40010C00H
        DC8 0, 0
        DC16 32
        DC8 3, 40, 0, 0
        DC32 40010C00H
        DC8 0, 0
        DC16 256
        DC8 3, 40, 0, 0
        DC32 40010C00H
        DC8 0, 0
        DC16 512
        DC8 3, 40, 0, 0
        DC32 40010C00H
        DC8 0, 0
        DC16 1024
        DC8 3, 40, 0, 0
        DC32 40010800H
        DC8 1, 0
        DC16 1024
        DC8 3, 4, 0, 0
        DC32 40010800H
        DC8 2, 0
        DC16 512
        DC8 3, 24, 0, 0
        DC32 40010800H
        DC8 3, 0
        DC16 2048
        DC8 3, 16, 0, 0
        DC32 40010800H
        DC8 4, 0
        DC16 4096
        DC8 3, 16, 0, 0
        DC32 40010C00H
        DC8 5, 0
        DC16 2048
        DC8 3, 16, 0, 0
        DC32 40011000H
        DC8 6, 0
        DC16 32768
        DC8 3, 16, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
BootApp_UartPort_cast:
        DATA
        DC32 40013800H, 19200
        DC16 4096, 0, 1024, 12, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
BootApp_App_Prolog_st:
        DATA
        DC8 "FL0001A00"
        DC8 0, 0, 0, 0, 0, 0
        DC8 "20181013"
        DC8 0, 0, 0, 0, 0, 0, 0
        DC8 "HuangHeFeedLi"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
BootApp_Epilog_st:
        DATA
        DC8 "FL0001A00"
        DC8 0, 0, 0, 0, 0, 0
        DC8 "20181013"
        DC8 0, 0, 0, 0, 0, 0, 0
        DC8 "HuangHeFeedLi"
        DC8 0, 0

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
// 260 bytes in section .rodata
// 
// 260 bytes of CONST memory
//
//Errors: none
//Warnings: none
