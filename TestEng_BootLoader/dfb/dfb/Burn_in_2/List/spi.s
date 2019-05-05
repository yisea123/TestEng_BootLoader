///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:37
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\spi.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\spi.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\spi.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1
        #define SHF_WRITE 0x1
        #define SHF_EXECINSTR 0x4

        PUBLIC drv_spi1_access_short
        PUBLIC drv_spi2_access_short
        PUBLIC drv_spi_access_short


        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
drv_spi_access_short:
        PUSH     {R4-R6}
        MOVS     R3,R0
        MOVS     R4,#+0
        MOVS     R0,#+1
        STRH     R1,[R3, #+12]
??drv_spi_access_short_0:
        LDRH     R6,[R3, #+8]
        MOVS     R5,R6
        ANDS     R6,R5,#0x82
        CMP      R6,#+2
        BEQ.N    ??drv_spi_access_short_1
??drv_spi_access_short_2:
        MOVS     R6,R4
        ADDS     R4,R6,#+1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+1000
        BLE.N    ??drv_spi_access_short_0
        MOVS     R6,#+0
        MOVS     R0,R6
??drv_spi_access_short_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??drv_spi_access_short_3
        LDRH     R6,[R3, #+8]
        MOVS     R5,R6
??drv_spi_access_short_4:
        LSLS     R6,R5,#+31
        BPL.N    ??drv_spi_access_short_4
        LDRH     R6,[R3, #+12]
        STRH     R6,[R2, #+0]
??drv_spi_access_short_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
drv_spi2_access_short:
        PUSH     {R4,R5}
        MOVS     R2,R0
        MOVS     R4,#+0
        MOVS     R0,#+1
        LDR.N    R5,??DataTable1  ;; 0x4000380c
        STRH     R2,[R5, #+0]
??drv_spi2_access_short_0:
        LDR.N    R5,??DataTable1_1  ;; 0x40003808
        LDRH     R5,[R5, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R3,R5
        ANDS     R5,R3,#0x82
        CMP      R5,#+2
        BEQ.N    ??drv_spi2_access_short_1
??drv_spi2_access_short_2:
        MOVS     R5,R4
        ADDS     R4,R5,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+1000
        BLE.N    ??drv_spi2_access_short_0
        MOVS     R5,#+0
        MOVS     R0,R5
??drv_spi2_access_short_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??drv_spi2_access_short_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??drv_spi2_access_short_4
??drv_spi2_access_short_3:
        MOVS     R5,#+0
        MOVS     R4,R5
??drv_spi2_access_short_5:
        LDR.N    R5,??DataTable1_1  ;; 0x40003808
        LDRH     R5,[R5, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R3,R5
        LSLS     R5,R3,#+31
        BPL.N    ??drv_spi2_access_short_6
        LDR.N    R5,??DataTable1  ;; 0x4000380c
        LDRH     R5,[R5, #+0]
        STRH     R5,[R1, #+0]
        B.N      ??drv_spi2_access_short_7
??drv_spi2_access_short_6:
        MOVS     R5,R4
        ADDS     R4,R5,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+1000
        BLE.N    ??drv_spi2_access_short_5
        MOVS     R5,#+0
        STRH     R5,[R1, #+0]
        MOVS     R5,#+0
        MOVS     R0,R5
??drv_spi2_access_short_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??drv_spi2_access_short_4:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
drv_spi1_access_short:
        PUSH     {R4,R5}
        MOVS     R2,R0
        MOVS     R4,#+0
        MOVS     R0,#+1
        LDR.N    R5,??DataTable1_2  ;; 0x4001300c
        STRH     R2,[R5, #+0]
??drv_spi1_access_short_0:
        LDR.N    R5,??DataTable1_3  ;; 0x40013008
        LDRH     R5,[R5, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R3,R5
        ANDS     R5,R3,#0x82
        CMP      R5,#+2
        BEQ.N    ??drv_spi1_access_short_1
??drv_spi1_access_short_2:
        MOVS     R5,R4
        ADDS     R4,R5,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+1000
        BLE.N    ??drv_spi1_access_short_0
        MOVS     R5,#+0
        MOVS     R0,R5
??drv_spi1_access_short_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??drv_spi1_access_short_3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??drv_spi1_access_short_4
??drv_spi1_access_short_3:
        MOVS     R5,#+0
        MOVS     R4,R5
??drv_spi1_access_short_5:
        LDR.N    R5,??DataTable1_3  ;; 0x40013008
        LDRH     R5,[R5, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R3,R5
        LSLS     R5,R3,#+31
        BPL.N    ??drv_spi1_access_short_6
        LDR.N    R5,??DataTable1_2  ;; 0x4001300c
        LDRH     R5,[R5, #+0]
        STRH     R5,[R1, #+0]
        B.N      ??drv_spi1_access_short_7
??drv_spi1_access_short_6:
        MOVS     R5,R4
        ADDS     R4,R5,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+1000
        BLE.N    ??drv_spi1_access_short_5
        MOVS     R5,#+0
        STRH     R5,[R1, #+0]
        MOVS     R5,#+0
        MOVS     R0,R5
??drv_spi1_access_short_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??drv_spi1_access_short_4:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE
        DATA
??DataTable1:
        DC32     0x4000380c

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE
        DATA
??DataTable1_1:
        DC32     0x40003808

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE
        DATA
??DataTable1_2:
        DC32     0x4001300c

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE
        DATA
??DataTable1_3:
        DC32     0x40013008

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
// 286 bytes in section .textrw
// 
// 286 bytes of CODE memory
//
//Errors: none
//Warnings: none
