///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:32
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\LTC2620.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\LTC2620.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\LTC2620.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delay_ms
        EXTERN GPIO_Init
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN SPI_Cmd
        EXTERN SPI_Init
        EXTERN Set_spi_cs_n
        EXTERN drv_spi_access_short

        PUBLIC LTC2620_Powerdown_all
        PUBLIC LTC2620_Powerdown_n
        PUBLIC LTC2620_Updata_all
        PUBLIC LTC2620_Updata_n
        PUBLIC LTC2620_Write_all
        PUBLIC LTC2620_Write_all_Updata_all
        PUBLIC LTC2620_Write_n
        PUBLIC LTC2620_Write_n_Updata_n
        PUBLIC LTC2620_init
        PUBLIC ltc2620_au16
        PUBLIC test_ltc2620
        PUBLIC test_ltc2620_ini


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
ltc2620_au16:
        DS8 32

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_init:
        PUSH     {R7,LR}
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+1
        BL       Set_spi_cs_n
        BL       LTC2620_Powerdown_all
        MOVS     R0,#+2
        BL       Set_spi_cs_n
        BL       LTC2620_Powerdown_all
        MOVS     R0,#+3
        BL       Set_spi_cs_n
        BL       LTC2620_Powerdown_all
        MOVS     R0,#+4
        BL       Set_spi_cs_n
        BL       LTC2620_Powerdown_all
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Spi_command_write:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,#+0
        CMP      R5,#+0
        BEQ.N    ??LTC2620_Spi_command_write_0
        CMP      R6,#+0
        BNE.N    ??LTC2620_Spi_command_write_1
??LTC2620_Spi_command_write_0:
        MOVS     R0,#+0
        B.N      ??LTC2620_Spi_command_write_2
