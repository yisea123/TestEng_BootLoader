///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:31
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\i2c.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\i2c.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\i2c.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1
        #define SHF_WRITE 0x1
        #define SHF_EXECINSTR 0x4

        PUBLIC I2c_command_read
        PUBLIC I2c_command_write
        PUBLIC drv_i2c_master_recv_with_stop
        PUBLIC drv_i2c_master_send_data
        PUBLIC drv_i2c_master_start
        PUBLIC drv_i2c_master_stop
        PUBLIC send_command
        PUBLIC send_slaveaddress


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2c_command_write:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+40]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        MOVS     R0,R4
        BL       drv_i2c_master_start
        ANDS     R7,R7,#0xFE
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       send_slaveaddress
        MOV      R9,R0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+1
        BNE.N    ??I2c_command_write_0
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       send_command
        MOV      R9,R0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+1
        BNE.N    ??I2c_command_write_1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??I2c_command_write_2
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R8
        MOVS     R0,R4
        BL       drv_i2c_master_send_data
        MOV      R9,R0
        MOVS     R0,R4
        BL       drv_i2c_master_stop
        B.N      ??I2c_command_write_2
??I2c_command_write_1:
        MOVS     R0,R4
        BL       drv_i2c_master_stop
        B.N      ??I2c_command_write_2
??I2c_command_write_0:
        MOVS     R0,R4
        BL       drv_i2c_master_stop
??I2c_command_write_2:
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1-R9,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2c_command_read:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+40]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
        MOVS     R9,#+0
        MOVS     R0,R4
        BL       drv_i2c_master_start
        ANDS     R7,R7,#0xFE
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       send_slaveaddress
        MOV      R9,R0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+1
        BNE.N    ??I2c_command_read_0
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       send_command
        MOV      R9,R0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+1
        BNE.N    ??I2c_command_read_1
        MOVS     R0,R4
        BL       drv_i2c_master_start
        MOVS     R3,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOV      R2,R8
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        BL       drv_i2c_master_recv_with_stop
        MOV      R9,R0
        B.N      ??I2c_command_read_2
??I2c_command_read_1:
        MOVS     R0,R4
        BL       drv_i2c_master_stop
        B.N      ??I2c_command_read_2
??I2c_command_read_0:
        MOVS     R0,R4
        BL       drv_i2c_master_stop
