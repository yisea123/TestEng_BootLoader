///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  15:42:47
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_Init.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_Init.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_Init.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BootApp_App_Cfg_cpcst
        EXTERN BootApp_Disable_usart_tx
        EXTERN BootApp_Enable_usart_rx
        EXTERN BootApp_Get_board_address
        EXTERN GPIO_Init
        EXTERN USART_Cmd
        EXTERN USART_Init
        EXTERN eMBEnable
        EXTERN eMBInit

        PUBLIC BootApp_Get_Cfg_Gpio
        PUBLIC BootApp_Get_Cfg_Uart
        PUBLIC BootApp_Get_Uart
        PUBLIC BootApp_Prog_init
        PUBLIC slave_addr


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
BootApp_GetApp_init_en:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
slave_addr:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Prog_init:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BootApp_Prog_init_0
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_1
        STRB     R0,[R1, #+0]
        B.N      ??BootApp_Prog_init_1
??BootApp_Prog_init_0:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_1
        STRB     R0,[R1, #+0]
??BootApp_Prog_init_1:
        BL       BootApp_Gpio_Init
        BL       BootApp_Uart_Init
        BL       BootApp_Enable_usart_rx
        BL       BootApp_Disable_usart_tx
        CPSID    I
        BL       BootApp_Get_board_address
        LDR.N    R1,??DataTable2_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOV      R3,#+19200
        MOVS     R2,#+1
        LDR.N    R0,??DataTable2_2
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+0
        BL       eMBInit
        BL       eMBEnable
        CPSIE    I
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Get_Cfg_Gpio:
        MOVS     R1,R0
        LDR.N    R2,??DataTable2_1
        LDRB     R2,[R2, #+0]
        CMP      R2,#+1
        BNE.N    ??BootApp_Get_Cfg_Gpio_0
        LDR.N    R2,??DataTable2
        LDR      R2,[R2, #+0]
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??BootApp_Get_Cfg_Gpio_1
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??BootApp_Get_Cfg_Gpio_2
??BootApp_Get_Cfg_Gpio_1:
        MOVS     R2,#+0
        MOVS     R0,R2
        B.N      ??BootApp_Get_Cfg_Gpio_2
??BootApp_Get_Cfg_Gpio_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??BootApp_Get_Cfg_Gpio_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Get_Cfg_Uart:
        MOVS     R1,R0
        LDR.N    R2,??DataTable2_1
        LDRB     R2,[R2, #+0]
        CMP      R2,#+1
        BNE.N    ??BootApp_Get_Cfg_Uart_0
        LDR.N    R2,??DataTable2
        LDR      R2,[R2, #+0]
        LDR      R2,[R2, #+4]
        STR      R2,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??BootApp_Get_Cfg_Uart_1
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??BootApp_Get_Cfg_Uart_2
??BootApp_Get_Cfg_Uart_1:
        MOVS     R2,#+0
        MOVS     R0,R2
        B.N      ??BootApp_Get_Cfg_Uart_2
??BootApp_Get_Cfg_Uart_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??BootApp_Get_Cfg_Uart_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     BootApp_App_Cfg_cpcst

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     BootApp_GetApp_init_en

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     slave_addr

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Gpio_Init:
        PUSH     {R3-R7,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+0
        BL       BootApp_Get_Cfg_Gpio
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Gpio_Init_0
        MOVS     R0,#+0
        MOVS     R5,R0
??BootApp_Gpio_Init_1:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[SP, #+0]
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCS.N    ??BootApp_Gpio_Init_0
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+4]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R5,R0
        LDR      R0,[R0, #+0]
        MOVS     R6,R0
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+4]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R5,R0
        ADDS     R0,R0,#+6
        MOVS     R7,R0
        MOVS     R1,R7
        MOVS     R0,R6
        BL       GPIO_Init
        ADDS     R5,R5,#+1
        B.N      ??BootApp_Gpio_Init_1
??BootApp_Gpio_Init_0:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Uart_Init:
        PUSH     {R3-R7,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+0
        BL       BootApp_Get_Cfg_Uart
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Uart_Init_0
        MOVS     R0,#+0
        MOVS     R5,R0
??BootApp_Uart_Init_1:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[SP, #+0]
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCS.N    ??BootApp_Uart_Init_0
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+4]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R5,R0
        LDR      R0,[R0, #+0]
        MOVS     R6,R0
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+4]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R5,R0
        ADDS     R0,R0,#+4
        MOVS     R7,R0
        MOVS     R1,R7
        MOVS     R0,R6
        BL       USART_Init
        MOVS     R1,#+1
        MOVS     R0,R6
        BL       USART_Cmd
        ADDS     R5,R5,#+1
        B.N      ??BootApp_Uart_Init_1
??BootApp_Uart_Init_0:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Get_Uart:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+0
        BL       BootApp_Get_Cfg_Uart
        MOVS     R5,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??BootApp_Get_Uart_0
        MOVS     R0,#+0
        MOVS     R6,R0
??BootApp_Get_Uart_1:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[SP, #+0]
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCS.N    ??BootApp_Get_Uart_0
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+4]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R6,R0
        LDR      R0,[R0, #+0]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STR      R0,[R4, R6, LSL #+2]
        ADDS     R6,R6,#+1
        B.N      ??BootApp_Get_Uart_1
??BootApp_Get_Uart_0:
        POP      {R0,R1,R4-R6,PC}  ;; return

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
//   2 bytes in section .bss
// 418 bytes in section .text
// 
// 418 bytes of CODE memory
//   2 bytes of DATA memory
//
//Errors: none
//Warnings: 1
