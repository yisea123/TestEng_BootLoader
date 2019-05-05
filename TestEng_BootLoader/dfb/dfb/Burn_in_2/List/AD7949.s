///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:30
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\AD7949.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\AD7949.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\AD7949.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Choose_MUX_Channel
        EXTERN Delay_ms
        EXTERN Delay_us
        EXTERN Disable_cs_ad
        EXTERN Enable_cs_ad
        EXTERN GPIO_Init
        EXTERN GPIO_ReadInputDataBit

        PUBLIC AD7949_CLK_HIG
        PUBLIC AD7949_CLK_LOW
        PUBLIC AD7949_SDI_HIG
        PUBLIC AD7949_SDI_LOW
        PUBLIC AD7949_cmd_ch_ca
        PUBLIC AD7949_databuf_st
        PUBLIC AD7949_init
        PUBLIC AD7949_read_ISAMP_ch
        PUBLIC AD7949_read_MPD_ch
        PUBLIC AD7949_read_THERMO_ch
        PUBLIC AD7949_read_VSAMP_ch
        PUBLIC AD7949_read_all_data


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
AD7949_cmd_ch_ca:
        DATA
        DC16 57604, 24836, 58116, 25348, 58628, 25860, 59140, 26372, 59652
        DC16 26884, 60164, 27396, 60676, 27908, 61188, 28420

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
AD7949_databuf_st:
        DS8 196

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_init:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_all_data:
        PUSH     {R4,LR}
        BL       AD7949_Spi_Io_Init
        MOVS     R0,#+0
        MOVS     R4,R0
??AD7949_read_all_data_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+16
        BGE.N    ??AD7949_read_all_data_1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       Choose_MUX_Channel
        MOVS     R0,#+1
        BL       Delay_ms
        LDR.W    R0,??DataTable12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R1,R0,R4, LSL #+1
        MOVS     R0,#+0
        BL       AD7949_read_ISAMP
        LDR.W    R0,??DataTable12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R0,R4, LSL #+1
        ADDS     R1,R0,#+32
        MOVS     R0,#+1
        BL       AD7949_read_ISAMP
        LDR.W    R0,??DataTable12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R0,R4, LSL #+1
        ADDS     R1,R0,#+64
        MOVS     R0,#+2
        BL       AD7949_read_MPD
        LDR.W    R0,??DataTable12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R0,R4, LSL #+1
        ADDS     R1,R0,#+96
        MOVS     R0,#+3
        BL       AD7949_read_MPD
        LDR.W    R0,??DataTable12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R0,R4, LSL #+1
        ADDS     R1,R0,#+128
        MOVS     R0,#+4
        BL       AD7949_read_VSAMP
        LDR.W    R0,??DataTable12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R0,R4, LSL #+1
        ADDS     R1,R0,#+160
        MOVS     R0,#+5
        BL       AD7949_read_VSAMP
        ADDS     R4,R4,#+1
        B.N      ??AD7949_read_all_data_0
??AD7949_read_all_data_1:
        LDR.W    R1,??DataTable12_1
        MOVS     R0,#+6
        BL       AD7949_read_THERMO
        LDR.W    R1,??DataTable12_2
        MOVS     R0,#+7
        BL       AD7949_read_THERMO
        BL       AD7949_Spi_Io_DeInit
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_ISAMP_ch:
        MOVS     R2,R0
        MOVS     R3,#+0
        CMP      R1,#+0
        BNE.N    ??AD7949_read_ISAMP_ch_0
        MOVS     R0,#+0
        B.N      ??AD7949_read_ISAMP_ch_1
??AD7949_read_ISAMP_ch_0:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+32
        BLT.N    ??AD7949_read_ISAMP_ch_2
        MOVS     R0,#+0
        B.N      ??AD7949_read_ISAMP_ch_1
