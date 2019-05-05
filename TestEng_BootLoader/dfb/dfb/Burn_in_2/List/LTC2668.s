///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       24/Sep/2018  14:38:05
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\LTC2668.c
//    Command line =  
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\LTC2668.c -lcN
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\
//        -lb
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\ -o
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --fpu=None --dlib_config "E:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\DFB_inc\ -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\..\Libraries\CMSIS\
//        -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\..\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\ascii\
//        -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\include\
//        -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\modbus_port\
//        -I F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\rtu\
//        -I F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\tcp\
//        -On -I "E:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\LTC2668.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delay_ms
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN drv_spi_access_short

        PUBLIC LTC2668_Powerdown_all
        PUBLIC LTC2668_Powerdown_n
        PUBLIC LTC2668_Updata_all
        PUBLIC LTC2668_Updata_n
        PUBLIC LTC2668_Write_all
        PUBLIC LTC2668_Write_all_Updata_all
        PUBLIC LTC2668_Write_n
        PUBLIC LTC2668_Write_n_Updata_n
        PUBLIC drv_spi_cs
        PUBLIC ltc2628_init
        PUBLIC ltc2668_au16


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
ltc2668_au16:
        DS8 64

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ltc2628_init:
        PUSH     {R7,LR}
        BL       LTC2668_Powerdown_all
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
drv_spi_cs:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??drv_spi_cs_0
        MOV      R1,#+256
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_SetBits
        MOV      R1,#+512
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_SetBits
        MOV      R1,#+1024
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_SetBits
        MOV      R1,#+4096
        LDR.N    R0,??DataTable2_1  ;; 0x40010c00
        BL       GPIO_SetBits
        MOV      R1,#+4096
        LDR.N    R0,??DataTable2_1  ;; 0x40010c00
        BL       GPIO_ResetBits
        B.N      ??drv_spi_cs_1
??drv_spi_cs_0:
        MOV      R1,#+256
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_SetBits
        MOV      R1,#+512
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_SetBits
        MOV      R1,#+1024
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_SetBits
        MOV      R1,#+4096
        LDR.N    R0,??DataTable2_1  ;; 0x40010c00
        BL       GPIO_SetBits
??drv_spi_cs_1:
        MOVS     R0,#+10
        BL       Delay_ms
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Spi_command_write:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,#+0
        CMP      R5,#+0
        BEQ.N    ??LTC2668_Spi_command_write_0
        CMP      R6,#+0
        BNE.N    ??LTC2668_Spi_command_write_1
??LTC2668_Spi_command_write_0:
        MOVS     R0,#+0
        B.N      ??LTC2668_Spi_command_write_2
??LTC2668_Spi_command_write_1:
        MOVS     R0,#+0
        BL       drv_spi_cs
        MOVS     R2,R6
        LDRH     R1,[R5, #+0]
        LDR.N    R0,??DataTable2_2  ;; 0x40013000
        BL       drv_spi_access_short
        MOVS     R7,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??LTC2668_Spi_command_write_3
        ADDS     R2,R6,#+2
        LDRH     R1,[R5, #+2]
        LDR.N    R0,??DataTable2_2  ;; 0x40013000
        BL       drv_spi_access_short
        MOVS     R7,R0
??LTC2668_Spi_command_write_3:
        MOVS     R0,#+255
        BL       drv_spi_cs
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2668_Spi_command_write_2:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Write_Register:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+16
        BLT.N    ??LTC2668_Write_Register_0
        MOVS     R0,#+0
        B.N      ??LTC2668_Write_Register_1
??LTC2668_Write_Register_0:
        LDR.N    R0,??DataTable2_3
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
        BNE.N    ??LTC2668_Write_Register_2
        MOVS     R0,#+0
        B.N      ??LTC2668_Write_Register_1
??LTC2668_Write_Register_2:
        MOV      R2,R8
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable2_2  ;; 0x40013000
        BL       LTC2668_Spi_command_write
        MOVS     R7,R0
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2668_Write_Register_1:
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40010c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     ltc2668_au16

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Write_n:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+16
        BLT.N    ??LTC2668_Write_n_0
        MOVS     R0,#+0
        B.N      ??LTC2668_Write_n_1
??LTC2668_Write_n_0:
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       LTC2668_Write_Register
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2668_Write_n_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Updata_n:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+16
        BLT.N    ??LTC2668_Updata_n_0
        MOVS     R0,#+0
        B.N      ??LTC2668_Updata_n_1
??LTC2668_Updata_n_0:
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+16
        BL       LTC2668_Write_Register
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2668_Updata_n_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Write_n_Updata_n:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+16
        BLT.N    ??LTC2668_Write_n_Updata_n_0
        MOVS     R0,#+0
        B.N      ??LTC2668_Write_n_Updata_n_1
??LTC2668_Write_n_Updata_n_0:
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+48
        BL       LTC2668_Write_Register
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2668_Write_n_Updata_n_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Write_all:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+15
        MOVS     R0,#+128
        BL       LTC2668_Write_Register
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Updata_all:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+15
        MOVS     R0,#+144
        BL       LTC2668_Write_Register
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Write_all_Updata_all:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,#+15
        MOVS     R0,#+160
        BL       LTC2668_Write_Register
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Powerdown_n:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+16
        BLT.N    ??LTC2668_Powerdown_n_0
        MOVS     R0,#+0
        B.N      ??LTC2668_Powerdown_n_1
??LTC2668_Powerdown_n_0:
        MOVW     R2,#+65535
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+64
        BL       LTC2668_Write_Register
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2668_Powerdown_n_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2668_Powerdown_all:
        PUSH     {R4,LR}
        MOVS     R4,#+0
        MOVW     R2,#+65535
        MOVS     R1,#+15
        MOVS     R0,#+80
        BL       LTC2668_Write_Register
        MOVS     R4,R0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

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
//  64 bytes in section .bss
// 548 bytes in section .text
// 
// 548 bytes of CODE memory
//  64 bytes of DATA memory
//
//Errors: none
//Warnings: none
