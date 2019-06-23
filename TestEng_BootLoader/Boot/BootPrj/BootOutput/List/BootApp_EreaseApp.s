///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  15:42:46
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_EreaseApp.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_EreaseApp.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_EreaseApp.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BootDrv_EreaseFlash

        PUBLIC BootApp_Erease_App


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
BootApp_Erease_App:
        PUSH     {R4-R8,LR}
        MOVS     R4,#+1
        LDR.N    R5,??BootApp_Erease_App_0  ;; 0x800c000
        LDR.N    R6,??BootApp_Erease_App_0+0x4  ;; 0x801ffff
        MOV      R7,#+1024
        MOVW     R8,#+4098
??BootApp_Erease_App_1:
        CMP      R5,R6
        BCS.N    ??BootApp_Erease_App_2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Erease_App_3
        MOVS     R1,R7
        MOVS     R0,R5
        BL       BootDrv_EreaseFlash
        MOVS     R4,R0
??BootApp_Erease_App_3:
        ADDS     R5,R7,R5
        B.N      ??BootApp_Erease_App_1
??BootApp_Erease_App_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Erease_App_4
        MOVW     R0,#+4097
        MOV      R8,R0
        B.N      ??BootApp_Erease_App_5
??BootApp_Erease_App_4:
        MOVW     R0,#+4099
        MOV      R8,R0
??BootApp_Erease_App_5:
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        POP      {R4-R8,PC}       ;; return
        Nop      
        DATA
??BootApp_Erease_App_0:
        DC32     0x800c000
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
// 80 bytes in section .text
// 
// 80 bytes of CODE memory
//
//Errors: none
//Warnings: none