??AD7949_read_ISAMP_ch_2:
        LDR.W    R0,??DataTable12
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRH     R0,[R0, R2, LSL #+1]
        STRH     R0,[R1, #+0]
        MOVS     R0,#+1
        MOVS     R3,R0
        MOVS     R0,R3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AD7949_read_ISAMP_ch_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_MPD_ch:
        MOVS     R2,R0
        MOVS     R3,#+0
        CMP      R1,#+0
        BNE.N    ??AD7949_read_MPD_ch_0
        MOVS     R0,#+0
        B.N      ??AD7949_read_MPD_ch_1
??AD7949_read_MPD_ch_0:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+32
        BLT.N    ??AD7949_read_MPD_ch_2
        MOVS     R0,#+0
        B.N      ??AD7949_read_MPD_ch_1
??AD7949_read_MPD_ch_2:
        LDR.N    R0,??DataTable12
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R0,R0,R2, LSL #+1
        LDRH     R0,[R0, #+64]
        STRH     R0,[R1, #+0]
        MOVS     R0,#+1
        MOVS     R3,R0
        MOVS     R0,R3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AD7949_read_MPD_ch_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_VSAMP_ch:
        MOVS     R2,R0
        MOVS     R3,#+0
        CMP      R1,#+0
        BNE.N    ??AD7949_read_VSAMP_ch_0
        MOVS     R0,#+0
        B.N      ??AD7949_read_VSAMP_ch_1
??AD7949_read_VSAMP_ch_0:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+32
        BLT.N    ??AD7949_read_VSAMP_ch_2
        MOVS     R0,#+0
        B.N      ??AD7949_read_VSAMP_ch_1
??AD7949_read_VSAMP_ch_2:
        LDR.N    R0,??DataTable12
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R0,R0,R2, LSL #+1
        LDRH     R0,[R0, #+128]
        STRH     R0,[R1, #+0]
        MOVS     R0,#+1
        MOVS     R3,R0
        MOVS     R0,R3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AD7949_read_VSAMP_ch_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_THERMO_ch:
        MOVS     R2,R0
        MOVS     R0,#+0
        CMP      R1,#+0
        BNE.N    ??AD7949_read_THERMO_ch_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??AD7949_read_THERMO_ch_1
??AD7949_read_THERMO_ch_0:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BNE.N    ??AD7949_read_THERMO_ch_2
        LDR.N    R3,??DataTable12
        LDRH     R3,[R3, #+192]
        STRH     R3,[R1, #+0]
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??AD7949_read_THERMO_ch_3
??AD7949_read_THERMO_ch_2:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+1
        BNE.N    ??AD7949_read_THERMO_ch_3
        LDR.N    R3,??DataTable12
        LDRH     R3,[R3, #+194]
        STRH     R3,[R1, #+0]
        MOVS     R3,#+1
        MOVS     R0,R3
??AD7949_read_THERMO_ch_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AD7949_read_THERMO_ch_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_ISAMP:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        CMP      R5,#+0
        BNE.N    ??AD7949_read_ISAMP_0
        MOVS     R0,#+0
        B.N      ??AD7949_read_ISAMP_1
??AD7949_read_ISAMP_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BNE.N    ??AD7949_read_ISAMP_2
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??AD7949_read_ISAMP_3
??AD7949_read_ISAMP_2:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+1
        BNE.N    ??AD7949_read_ISAMP_3
        MOVS     R0,#+1
        MOVS     R7,R0
??AD7949_read_ISAMP_3:
        MOVS     R1,R5
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_read_data_chk
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AD7949_read_ISAMP_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_MPD:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        CMP      R5,#+0
        BNE.N    ??AD7949_read_MPD_0
        MOVS     R0,#+0
        B.N      ??AD7949_read_MPD_1
??AD7949_read_MPD_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+2
        BNE.N    ??AD7949_read_MPD_2
        MOVS     R0,#+2
        MOVS     R7,R0
        B.N      ??AD7949_read_MPD_3
??AD7949_read_MPD_2:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+3
        BNE.N    ??AD7949_read_MPD_3
        MOVS     R0,#+3
        MOVS     R7,R0
??AD7949_read_MPD_3:
        MOVS     R1,R5
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_read_data_chk
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AD7949_read_MPD_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_VSAMP:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        CMP      R5,#+0
        BNE.N    ??AD7949_read_VSAMP_0
        MOVS     R0,#+0
        B.N      ??AD7949_read_VSAMP_1
??AD7949_read_VSAMP_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+4
        BNE.N    ??AD7949_read_VSAMP_2
        MOVS     R0,#+4
        MOVS     R7,R0
        B.N      ??AD7949_read_VSAMP_3
??AD7949_read_VSAMP_2:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+5
        BNE.N    ??AD7949_read_VSAMP_3
        MOVS     R0,#+5
        MOVS     R7,R0
??AD7949_read_VSAMP_3:
        MOVS     R1,R5
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_read_data_chk
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AD7949_read_VSAMP_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_THERMO:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        CMP      R5,#+0
        BNE.N    ??AD7949_read_THERMO_0
        MOVS     R0,#+0
        B.N      ??AD7949_read_THERMO_1
??AD7949_read_THERMO_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+6
        BNE.N    ??AD7949_read_THERMO_2
        MOVS     R0,#+6
        MOVS     R7,R0
        B.N      ??AD7949_read_THERMO_3
??AD7949_read_THERMO_2:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+7
        BNE.N    ??AD7949_read_THERMO_3
        MOVS     R0,#+7
        MOVS     R7,R0
??AD7949_read_THERMO_3:
        MOVS     R1,R5
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_read_data_chk
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AD7949_read_THERMO_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_data_chk:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        CMP      R5,#+0
        BNE.N    ??AD7949_read_data_chk_0
        MOVS     R0,#+0
        B.N      ??AD7949_read_data_chk_1
??AD7949_read_data_chk_0:
        ADD      R1,SP,#+0
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_read_data
        MOVS     R6,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??AD7949_read_data_chk_2
        LDRH     R0,[SP, #+0]
        STRH     R0,[R5, #+0]
        MOVS     R0,#+1
        MOVS     R6,R0
        B.N      ??AD7949_read_data_chk_3
??AD7949_read_data_chk_2:
        MOVS     R0,#+0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+0
        MOVS     R6,R0
??AD7949_read_data_chk_3:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??AD7949_read_data_chk_1:
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_SDI_HIG:
        LDR.N    R0,??DataTable12_3  ;; 0x40010c10
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000
        LDR.N    R1,??DataTable12_3  ;; 0x40010c10
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_SDI_LOW:
        LDR.N    R0,??DataTable12_4  ;; 0x40010c14
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000
        LDR.N    R1,??DataTable12_4  ;; 0x40010c14
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_CLK_HIG:
        LDR.N    R0,??DataTable12_3  ;; 0x40010c10
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000
        LDR.N    R1,??DataTable12_3  ;; 0x40010c10
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_CLK_LOW:
        LDR.N    R0,??DataTable12_4  ;; 0x40010c14
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000
        LDR.N    R1,??DataTable12_4  ;; 0x40010c14
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_Spi_Io_Init:
        PUSH     {R7,LR}
        MOV      R0,#+16384
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+4
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable12_5  ;; 0x40010c00
        BL       GPIO_Init
        MOV      R0,#+40960
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable12_5  ;; 0x40010c00
        BL       GPIO_Init
        BL       AD7949_CLK_LOW
        BL       AD7949_SDI_LOW
        BL       Enable_cs_ad
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_Spi_Io_DeInit:
        PUSH     {R7,LR}
        MOV      R0,#+57344
        STRH     R0,[SP, #+0]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable12_5  ;; 0x40010c00
        BL       GPIO_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_Spi_Access:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R7,#+0
        MOVS     R0,#+0
        MOVS     R7,R0
??AD7949_Spi_Access_0:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+14
        BGE.N    ??AD7949_Spi_Access_1
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSLS     R0,R4,#+16
        BPL.N    ??AD7949_Spi_Access_2
        BL       AD7949_SDI_HIG
        B.N      ??AD7949_Spi_Access_3
??AD7949_Spi_Access_2:
        BL       AD7949_SDI_LOW
??AD7949_Spi_Access_3:
        MOVS     R0,#+1
        BL       Delay_us
        BL       AD7949_CLK_HIG
        MOVS     R0,#+1
        BL       Delay_us
        MOV      R1,#+16384
        LDR.N    R0,??DataTable12_5  ;; 0x40010c00
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+0
        BEQ.N    ??AD7949_Spi_Access_4
        ORRS     R6,R6,#0x1
??AD7949_Spi_Access_4:
        BL       AD7949_CLK_LOW
        MOVS     R0,#+1
        BL       Delay_us
        LSLS     R6,R6,#+1
        LSLS     R4,R4,#+1
        ADDS     R7,R7,#+1
        B.N      ??AD7949_Spi_Access_0
??AD7949_Spi_Access_1:
        STRH     R6,[R5, #+0]
        MOVS     R0,#+1
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AD7949_read_data:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        MOVS     R8,#+0
        BL       Enable_cs_ad
        MOVS     R0,#+1
        BL       Delay_us
        BL       Disable_cs_ad
        MOVS     R0,#+10
        BL       Delay_us
        BL       Enable_cs_ad
        MOVS     R0,#+1
        BL       Delay_us
        LDR.N    R0,??DataTable12_6
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LDRH     R0,[R0, R4, LSL #+2]
        MOVS     R6,R0
        ADD      R1,SP,#+0
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_Spi_Access
        BL       Disable_cs_ad
        MOVS     R0,#+10
        BL       Delay_us
        BL       Enable_cs_ad
        MOVS     R0,#+1
        BL       Delay_us
        LDR.N    R0,??DataTable12_6
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADDS     R0,R0,R4, LSL #+2
        LDRH     R0,[R0, #+2]
        MOVS     R6,R0
        ADD      R1,SP,#+0
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_Spi_Access
??AD7949_read_data_0:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+8
        BGE.N    ??AD7949_read_data_1
        BL       Disable_cs_ad
        MOVS     R0,#+10
        BL       Delay_us
        BL       Enable_cs_ad
        MOVS     R0,#+1
        BL       Delay_us
        ADD      R1,SP,#+0
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_Spi_Access
        LDRH     R0,[SP, #+0]
        ADDS     R8,R0,R8
        ADDS     R7,R7,#+1
        B.N      ??AD7949_read_data_0
??AD7949_read_data_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UDIV     R0,R8,R7
        STRH     R0,[R5, #+0]
        MOVS     R0,#+1
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     AD7949_databuf_st

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     AD7949_databuf_st+0xC0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     AD7949_databuf_st+0xC2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0x40010c10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     0x40010c14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0x40010c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     AD7949_cmd_ch_ca

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
//   196 bytes in section .bss
//    32 bytes in section .rodata
// 1 128 bytes in section .text
// 
// 1 128 bytes of CODE  memory
//    32 bytes of CONST memory
//   196 bytes of DATA  memory
//
//Errors: none
//Warnings: none