??I2c_command_read_2:
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1-R9,PC}       ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
drv_i2c_master_start:
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x100
        STRH     R2,[R0, #+0]
        MOVW     R2,#+65535
        MOVS     R1,R2
??drv_i2c_master_start_0:
        LDRH     R2,[R0, #+20]
        LSLS     R2,R2,#+31
        BMI.N    ??drv_i2c_master_start_1
        CMP      R1,#+0
        BEQ.N    ??drv_i2c_master_start_1
        SUBS     R1,R1,#+1
        B.N      ??drv_i2c_master_start_0
??drv_i2c_master_start_1:
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
drv_i2c_master_stop:
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x200
        STRH     R2,[R0, #+0]
        MOVW     R2,#+65535
        MOVS     R1,R2
??drv_i2c_master_stop_0:
        LDRH     R2,[R0, #+0]
        LSLS     R2,R2,#+22
        BPL.N    ??drv_i2c_master_stop_1
        CMP      R1,#+0
        BEQ.N    ??drv_i2c_master_stop_1
        SUBS     R1,R1,#+1
        B.N      ??drv_i2c_master_stop_0
??drv_i2c_master_stop_1:
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
send_slaveaddress:
        SUB      SP,SP,#+4
        MOVS     R2,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STRH     R1,[R2, #+16]
        MOVW     R0,#+65535
        MOVS     R3,R0
??send_slaveaddress_0:
        LDRH     R0,[R2, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??send_slaveaddress_1
        CMP      R3,#+0
        BEQ.N    ??send_slaveaddress_1
        LDRH     R0,[R2, #+20]
        LSLS     R0,R0,#+21
        BPL.N    ??send_slaveaddress_2
        MOVS     R0,#+0
        STRH     R0,[R2, #+20]
        MOVS     R0,#+0
        MOVS     R3,R0
        B.N      ??send_slaveaddress_0
??send_slaveaddress_2:
        SUBS     R3,R3,#+1
        B.N      ??send_slaveaddress_0
??send_slaveaddress_1:
        LDRH     R0,[R2, #+24]
        STR      R0,[SP, #+0]
        CMP      R3,#+0
        BNE.N    ??send_slaveaddress_3
        MOVS     R0,#+0
        B.N      ??send_slaveaddress_4
??send_slaveaddress_3:
        MOVS     R0,#+1
??send_slaveaddress_4:
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
send_command:
        MOVS     R2,R0
        MOVS     R3,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STRH     R1,[R2, #+16]
        MOVW     R0,#+65535
        MOVS     R3,R0
??send_command_0:
        LDRH     R0,[R2, #+20]
        LSLS     R0,R0,#+29
        BMI.N    ??send_command_1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+0
        BEQ.N    ??send_command_1
        LDRH     R0,[R2, #+20]
        LSLS     R0,R0,#+21
        BPL.N    ??send_command_2
        MOVS     R0,#+0
        STRH     R0,[R2, #+20]
        MOVS     R0,#+0
        MOVS     R3,R0
        B.N      ??send_command_0
??send_command_2:
        SUBS     R3,R3,#+1
        B.N      ??send_command_0
??send_command_1:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+0
        BNE.N    ??send_command_3
        MOVS     R0,#+0
        B.N      ??send_command_4
??send_command_3:
        MOVS     R0,#+1
??send_command_4:
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
drv_i2c_master_send_data:
        PUSH     {R4}
        MOVS     R3,R0
??drv_i2c_master_send_data_0:
        MOVS     R0,R2
        SUBS     R2,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??drv_i2c_master_send_data_1
        LDRB     R0,[R1, #+0]
        STRH     R0,[R3, #+16]
        ADDS     R1,R1,#+1
        MOVW     R0,#+65535
        MOVS     R4,R0
??drv_i2c_master_send_data_2:
        LDRH     R0,[R3, #+20]
        LSLS     R0,R0,#+29
        BMI.N    ??drv_i2c_master_send_data_3
        CMP      R4,#+0
        BEQ.N    ??drv_i2c_master_send_data_3
        LDRH     R0,[R3, #+20]
        LSLS     R0,R0,#+21
        BPL.N    ??drv_i2c_master_send_data_4
        MOVS     R0,#+0
        STRH     R0,[R3, #+20]
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??drv_i2c_master_send_data_2
??drv_i2c_master_send_data_4:
        SUBS     R4,R4,#+1
        B.N      ??drv_i2c_master_send_data_2
??drv_i2c_master_send_data_3:
        CMP      R4,#+0
        BNE.N    ??drv_i2c_master_send_data_0
        MOVS     R0,#+0
        B.N      ??drv_i2c_master_send_data_5
??drv_i2c_master_send_data_1:
        MOVS     R0,#+1
??drv_i2c_master_send_data_5:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
drv_i2c_master_recv_with_stop:
        PUSH     {R3-R7}
        MOVS     R4,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        MOVS     R5,R0
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+1
        BNE.N    ??drv_i2c_master_recv_with_stop_0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R1,#0x1
        STRH     R0,[R4, #+16]
        MOVW     R0,#+65535
        MOVS     R6,R0
??drv_i2c_master_recv_with_stop_1:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??drv_i2c_master_recv_with_stop_2
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_2
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+21
        BPL.N    ??drv_i2c_master_recv_with_stop_3
        MOVS     R0,#+0
        STRH     R0,[R4, #+20]
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??drv_i2c_master_recv_with_stop_1
??drv_i2c_master_recv_with_stop_3:
        SUBS     R6,R6,#+1
        B.N      ??drv_i2c_master_recv_with_stop_1
??drv_i2c_master_recv_with_stop_2:
        LDRH     R0,[R4, #+0]
        MOVW     R12,#+64511
        ANDS     R0,R12,R0
        STRH     R0,[R4, #+0]
        LDRH     R0,[R4, #+24]
        STR      R0,[SP, #+0]
        CMP      R6,#+0
        BNE.N    ??drv_i2c_master_recv_with_stop_4
        MOVS     R0,#+0
        B.N      ??drv_i2c_master_recv_with_stop_5
??drv_i2c_master_recv_with_stop_4:
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x200
        STRH     R0,[R4, #+0]
        MOVW     R0,#+65535
        MOVS     R6,R0
        ADDS     R5,R5,#+1
??drv_i2c_master_recv_with_stop_6:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+25
        BMI.N    ??drv_i2c_master_recv_with_stop_7
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_7
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+21
        BPL.N    ??drv_i2c_master_recv_with_stop_8
        MOVS     R0,#+0
        STRH     R0,[R4, #+20]
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??drv_i2c_master_recv_with_stop_6
??drv_i2c_master_recv_with_stop_8:
        SUBS     R6,R6,#+1
        B.N      ??drv_i2c_master_recv_with_stop_6
??drv_i2c_master_recv_with_stop_7:
        LDRH     R0,[R4, #+16]
        STRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
??drv_i2c_master_recv_with_stop_9:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??drv_i2c_master_recv_with_stop_9
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
        B.N      ??drv_i2c_master_recv_with_stop_10
??drv_i2c_master_recv_with_stop_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+2
        BNE.N    ??drv_i2c_master_recv_with_stop_11
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x800
        STRH     R0,[R4, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R1,#0x1
        STRH     R0,[R4, #+16]
        MOVW     R0,#+65535
        MOVS     R6,R0
??drv_i2c_master_recv_with_stop_12:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??drv_i2c_master_recv_with_stop_13
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_13
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+21
        BPL.N    ??drv_i2c_master_recv_with_stop_14
        MOVS     R0,#+0
        STRH     R0,[R4, #+20]
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??drv_i2c_master_recv_with_stop_12
??drv_i2c_master_recv_with_stop_14:
        SUBS     R6,R6,#+1
        B.N      ??drv_i2c_master_recv_with_stop_12
??drv_i2c_master_recv_with_stop_13:
        CPSID    I
        LDRH     R0,[R4, #+24]
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+0]
        MOVW     R12,#+64511
        ANDS     R0,R12,R0
        STRH     R0,[R4, #+0]
        CPSIE    I
        CMP      R6,#+0
        BNE.N    ??drv_i2c_master_recv_with_stop_15
        MOVS     R0,#+0
        B.N      ??drv_i2c_master_recv_with_stop_5
??drv_i2c_master_recv_with_stop_15:
        ADDS     R5,R5,#+2
        MOVW     R0,#+65535
        MOVS     R6,R0
??drv_i2c_master_recv_with_stop_16:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+29
        BMI.N    ??drv_i2c_master_recv_with_stop_17
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_17
        SUBS     R6,R6,#+1
        B.N      ??drv_i2c_master_recv_with_stop_16
??drv_i2c_master_recv_with_stop_17:
        LDRH     R0,[R4, #+16]
        STRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRH     R0,[R4, #+16]
        STRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x200
        STRH     R0,[R4, #+0]
        MOVW     R0,#+65535
        MOVS     R6,R0
??drv_i2c_master_recv_with_stop_18:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BPL.N    ??drv_i2c_master_recv_with_stop_19
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_19
        SUBS     R6,R6,#+1
        B.N      ??drv_i2c_master_recv_with_stop_18
??drv_i2c_master_recv_with_stop_19:
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
        LDRH     R0,[R4, #+0]
        MOVW     R12,#+63487
        ANDS     R0,R12,R0
        STRH     R0,[R4, #+0]
        B.N      ??drv_i2c_master_recv_with_stop_10
??drv_i2c_master_recv_with_stop_11:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R1,#0x1
        STRH     R0,[R4, #+16]
        MOVW     R0,#+65535
        MOVS     R6,R0
??drv_i2c_master_recv_with_stop_20:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+30
        BMI.N    ??drv_i2c_master_recv_with_stop_21
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_21
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+21
        BPL.N    ??drv_i2c_master_recv_with_stop_22
        MOVS     R0,#+0
        STRH     R0,[R4, #+20]
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??drv_i2c_master_recv_with_stop_20
??drv_i2c_master_recv_with_stop_22:
        SUBS     R6,R6,#+1
        B.N      ??drv_i2c_master_recv_with_stop_20
??drv_i2c_master_recv_with_stop_21:
        LDRH     R0,[R4, #+24]
        MOVS     R7,R0
        CMP      R6,#+0
        BNE.N    ??drv_i2c_master_recv_with_stop_23
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R6,R7
        MOVS     R0,#+0
        B.N      ??drv_i2c_master_recv_with_stop_5
??drv_i2c_master_recv_with_stop_23:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_24
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+3
        BEQ.N    ??drv_i2c_master_recv_with_stop_25
        MOVW     R0,#+65535
        MOVS     R6,R0
??drv_i2c_master_recv_with_stop_26:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+29
        BMI.N    ??drv_i2c_master_recv_with_stop_27
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_27
        SUBS     R6,R6,#+1
        B.N      ??drv_i2c_master_recv_with_stop_26
??drv_i2c_master_recv_with_stop_27:
        CMP      R6,#+0
        BNE.N    ??drv_i2c_master_recv_with_stop_28
        MOVS     R0,#+0
        MOVS     R3,R0
        B.N      ??drv_i2c_master_recv_with_stop_24
??drv_i2c_master_recv_with_stop_28:
        ADDS     R5,R5,#+1
        LDRH     R0,[R4, #+16]
        STRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
        SUBS     R3,R3,#+1
??drv_i2c_master_recv_with_stop_25:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+3
        BNE.N    ??drv_i2c_master_recv_with_stop_23
        MOVW     R0,#+65535
        MOVS     R6,R0
??drv_i2c_master_recv_with_stop_29:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+29
        BMI.N    ??drv_i2c_master_recv_with_stop_30
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_30
        SUBS     R6,R6,#+1
        B.N      ??drv_i2c_master_recv_with_stop_29
??drv_i2c_master_recv_with_stop_30:
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_31
        LDRH     R0,[R4, #+0]
        MOVW     R12,#+64511
        ANDS     R0,R12,R0
        STRH     R0,[R4, #+0]
        LDRH     R0,[R4, #+16]
        STRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x200
        STRH     R0,[R4, #+0]
        LDRH     R0,[R4, #+16]
        STRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
        MOVW     R0,#+65535
        MOVS     R6,R0
??drv_i2c_master_recv_with_stop_32:
        LDRH     R0,[R4, #+20]
        LSLS     R0,R0,#+25
        BMI.N    ??drv_i2c_master_recv_with_stop_33
        CMP      R6,#+0
        BEQ.N    ??drv_i2c_master_recv_with_stop_33
        SUBS     R6,R6,#+1
        B.N      ??drv_i2c_master_recv_with_stop_32
??drv_i2c_master_recv_with_stop_33:
        LDRH     R0,[R4, #+16]
        STRB     R0,[R2, #+0]
        ADDS     R2,R2,#+1
        ADDS     R5,R5,#+3
??drv_i2c_master_recv_with_stop_31:
        MOVS     R0,#+0
        MOVS     R3,R0
        B.N      ??drv_i2c_master_recv_with_stop_23
??drv_i2c_master_recv_with_stop_24:
        LDRH     R0,[R4, #+0]
        LSLS     R0,R0,#+22
        BMI.N    ??drv_i2c_master_recv_with_stop_24
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x400
        STRH     R0,[R4, #+0]
??drv_i2c_master_recv_with_stop_10:
        MOVS     R0,#+1
??drv_i2c_master_recv_with_stop_5:
        POP      {R1,R4-R7}
        BX       LR               ;; return

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
// 266 bytes in section .text
// 808 bytes in section .textrw
// 
// 1 074 bytes of CODE memory
//
//Errors: none
//Warnings: none
