///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Jun/2019  12:01:39
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootDrv\src\init.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootDrv\src\init.c
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
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\init.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_Init
        EXTERN GPIO_EXTILineConfig
        EXTERN GPIO_Init
        EXTERN I2C_CalculatePEC
        EXTERN I2C_Cmd
        EXTERN I2C_Init
        EXTERN IWDG_Enable
        EXTERN IWDG_ReloadCounter
        EXTERN IWDG_SetPrescaler
        EXTERN IWDG_SetReload
        EXTERN IWDG_WriteAccessCmd
        EXTERN NVIC_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN SPI_Cmd
        EXTERN SPI_Init
        EXTERN TIM_ClearFlag
        EXTERN TIM_Cmd
        EXTERN TIM_ITConfig
        EXTERN TIM_TimeBaseInit
        EXTERN USART_Cmd
        EXTERN USART_ITConfig
        EXTERN USART_Init

        PUBLIC EXIT_Config
        PUBLIC GPIO_Configuration
        PUBLIC I2C_1_Configuration
        PUBLIC I2C_2_Configuration
        PUBLIC IWDG_Configuration
        PUBLIC NVIC_Configuration
        PUBLIC RCC_Configuration
        PUBLIC SPI_1_Configuration
        PUBLIC SPI_2_Configuration
        PUBLIC TIM_2_Configuration
        PUBLIC USART_1_Configuration
        PUBLIC USART_2_Configuration
        PUBLIC init


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
init:
        PUSH     {R7,LR}
        BL       RCC_Configuration
        BL       NVIC_Configuration
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_Configuration:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+60
        BL       RCC_APB2PeriphClockCmd
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7  ;; 0x20001
        BL       RCC_APB1PeriphClockCmd
        MOVS     R1,#+1
        MOVW     R0,#+16385
        BL       RCC_APB2PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphClockCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_Configuration:
        PUSH     {R7,LR}
        MOV      R0,#+1536
        BL       NVIC_PriorityGroupConfig
        MOVS     R0,#+37
        STRB     R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
        MOVS     R0,#+1
        STRB     R0,[SP, #+3]
        ADD      R0,SP,#+0
        BL       NVIC_Init
        MOVS     R0,#+38
        STRB     R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
        MOVS     R0,#+1
        STRB     R0,[SP, #+3]
        ADD      R0,SP,#+0
        BL       NVIC_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Configuration:
        PUSH     {R7,LR}
        MOVW     R0,#+6495
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_1  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R0,#+32
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_1  ;; 0x40010800
        BL       GPIO_Init
        MOV      R0,#+1024
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_1  ;; 0x40010800
        BL       GPIO_Init
        MOV      R0,#+512
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_1  ;; 0x40010800
        BL       GPIO_Init
        MOVW     R0,#+1827
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_2  ;; 0x40010c00
        BL       GPIO_Init
        MOVS     R0,#+192
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+28
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_2  ;; 0x40010c00
        BL       GPIO_Init
        MOV      R0,#+57344
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_2  ;; 0x40010c00
        BL       GPIO_Init
        MOV      R0,#+6144
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_2  ;; 0x40010c00
        BL       GPIO_Init
        MOVW     R0,#+65535
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_3  ;; 0x40011000
        BL       GPIO_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_2_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOV      R0,#+19200
        STR      R0,[SP, #+0]
        MOV      R0,#+4096
        STRH     R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOV      R0,#+1024
        STRH     R0,[SP, #+8]
        MOVS     R0,#+0
        STRH     R0,[SP, #+12]
        MOVS     R0,#+12
        STRH     R0,[SP, #+10]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_4  ;; 0x40004400
        BL       USART_Init
        MOVS     R2,#+1
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable7_4  ;; 0x40004400
        BL       USART_ITConfig
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_4  ;; 0x40004400
        BL       USART_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_1_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOV      R0,#+19200
        STR      R0,[SP, #+0]
        MOV      R0,#+4096
        STRH     R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOV      R0,#+1024
        STRH     R0,[SP, #+8]
        MOVS     R0,#+0
        STRH     R0,[SP, #+12]
        MOVS     R0,#+12
        STRH     R0,[SP, #+10]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_5  ;; 0x40013800
        BL       USART_Init
        MOVS     R2,#+1
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable7_5  ;; 0x40013800
        BL       USART_ITConfig
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_5  ;; 0x40013800
        BL       USART_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_2_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        MOV      R0,#+260
        STRH     R0,[SP, #+2]
        MOV      R0,#+2048
        STRH     R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOVS     R0,#+0
        STRH     R0,[SP, #+8]
        MOV      R0,#+512
        STRH     R0,[SP, #+10]
        MOVS     R0,#+0
        STRH     R0,[SP, #+12]
        MOVS     R0,#+0
        STRH     R0,[SP, #+14]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_6  ;; 0x40003800
        BL       SPI_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_6  ;; 0x40003800
        BL       SPI_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_1_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        MOV      R0,#+260
        STRH     R0,[SP, #+2]
        MOV      R0,#+2048
        STRH     R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOVS     R0,#+0
        STRH     R0,[SP, #+8]
        MOV      R0,#+512
        STRH     R0,[SP, #+10]
        MOVS     R0,#+56
        STRH     R0,[SP, #+12]
        MOVS     R0,#+0
        STRH     R0,[SP, #+14]
        MOVS     R0,#+7
        STRH     R0,[SP, #+16]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_7  ;; 0x40013000
        BL       SPI_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_7  ;; 0x40013000
        BL       SPI_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_2_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R0,#+10
        STRH     R0,[SP, #+4]
        MOVW     R0,#+49151
        STRH     R0,[SP, #+6]
        MOVS     R0,#+49
        STRH     R0,[SP, #+8]
        MOV      R0,#+1024
        STRH     R0,[SP, #+10]
        MOV      R0,#+16384
        STRH     R0,[SP, #+12]
        LDR.N    R0,??DataTable7_8  ;; 0x61a80
        STR      R0,[SP, #+0]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_9  ;; 0x40005800
        BL       I2C_Init
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_9  ;; 0x40005800
        BL       I2C_CalculatePEC
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_1_Configuration:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        MOVW     R0,#+49151
        STRH     R0,[SP, #+6]
        MOVS     R0,#+48
        STRH     R0,[SP, #+8]
        MOV      R0,#+1024
        STRH     R0,[SP, #+10]
        MOV      R0,#+16384
        STRH     R0,[SP, #+12]
        MOVW     R0,#+10000
        STR      R0,[SP, #+0]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable7_10  ;; 0x40005400
        BL       I2C_Init
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_10  ;; 0x40005400
        BL       I2C_CalculatePEC
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_10  ;; 0x40005400
        BL       I2C_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x20001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x40010c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     0x61a80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     0x40005800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x40005400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXIT_Config:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOVS     R0,#+32
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+5
        MOVS     R0,#+0
        BL       GPIO_EXTILineConfig
        MOVS     R0,#+32
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
        MOVS     R0,#+8
        STRB     R0,[SP, #+5]
        MOVS     R0,#+1
        STRB     R0,[SP, #+6]
        ADD      R0,SP,#+0
        BL       EXTI_Init
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_2_Configuration:
        PUSH     {R5-R7,LR}
        MOVW     R0,#+1999
        STRH     R0,[SP, #+4]
        MOVW     R0,#+35999
        STRH     R0,[SP, #+0]
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
        MOVS     R0,#+0
        STRH     R0,[SP, #+2]
        ADD      R1,SP,#+0
        MOVS     R0,#+1073741824
        BL       TIM_TimeBaseInit
        MOVS     R1,#+1
        MOVS     R0,#+1073741824
        BL       TIM_ClearFlag
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+1073741824
        BL       TIM_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+1073741824
        BL       TIM_Cmd
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_Configuration:
        PUSH     {R7,LR}
        MOVW     R0,#+21845
        BL       IWDG_WriteAccessCmd
        MOVS     R0,#+3
        BL       IWDG_SetPrescaler
        MOVW     R0,#+2500
        BL       IWDG_SetReload
        BL       IWDG_ReloadCounter
        BL       IWDG_Enable
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
// 1 026 bytes in section .text
// 
// 1 026 bytes of CODE memory
//
//Errors: none
//Warnings: none
