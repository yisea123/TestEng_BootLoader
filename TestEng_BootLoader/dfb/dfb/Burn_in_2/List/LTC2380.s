///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       25/Sep/2018  21:20:24
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\LTC2380.c
//    Command line =  
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\LTC2380.c -lcN
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
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\LTC2380.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delay_ms
        EXTERN Delay_us
        EXTERN drv_spi_access_short

        PUBLIC LTC2380_init
        PUBLIC LTC2380_read_ISAMP_ch
        PUBLIC LTC2380_read_VSAMP_ch


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_init:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LTC2380_select_SDI
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       LTC2380_select_SDI
        BL       LTC2380_ISAMP_dis
        BL       LTC2380_VSAMP_dis
        BL       LTC2380_ISAMP_ena
        BL       LTC2380_VSAMP_ena
        MOVS     R0,#+0
        BL       LTC2380_choose_mux
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_read_ISAMP_ch:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        CMP      R5,#+0
        BNE.N    ??LTC2380_read_ISAMP_ch_0
        MOVS     R0,#+0
        B.N      ??LTC2380_read_ISAMP_ch_1
??LTC2380_read_ISAMP_ch_0:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2380_choose_mux
        MOVS     R0,R5
        BL       LTC2380_read_ISAMP
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2380_read_ISAMP_ch_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_read_VSAMP_ch:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        CMP      R5,#+0
        BNE.N    ??LTC2380_read_VSAMP_ch_0
        MOVS     R0,#+0
        B.N      ??LTC2380_read_VSAMP_ch_1
??LTC2380_read_VSAMP_ch_0:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2380_choose_mux
        MOVS     R0,R5
        BL       LTC2380_read_VSAMP
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2380_read_VSAMP_ch_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_read_ISAMP:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        CMP      R4,#+0
        BNE.N    ??LTC2380_read_ISAMP_0
        MOVS     R0,#+0
        B.N      ??LTC2380_read_ISAMP_1
??LTC2380_read_ISAMP_0:
        MOVS     R1,R4
        MOVS     R0,#+0
        BL       LTC2380_read_data_chk
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2380_read_ISAMP_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_read_VSAMP:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        CMP      R4,#+0
        BNE.N    ??LTC2380_read_VSAMP_0
        MOVS     R0,#+0
        B.N      ??LTC2380_read_VSAMP_1
??LTC2380_read_VSAMP_0:
        MOVS     R1,R4
        MOVS     R0,#+1
        BL       LTC2380_read_data_chk
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2380_read_VSAMP_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_ISAMP_ena:
        LDR.N    R0,??DataTable8  ;; 0x40011010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable8  ;; 0x40011010
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_ISAMP_dis:
        LDR.N    R0,??DataTable8_1  ;; 0x40011014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable8_1  ;; 0x40011014
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_VSAMP_ena:
        LDR.N    R0,??DataTable8  ;; 0x40011010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable8  ;; 0x40011010
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_VSAMP_dis:
        LDR.N    R0,??DataTable8_1  ;; 0x40011014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable8_1  ;; 0x40011014
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_choose_mux:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+16
        BCC.N    ??LTC2380_choose_mux_0
        MOVS     R0,#+0
        MOVS     R4,R0