??LTC2620_Spi_command_write_1:
        MOVS     R2,R6
        LDRH     R1,[R5, #+0]
        LDR.W    R0,??DataTable3  ;; 0x40003800
        BL       drv_spi_access_short
        MOVS     R7,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??LTC2620_Spi_command_write_3
        ADDS     R2,R6,#+2
        LDRH     R1,[R5, #+2]
        LDR.W    R0,??DataTable3  ;; 0x40003800
        BL       drv_spi_access_short
        MOVS     R7,R0
??LTC2620_Spi_command_write_3:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2620_Spi_command_write_2:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Write_Register:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BLT.N    ??LTC2620_Write_Register_0
        MOVS     R0,#+0
        B.N      ??LTC2620_Write_Register_1
??LTC2620_Write_Register_0:
        LDR.W    R0,??DataTable3_1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+2
        MOV      R8,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R0,R4,#0xF0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ANDS     R1,R5,#0xF
        ORRS     R0,R1,R0
        STRH     R0,[SP, #+0]
        STRH     R6,[SP, #+2]
        CMP      R8,#+0
        BNE.N    ??LTC2620_Write_Register_2
        MOVS     R0,#+0
        B.N      ??LTC2620_Write_Register_1
??LTC2620_Write_Register_2:
        MOV      R2,R8
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable3  ;; 0x40003800
        BL       LTC2620_Spi_command_write
        MOVS     R7,R0
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2620_Write_Register_1:
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Write_n:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+8
        BLT.N    ??LTC2620_Write_n_0
        MOVS     R0,#+0
        B.N      ??LTC2620_Write_n_1
??LTC2620_Write_n_0:
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       LTC2620_Write_Register
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2620_Write_n_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Updata_n:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+8
        BLT.N    ??LTC2620_Updata_n_0
        MOVS     R0,#+0
        B.N      ??LTC2620_Updata_n_1
??LTC2620_Updata_n_0:
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+16
        BL       LTC2620_Write_Register
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2620_Updata_n_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Write_n_Updata_n:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+8
        BLT.N    ??LTC2620_Write_n_Updata_n_0
        MOVS     R0,#+0
        B.N      ??LTC2620_Write_n_Updata_n_1
??LTC2620_Write_n_Updata_n_0:
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+48
        BL       LTC2620_Write_Register
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2620_Write_n_Updata_n_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Powerdown_n:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+8
        BLT.N    ??LTC2620_Powerdown_n_0
        MOVS     R0,#+0
        B.N      ??LTC2620_Powerdown_n_1
??LTC2620_Powerdown_n_0:
        MOVW     R2,#+65535
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+64
        BL       LTC2620_Write_Register
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2620_Powerdown_n_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Write_all:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R0,#+0
        MOVS     R6,R0
??LTC2620_Write_all_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+8
        BGE.N    ??LTC2620_Write_all_1
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Write_n
        MOVS     R5,R0
        ADDS     R6,R6,#+1
        B.N      ??LTC2620_Write_all_0
??LTC2620_Write_all_1:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Updata_all:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R0,#+0
        MOVS     R6,R0
??LTC2620_Updata_all_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+8
        BGE.N    ??LTC2620_Updata_all_1
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Updata_n
        MOVS     R5,R0
        ADDS     R6,R6,#+1
        B.N      ??LTC2620_Updata_all_0
??LTC2620_Updata_all_1:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Write_all_Updata_all:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R0,#+0
        MOVS     R6,R0
??LTC2620_Write_all_Updata_all_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+8
        BGE.N    ??LTC2620_Write_all_Updata_all_1
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Write_n_Updata_n
        MOVS     R5,R0
        ADDS     R6,R6,#+1
        B.N      ??LTC2620_Write_all_Updata_all_0
??LTC2620_Write_all_Updata_all_1:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2620_Powerdown_all:
        PUSH     {R3-R5,LR}
        MOVS     R4,#+0
        MOVS     R0,#+0
        MOVS     R5,R0
??LTC2620_Powerdown_all_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+8
        BGE.N    ??LTC2620_Powerdown_all_1
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Powerdown_n
        MOVS     R4,R0
        ADDS     R5,R5,#+1
        B.N      ??LTC2620_Powerdown_all_0
??LTC2620_Powerdown_all_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(1)
ltc2620_all:
        DATA
        DC16 32768

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
test_ltc2620_ini:
        PUSH     {LR}
        SUB      SP,SP,#+28
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB1PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+28
        BL       RCC_APB2PeriphClockCmd
        MOVW     R0,#+65535
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable3_2  ;; 0x40010800
        BL       GPIO_Init
        MOVW     R0,#+65535
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable3_3  ;; 0x40010c00
        BL       GPIO_Init
        MOVW     R0,#+65535
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable3_4  ;; 0x40011000
        BL       GPIO_Init
        MOV      R0,#+57344
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable3_3  ;; 0x40010c00
        BL       GPIO_Init
        MOV      R0,#+960
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable3_4  ;; 0x40011000
        BL       GPIO_Init
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
        MOV      R0,#+260
        STRH     R0,[SP, #+6]
        MOV      R0,#+2048
        STRH     R0,[SP, #+8]
        MOVS     R0,#+0
        STRH     R0,[SP, #+10]
        MOVS     R0,#+0
        STRH     R0,[SP, #+12]
        MOV      R0,#+512
        STRH     R0,[SP, #+14]
        MOVS     R0,#+8
        STRH     R0,[SP, #+16]
        MOVS     R0,#+0
        STRH     R0,[SP, #+18]
        MOVS     R0,#+7
        STRH     R0,[SP, #+20]
        ADD      R1,SP,#+4
        LDR.N    R0,??DataTable3  ;; 0x40003800
        BL       SPI_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable3  ;; 0x40003800
        BL       SPI_Cmd
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
test_ltc2620:
        PUSH     {R4,LR}
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+1
        BL       Set_spi_cs_n
        MOVS     R0,#+10
        BL       Delay_ms
        MOVS     R0,#+0
        MOVS     R4,R0
??test_ltc2620_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??test_ltc2620_1
        LDR.N    R0,??DataTable3_5
        LDRH     R1,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Write_n_Updata_n
        MOVS     R0,#+10
        BL       Delay_ms
        ADDS     R4,R4,#+1
        B.N      ??test_ltc2620_0
??test_ltc2620_1:
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+2
        BL       Set_spi_cs_n
        MOVS     R0,#+10
        BL       Delay_ms
        MOVS     R0,#+0
        MOVS     R4,R0
??test_ltc2620_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??test_ltc2620_3
        LDR.N    R0,??DataTable3_5
        LDRH     R1,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Write_n_Updata_n
        MOVS     R0,#+10
        BL       Delay_ms
        ADDS     R4,R4,#+1
        B.N      ??test_ltc2620_2
??test_ltc2620_3:
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+3
        BL       Set_spi_cs_n
        MOVS     R0,#+10
        BL       Delay_ms
        MOVS     R0,#+0
        MOVS     R4,R0
??test_ltc2620_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??test_ltc2620_5
        LDR.N    R0,??DataTable3_5
        LDRH     R1,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Write_n_Updata_n
        MOVS     R0,#+10
        BL       Delay_ms
        ADDS     R4,R4,#+1
        B.N      ??test_ltc2620_4
??test_ltc2620_5:
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+4
        BL       Set_spi_cs_n
        MOVS     R0,#+10
        BL       Delay_ms
        MOVS     R0,#+0
        MOVS     R4,R0
??test_ltc2620_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??test_ltc2620_7
        LDR.N    R0,??DataTable3_5
        LDRH     R1,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Write_n_Updata_n
        MOVS     R0,#+10
        BL       Delay_ms
        ADDS     R4,R4,#+1
        B.N      ??test_ltc2620_6
??test_ltc2620_7:
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+1
        BL       Set_spi_cs_n
        MOVS     R0,#+0
        MOVS     R4,R0
??test_ltc2620_8:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??test_ltc2620_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Powerdown_n
        MOVS     R0,#+10
        BL       Delay_ms
        ADDS     R4,R4,#+1
        B.N      ??test_ltc2620_8
??test_ltc2620_9:
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+2
        BL       Set_spi_cs_n
        MOVS     R0,#+10
        BL       Delay_ms
        MOVS     R0,#+0
        MOVS     R4,R0
??test_ltc2620_10:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??test_ltc2620_11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Powerdown_n
        MOVS     R0,#+10
        BL       Delay_ms
        ADDS     R4,R4,#+1
        B.N      ??test_ltc2620_10
??test_ltc2620_11:
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+3
        BL       Set_spi_cs_n
        MOVS     R0,#+10
        BL       Delay_ms
        MOVS     R0,#+0
        MOVS     R4,R0
??test_ltc2620_12:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??test_ltc2620_13
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Powerdown_n
        MOVS     R0,#+10
        BL       Delay_ms
        ADDS     R4,R4,#+1
        B.N      ??test_ltc2620_12
??test_ltc2620_13:
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+4
        BL       Set_spi_cs_n
        MOVS     R0,#+10
        BL       Delay_ms
        MOVS     R0,#+0
        MOVS     R4,R0
??test_ltc2620_14:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??test_ltc2620_15
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Powerdown_n
        MOVS     R0,#+10
        BL       Delay_ms
        ADDS     R4,R4,#+1
        B.N      ??test_ltc2620_14
??test_ltc2620_15:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     ltc2620_au16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40010c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     ltc2620_all

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
//    32 bytes in section .bss
//     2 bytes in section .data
// 1 182 bytes in section .text
// 
// 1 182 bytes of CODE memory
//    34 bytes of DATA memory
//
//Errors: none
//Warnings: none
