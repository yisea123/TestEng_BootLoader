///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       06/Apr/2019  21:50:30
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\DFB_src\io_functions.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\DFB_src\io_functions.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\dfb\dfb\Burn_in_2\List\io_functions.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Boot_GetApp_Cfg_Gpio
        EXTERN GPIO_ReadInputDataBit
        EXTERN GPIO_WriteBit

        PUBLIC Disable_usart_rx
        PUBLIC Disable_usart_tx
        PUBLIC Enable_usart_rx
        PUBLIC Enable_usart_tx
        PUBLIC Get_board_address


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Io_functions:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R8,#+0
        MOVS     R11,#+0
        MOV      R0,R11
        BL       Boot_GetApp_Cfg_Gpio
        STRB     R0,[SP, #+0]
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??Io_functions_0
        MOVS     R0,#+0
        B.N      ??Io_functions_1
??Io_functions_0:
        LDRH     R0,[R11, #+0]
        MOV      R9,R0
        LDR      R0,[R11, #+4]
        MOV      R10,R0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??Io_functions_2
        CMP      R10,#+0
        BNE.N    ??Io_functions_3
??Io_functions_2:
        MOVS     R0,#+0
        B.N      ??Io_functions_1
??Io_functions_3:
        MOVS     R0,#+0
        MOVS     R7,R0
??Io_functions_4:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R7,R9
        BCS.N    ??Io_functions_5
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R7,R10
        LDRB     R0,[R0, #+4]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R0,R4
        BNE.N    ??Io_functions_6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??Io_functions_7
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R7,R10
        LDRH     R1,[R0, #+6]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R7,R10
        LDR      R0,[R0, #+0]
        BL       GPIO_WriteBit
        B.N      ??Io_functions_6
??Io_functions_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??Io_functions_6
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R7,R10
        LDRH     R1,[R0, #+6]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R7,R10
        LDR      R0,[R0, #+0]
        BL       GPIO_ReadInputDataBit
        MOV      R8,R0
??Io_functions_6:
        ADDS     R7,R7,#+1
        B.N      ??Io_functions_4
??Io_functions_5:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??Io_functions_1:
        POP      {R1,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Disable_usart_rx:
        PUSH     {R7,LR}
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+3
        BL       Io_functions
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Enable_usart_rx:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+3
        BL       Io_functions
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Disable_usart_tx:
        PUSH     {R7,LR}
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+3
        BL       Io_functions
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Enable_usart_tx:
        PUSH     {R7,LR}
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+3
        BL       Io_functions
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Get_board_address:
        PUSH     {R4-R10,LR}
        MOVS     R10,#+0
        MOV      R0,R10
        BL       Boot_GetApp_Cfg_Gpio
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??Get_board_address_0
        MOVS     R0,#+0
        B.N      ??Get_board_address_1
??Get_board_address_0:
        LDRH     R0,[R10, #+0]
        MOV      R8,R0
        LDR      R0,[R10, #+4]
        MOV      R9,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??Get_board_address_2
        CMP      R9,#+0
        BNE.N    ??Get_board_address_3
??Get_board_address_2:
        MOVS     R0,#+0
        B.N      ??Get_board_address_1
??Get_board_address_3:
        MOVS     R0,#+0
        MOVS     R5,R0
??Get_board_address_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R5,R8
        BCS.N    ??Get_board_address_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+12
        MLA      R0,R0,R5,R9
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??Get_board_address_6
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
??Get_board_address_6:
        ADDS     R5,R5,#+1
        B.N      ??Get_board_address_4
??Get_board_address_5:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??Get_board_address_1:
        POP      {R4-R10,PC}      ;; return

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
// 370 bytes in section .text
// 
// 370 bytes of CODE memory
//
//Errors: none
//Warnings: 1