??LTC2380_choose_mux_0:
        LDR.N    R0,??DataTable8_1  ;; 0x40011014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF
        LDR.N    R1,??DataTable8_1  ;; 0x40011014
        STR      R0,[R1, #+0]
        ANDS     R4,R4,#0xF
        LDR.N    R0,??DataTable8  ;; 0x40011010
        LDR      R0,[R0, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ORRS     R0,R4,R0
        LDR.N    R1,??DataTable8  ;; 0x40011010
        STR      R0,[R1, #+0]
        MOVS     R0,#+10
        BL       Delay_ms
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_start_CNV:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??LTC2380_start_CNV_0
        LDR.N    R0,??DataTable8_2  ;; 0x40010814
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable8_2  ;; 0x40010814
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        BL       Delay_us
        LDR.N    R0,??DataTable8_3  ;; 0x40010810
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable8_3  ;; 0x40010810
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        BL       Delay_us
        LDR.N    R0,??DataTable8_2  ;; 0x40010814
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable8_2  ;; 0x40010814
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        BL       Delay_us
        B.N      ??LTC2380_start_CNV_1
??LTC2380_start_CNV_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??LTC2380_start_CNV_1
        LDR.N    R0,??DataTable8_2  ;; 0x40010814
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable8_2  ;; 0x40010814
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        BL       Delay_us
        LDR.N    R0,??DataTable8_3  ;; 0x40010810
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable8_3  ;; 0x40010810
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        BL       Delay_us
        LDR.N    R0,??DataTable8_2  ;; 0x40010814
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable8_2  ;; 0x40010814
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        BL       Delay_us
??LTC2380_start_CNV_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_select_SDI:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??LTC2380_select_SDI_0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??LTC2380_select_SDI_1
        LDR.N    R2,??DataTable8  ;; 0x40011010
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x40
        LDR.N    R3,??DataTable8  ;; 0x40011010
        STR      R2,[R3, #+0]
        B.N      ??LTC2380_select_SDI_2
??LTC2380_select_SDI_1:
        LDR.N    R2,??DataTable8_1  ;; 0x40011014
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x40
        LDR.N    R3,??DataTable8_1  ;; 0x40011014
        STR      R2,[R3, #+0]
        B.N      ??LTC2380_select_SDI_2
??LTC2380_select_SDI_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??LTC2380_select_SDI_2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??LTC2380_select_SDI_3
        LDR.N    R2,??DataTable8  ;; 0x40011010
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x80
        LDR.N    R3,??DataTable8  ;; 0x40011010
        STR      R2,[R3, #+0]
        B.N      ??LTC2380_select_SDI_2
??LTC2380_select_SDI_3:
        LDR.N    R2,??DataTable8_1  ;; 0x40011014
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x80
        LDR.N    R3,??DataTable8_1  ;; 0x40011014
        STR      R2,[R3, #+0]
??LTC2380_select_SDI_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_wait_BUSY:
        MOV      R1,#+1000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??LTC2380_wait_BUSY_0
??LTC2380_wait_BUSY_1:
        LDR.N    R2,??DataTable8_4  ;; 0x40010c08
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+22
        BPL.N    ??LTC2380_wait_BUSY_2
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??LTC2380_wait_BUSY_2
        SUBS     R1,R1,#+1
        B.N      ??LTC2380_wait_BUSY_1
??LTC2380_wait_BUSY_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??LTC2380_wait_BUSY_2
??LTC2380_wait_BUSY_3:
        LDR.N    R2,??DataTable8_4  ;; 0x40010c08
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+23
        BPL.N    ??LTC2380_wait_BUSY_2
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??LTC2380_wait_BUSY_2
        SUBS     R1,R1,#+1
        B.N      ??LTC2380_wait_BUSY_3
??LTC2380_wait_BUSY_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_read_SDO:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        CMP      R4,#+0
        BNE.N    ??LTC2380_read_SDO_0
        MOVS     R0,#+0
        B.N      ??LTC2380_read_SDO_1
??LTC2380_read_SDO_0:
        MOVS     R2,R4
        MOVS     R1,#+0
        LDR.N    R0,??DataTable8_5  ;; 0x40013000
        BL       drv_spi_access_short
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2380_read_SDO_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x40011010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x40011014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x40010814

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x40010810

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x40010c08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_read_data:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        CMP      R5,#+0
        BNE.N    ??LTC2380_read_data_0
        MOVS     R0,#+0
        B.N      ??LTC2380_read_data_1
??LTC2380_read_data_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LTC2380_start_CNV
        MOVS     R1,#+0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LTC2380_select_SDI
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LTC2380_wait_BUSY
        MOVS     R0,R5
        BL       LTC2380_read_SDO
        MOVS     R6,R0
        MOVS     R1,#+1
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LTC2380_select_SDI
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2380_read_data_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
LTC2380_read_data_chk:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+2]
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        CMP      R5,#+0
        BNE.N    ??LTC2380_read_data_chk_0
        MOVS     R0,#+0
        B.N      ??LTC2380_read_data_chk_1
??LTC2380_read_data_chk_0:
        ADD      R1,SP,#+2
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LTC2380_read_data
        MOVS     R6,R0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??LTC2380_read_data_chk_2
        ADD      R1,SP,#+0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LTC2380_read_data
        MOVS     R6,R0
        LDRH     R0,[SP, #+2]
        ANDS     R0,R0,#0xFF00
        LDRH     R1,[SP, #+0]
        ANDS     R1,R1,#0xFF00
        CMP      R0,R1
        BNE.N    ??LTC2380_read_data_chk_3
        LDRH     R0,[SP, #+2]
        LDRH     R1,[SP, #+0]
        ADDS     R0,R1,R0
        LSRS     R0,R0,#+1
        STRH     R0,[R5, #+0]
        MOVS     R0,#+1
        MOVS     R6,R0
        B.N      ??LTC2380_read_data_chk_4
??LTC2380_read_data_chk_3:
        MOVS     R0,#+0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??LTC2380_read_data_chk_4
??LTC2380_read_data_chk_2:
        MOVS     R0,#+0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+0
        MOVS     R6,R0
??LTC2380_read_data_chk_4:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??LTC2380_read_data_chk_1:
        POP      {R1,R2,R4-R6,PC}  ;; return

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
// 794 bytes in section .text
// 
// 794 bytes of CODE memory
//
//Errors: none
//Warnings: none
