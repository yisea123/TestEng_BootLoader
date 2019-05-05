///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:32
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\init.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\init.c
//        -lcN
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\
//        -lb
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\
//        -o
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --fpu=None --dlib_config "E:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\DFB_inc\
//        -I
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\..\Libraries\CMSIS\
//        -I
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\..\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\ascii\
//        -I
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\include\
//        -I
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\modbus_port\
//        -I
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\rtu\
//        -I
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\tcp\
//        -On -I "E:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\init.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN AD7949_init
        EXTERN Choose_MUX_Channel
        EXTERN Disable_cs_eep
        EXTERN Disable_m_en1
        EXTERN Disable_m_en2
        EXTERN Disable_m_en3
        EXTERN Disable_m_en4
        EXTERN Disable_m_en5
        EXTERN Disable_m_en6
        EXTERN Disable_spi_en
        EXTERN Disable_sw_vs1
        EXTERN Disable_usart_rx
        EXTERN Disable_usart_tx
        EXTERN Disable_vo_en6
        EXTERN Disable_vo_en7
        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_Init
        EXTERN Enable_m_en1
        EXTERN Enable_m_en2
        EXTERN Enable_m_en3
        EXTERN Enable_m_en4
        EXTERN Enable_m_en5
        EXTERN Enable_m_en6
        EXTERN Enable_spi_en
        EXTERN Enable_usart_rx
        EXTERN Enable_vo_en6
        EXTERN Enable_vo_en7
        EXTERN Enable_wp_eep
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
        EXTERN LTC2620_init
        EXTERN MAX5478_init
        EXTERN Max7312_init
        EXTERN NVIC_Init
        EXTERN NVIC_PriorityGroupConfig
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN SPI_Cmd
        EXTERN SPI_Init
        EXTERN Set_spi_cs_n
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
        BL       GPIO_Configuration
        BL       EXIT_Config
        BL       USART_1_Configuration
        BL       SPI_2_Configuration
        BL       I2C_1_Configuration
        BL       Disable_sw_vs1
        BL       Disable_vo_en6
        BL       Disable_vo_en7
        BL       Disable_cs_eep
        BL       Enable_wp_eep
        BL       Disable_usart_rx
        BL       Disable_usart_tx
        BL       Disable_spi_en
        BL       Disable_m_en1
        BL       Disable_m_en2
        BL       Disable_m_en3
        BL       Disable_m_en4
        BL       Disable_m_en5
        BL       Disable_m_en6
        BL       Enable_vo_en6
        BL       Enable_vo_en7
        BL       Enable_spi_en
        BL       Enable_m_en1
        BL       Enable_m_en2
        BL       Enable_m_en3
        BL       Enable_m_en4
        BL       Enable_m_en5
        BL       Enable_m_en6
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+0
        BL       Choose_MUX_Channel
        BL       MAX5478_init
        BL       Max7312_init
        BL       LTC2620_init
        BL       AD7949_init
        BL       Enable_usart_rx
        BL       Disable_usart_tx
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_Configuration:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+60
        BL       RCC_APB2PeriphClockCmd
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7  ;; 0x204001
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
        MOV      R0,#+1280
        BL       NVIC_PriorityGroupConfig
        MOVS     R0,#+23
        STRB     R0,[SP, #+0]
        MOVS     R0,#+2
        STRB     R0,[SP, #+1]
        MOVS     R0,#+2
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
        DC32     0x204001

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
// 1 182 bytes in section .text
// 
// 1 182 bytes of CODE memory
//
//Errors: none
//Warnings: none
