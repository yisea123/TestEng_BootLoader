///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:30
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\AT24HC02C.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\AT24HC02C.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\AT24HC02C.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delay_ms
        EXTERN I2c_command_read
        EXTERN I2c_command_write

        PUBLIC AT24HC02C_dev_info_cast
        PUBLIC AT24HC02C_rd_n_bytes
        PUBLIC AT24HC02C_wr_n_bytes


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
AT24HC02C_dev_info_cast:
        DATA
        DC8 160, 0
        DC16 256, 8, 7
        DC32 40005400H

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AT24HC02C_drv_wr_n_bytes:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOV      R9,R1
        MOV      R11,R2
        MOVS     R5,R3
        MOVS     R7,#+1
        MOVS     R10,#+0
        LDR.N    R0,??DataTable1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R4,R0
        LDRH     R0,[R0, #+2]
        STRH     R0,[SP, #+12]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??AT24HC02C_drv_wr_n_bytes_0
        LDRH     R0,[SP, #+12]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R0,R9
        BCC.N    ??AT24HC02C_drv_wr_n_bytes_0
        LDRH     R0,[SP, #+12]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        ADDS     R1,R11,R9
        CMP      R0,R1
        BLT.N    ??AT24HC02C_drv_wr_n_bytes_0
        CMP      R5,#+0
        BNE.N    ??AT24HC02C_drv_wr_n_bytes_1
??AT24HC02C_drv_wr_n_bytes_0:
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??AT24HC02C_drv_wr_n_bytes_2
??AT24HC02C_drv_wr_n_bytes_1:
        LDR.N    R0,??DataTable1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R4,R0
        LDRH     R0,[R0, #+4]
        STRH     R0,[SP, #+8]
        LDR.N    R0,??DataTable1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R4,R0
        LDRH     R0,[R0, #+6]
        STRH     R0,[SP, #+6]
        LDR.N    R0,??DataTable1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R4,R0
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+4]
        LDR.N    R0,??DataTable1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R4,R0
        LDR      R0,[R0, #+8]
        STR      R0,[SP, #+16]
        LDRH     R0,[SP, #+6]
        ANDS     R0,R0,R9
        MOV      R8,R0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BEQ.N    ??AT24HC02C_drv_wr_n_bytes_3
        LDRH     R0,[SP, #+8]
        SUBS     R8,R0,R8
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        ADDS     R0,R10,R5
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+4]
        MOV      R2,R8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R9
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R0,[SP, #+16]
        BL       I2c_command_write
        MOVS     R7,R0
        MOVS     R0,#+4
        BL       Delay_ms
        ADDS     R9,R8,R9
        ADDS     R10,R8,R10
??AT24HC02C_drv_wr_n_bytes_3:
        SUBS     R11,R11,R8
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        LDRH     R0,[SP, #+8]
        SDIV     R0,R11,R0
        STRH     R0,[SP, #+14]
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        LDRH     R0,[SP, #+8]
        SDIV     R1,R11,R0
        MLS      R0,R0,R1,R11
        STRH     R0,[SP, #+10]
        MOVS     R0,#+0
        MOVS     R6,R0
??AT24HC02C_drv_wr_n_bytes_4:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRH     R1,[SP, #+14]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCS.N    ??AT24HC02C_drv_wr_n_bytes_5
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        ADDS     R0,R10,R5
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+4]
        LDRH     R2,[SP, #+6]
        MOV      R1,R9
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R0,[SP, #+16]
        BL       I2c_command_write
        ANDS     R0,R0,R7
        MOVS     R7,R0
        MOVS     R0,#+4
        BL       Delay_ms
        LDRH     R0,[SP, #+6]
        ADDS     R9,R0,R9
        LDRH     R0,[SP, #+6]
        ADDS     R10,R0,R10
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        ADDS     R0,R10,R5
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+4]
        MOVS     R2,#+1
        MOV      R1,R9
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R0,[SP, #+16]
        BL       I2c_command_write
        ANDS     R0,R0,R7
        MOVS     R7,R0
        MOVS     R0,#+4
        BL       Delay_ms
        ADDS     R10,R10,#+1
        ADDS     R9,R9,#+1
        ADDS     R6,R6,#+1
        B.N      ??AT24HC02C_drv_wr_n_bytes_4
??AT24HC02C_drv_wr_n_bytes_5:
        LDRH     R0,[SP, #+10]
        CMP      R0,#+0
        BEQ.N    ??AT24HC02C_drv_wr_n_bytes_2
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        ADDS     R0,R10,R5
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+4]
        LDRH     R2,[SP, #+10]
        MOV      R1,R9
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R0,[SP, #+16]
        BL       I2c_command_write
        ANDS     R0,R0,R7
        MOVS     R7,R0
        MOVS     R0,#+4
        BL       Delay_ms
??AT24HC02C_drv_wr_n_bytes_2:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AT24HC02C_drv_rd_n_bytes:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R8,#+1
        LDR.N    R0,??DataTable1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R4,R0
        LDRH     R0,[R0, #+2]
        MOV      R11,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??AT24HC02C_drv_rd_n_bytes_0
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R11,R5
        BCC.N    ??AT24HC02C_drv_rd_n_bytes_0
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,R5
        CMP      R11,R0
        BLT.N    ??AT24HC02C_drv_rd_n_bytes_0
        CMP      R7,#+0
        BNE.N    ??AT24HC02C_drv_rd_n_bytes_1
??AT24HC02C_drv_rd_n_bytes_0:
        MOVS     R0,#+0
        MOV      R8,R0
??AT24HC02C_drv_rd_n_bytes_1:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??AT24HC02C_drv_rd_n_bytes_2
        LDR.N    R0,??DataTable1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R4,R0
        LDRB     R0,[R0, #+0]
        MOV      R9,R0
        LDR.N    R0,??DataTable1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R4,R0
        LDRH     R0,[R0, #+2]
        MOV      R11,R0
        LDR.N    R0,??DataTable1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MLA      R0,R1,R4,R0
        LDR      R0,[R0, #+8]
        MOV      R10,R0
        STR      R7,[SP, #+0]
        MOV      R3,R9
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOV      R0,R10
        BL       I2c_command_read
        MOVS     R0,#+1
        MOV      R8,R0
??AT24HC02C_drv_rd_n_bytes_2:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     AT24HC02C_dev_info_cast

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AT24HC02C_wr_n_bytes:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R3,R7
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       AT24HC02C_drv_wr_n_bytes
        MOV      R8,R0
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AT24HC02C_rd_n_bytes:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R3,R7
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       AT24HC02C_drv_rd_n_bytes
        MOV      R8,R0
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return

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
//  12 bytes in section .rodata
// 670 bytes in section .text
// 
// 670 bytes of CODE  memory
//  12 bytes of CONST memory
//
//Errors: none
//Warnings: none
