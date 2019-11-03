///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       03/Nov/2019  11:14:51
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_IoFunctions.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_IoFunctions.c
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
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_IoFunctions.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BootApp_Get_Cfg_Gpio
        EXTERN GPIO_ReadInputDataBit
        EXTERN GPIO_WriteBit

        PUBLIC BootApp_Disable_err_led
        PUBLIC BootApp_Disable_run_led
        PUBLIC BootApp_Disable_usart_rx
        PUBLIC BootApp_Disable_usart_tx
        PUBLIC BootApp_Enable_err_led
        PUBLIC BootApp_Enable_run_led
        PUBLIC BootApp_Enable_usart_rx
        PUBLIC BootApp_Enable_usart_tx
        PUBLIC BootApp_Get_board_address


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_IoFunction:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R9,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R11,#+0
        ADD      R0,SP,#+0
        BL       BootApp_Get_Cfg_Gpio
        MOVS     R7,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??BootApp_IoFunction_0
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+0]
        MOV      R10,R0
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+4]
        MOV      R11,R0
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??BootApp_IoFunction_1
        CMP      R11,#+0
        BNE.N    ??BootApp_IoFunction_2
??BootApp_IoFunction_1:
        MOVS     R0,#+0
        B.N      ??BootApp_IoFunction_3
??BootApp_IoFunction_2:
        MOVS     R0,#+0
        MOV      R8,R0
??BootApp_IoFunction_4:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R8,R10
        BCS.N    ??BootApp_IoFunction_0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R8,R11
        LDRB     R0,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R0,R4
        BNE.N    ??BootApp_IoFunction_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??BootApp_IoFunction_6
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R8,R11
        LDRH     R1,[R0, #+6]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R8,R11
        LDR      R0,[R0, #+0]
        BL       GPIO_WriteBit
        B.N      ??BootApp_IoFunction_5
??BootApp_IoFunction_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??BootApp_IoFunction_5
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R8,R11
        LDRH     R1,[R0, #+6]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R8,R11
        LDR      R0,[R0, #+0]
        BL       GPIO_ReadInputDataBit
        MOV      R9,R0
??BootApp_IoFunction_5:
        ADDS     R8,R8,#+1
        B.N      ??BootApp_IoFunction_4
??BootApp_IoFunction_0:
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??BootApp_IoFunction_3:
        POP      {R1,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Get_board_address:
        PUSH     {R3-R9,LR}
        MOVS     R6,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R9,#+0
        ADD      R0,SP,#+0
        BL       BootApp_Get_Cfg_Gpio
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Get_board_address_0
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+2]
        MOV      R8,R0
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+4]
        MOV      R9,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??BootApp_Get_board_address_1
        CMP      R9,#+0
        BNE.N    ??BootApp_Get_board_address_2
??BootApp_Get_board_address_1:
        MOVS     R0,#+0
        B.N      ??BootApp_Get_board_address_3
??BootApp_Get_board_address_2:
        MOVS     R0,#+0
        MOVS     R5,R0
??BootApp_Get_board_address_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R5,R8
        BCS.N    ??BootApp_Get_board_address_0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R5,R9
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??BootApp_Get_board_address_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R5,R9
        LDRH     R1,[R0, #+6]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R5,R9
        LDR      R0,[R0, #+0]
        BL       GPIO_ReadInputDataBit
        MOVS     R7,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LSLS     R0,R7,R5
        ORRS     R6,R0,R6
??BootApp_Get_board_address_5:
        ADDS     R5,R5,#+1
        B.N      ??BootApp_Get_board_address_4
??BootApp_Get_board_address_0:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??BootApp_Get_board_address_3:
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Disable_usart_rx:
        PUSH     {R7,LR}
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+3
        BL       BootApp_IoFunction
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Enable_usart_rx:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+3
        BL       BootApp_IoFunction
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Disable_usart_tx:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       BootApp_IoFunction
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Enable_usart_tx:
        PUSH     {R7,LR}
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       BootApp_IoFunction
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Disable_run_led:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+6
        BL       BootApp_IoFunction
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Enable_run_led:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+6
        BL       BootApp_IoFunction
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Disable_err_led:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+5
        BL       BootApp_IoFunction
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Enable_err_led:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+5
        BL       BootApp_IoFunction
        POP      {R0,PC}          ;; return

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
// 438 bytes in section .text
// 
// 438 bytes of CODE memory
//
//Errors: none
//Warnings: 1
