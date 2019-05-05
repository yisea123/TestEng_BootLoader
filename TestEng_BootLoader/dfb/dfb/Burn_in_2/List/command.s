///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:31
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\command.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\command.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\command.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN AD7949_read_ISAMP_ch
        EXTERN AD7949_read_MPD_ch
        EXTERN AD7949_read_THERMO_ch
        EXTERN AD7949_read_VSAMP_ch
        EXTERN AD7949_read_all_data
        EXTERN AT24HC02C_rd_n_bytes
        EXTERN AT24HC02C_wr_n_bytes
        EXTERN Delay_ms
        EXTERN Delay_us
        EXTERN Disable_sw_vs1
        EXTERN Enable_sw_vs1
        EXTERN LTC2620_Powerdown_n
        EXTERN LTC2620_Write_n_Updata_n
        EXTERN MAX5478_write_potentiometer
        EXTERN Max7312_Set_All_Port_Output
        EXTERN Max7312_Set_Port1_HiLo
        EXTERN Max7312_Set_Port2_HiLo
        EXTERN Set_spi_cs_n

        PUBLIC cmd_adc_iout
        PUBLIC cmd_adc_mout
        PUBLIC cmd_adc_tout
        PUBLIC cmd_adc_vout
        PUBLIC cmd_check_lock
        PUBLIC cmd_cur_dac
        PUBLIC cmd_cur_dac_cs
        PUBLIC cmd_cur_dac_old
        PUBLIC cmd_cur_dac_upd_ch_st
        PUBLIC cmd_eep
        PUBLIC cmd_eep_addr
        PUBLIC cmd_eep_lenth
        PUBLIC cmd_eep_old
        PUBLIC cmd_eep_rd_wr_st
        PUBLIC cmd_lock_reg
        PUBLIC cmd_lock_st
        PUBLIC cmd_max7312_en
        PUBLIC cmd_max7312_en_old
        PUBLIC cmd_potentiometer_res
        PUBLIC cmd_potentiometer_res_old
        PUBLIC cmd_powerdown_cur_dac
        PUBLIC cmd_pwrdn_current_st
        PUBLIC cmd_pwrdn_dac
        PUBLIC cmd_pwrdn_dac_old
        PUBLIC cmd_pwrdn_update_ch_st
        PUBLIC cmd_rd_eep
        PUBLIC cmd_rd_wr_eep
        PUBLIC cmd_read_iout
        PUBLIC cmd_read_mout
        PUBLIC cmd_read_thmo
        PUBLIC cmd_read_vout
        PUBLIC cmd_stage_fast_proc
        PUBLIC cmd_stage_slow_proc
        PUBLIC cmd_vcc_en
        PUBLIC cmd_vcc_en_old
        PUBLIC cmd_write_cur_dac
        PUBLIC cmd_write_potentiometer
        PUBLIC cmd_write_switches
        PUBLIC cmd_write_vcc_en


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_lock_reg:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(0)
cmd_lock_st:
        DATA
        DC8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_check_lock:
        LDR.W    R0,??DataTable10
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+57005
        CMP      R0,R1
        BNE.N    ??cmd_check_lock_0
        LDR.W    R0,??DataTable10
        LDRH     R0,[R0, #+2]
        MOVW     R1,#+48879
        CMP      R0,R1
        BNE.N    ??cmd_check_lock_0
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+0]
        B.N      ??cmd_check_lock_1
??cmd_check_lock_0:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+0]
??cmd_check_lock_1:
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
cmd_potentiometer_res_old:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
cmd_potentiometer_res:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_write_potentiometer:
        PUSH     {R4,LR}
        LDR.W    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??cmd_write_potentiometer_0
        LDR.W    R0,??DataTable10_2
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable10_3
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BEQ.N    ??cmd_write_potentiometer_0
        LDR.W    R0,??DataTable10_3
        LDRH     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       MAX5478_write_potentiometer
        MOVS     R4,R0
        LDR.W    R0,??DataTable10_3
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable10_2
        STRH     R0,[R1, #+0]
??cmd_write_potentiometer_0:
        POP      {R4,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
cmd_vcc_en_old:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
cmd_vcc_en:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_write_vcc_en:
        PUSH     {R7,LR}
        LDR.W    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??cmd_write_vcc_en_0
        LDR.W    R0,??DataTable10_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable10_5
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BEQ.N    ??cmd_write_vcc_en_0
        LDR.W    R0,??DataTable10_4
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+43981
        CMP      R0,R1
        BNE.N    ??cmd_write_vcc_en_1
        BL       Enable_sw_vs1
        MOVS     R0,#+10
        BL       Delay_ms
        B.N      ??cmd_write_vcc_en_2
??cmd_write_vcc_en_1:
        BL       Disable_sw_vs1
??cmd_write_vcc_en_2:
        LDR.W    R0,??DataTable10_4
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable10_5
        STRH     R0,[R1, #+0]
??cmd_write_vcc_en_0:
        POP      {R0,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_max7312_en_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_max7312_en:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_write_switches:
        PUSH     {R4-R8,LR}
        MOVS     R8,#+0
        LDR.W    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??cmd_write_switches_0
        MOVS     R0,#+0
        MOVS     R5,R0
??cmd_write_switches_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BGE.N    ??cmd_write_switches_0
        LDR.W    R0,??DataTable10_6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRH     R0,[R0, R5, LSL #+1]
        LDR.W    R1,??DataTable10_7
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRH     R1,[R1, R5, LSL #+1]
        CMP      R0,R1
        BEQ.N    ??cmd_write_switches_2
        MOVS     R0,#+0
        BL       Max7312_Set_All_Port_Output
        MOVS     R0,#+1
        BL       Max7312_Set_All_Port_Output
        LDR.W    R0,??DataTable10_7
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRH     R0,[R0, R5, LSL #+1]
        MOV      R8,R0
        MOV      R0,R8
        MOVS     R6,R0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LSRS     R0,R8,#+8
        MOVS     R7,R0
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port1_HiLo
        MOVS     R4,R0
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port2_HiLo
        MOVS     R4,R0
        LDR.W    R0,??DataTable10_7
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRH     R0,[R0, R5, LSL #+1]
        LDR.W    R1,??DataTable10_6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STRH     R0,[R1, R5, LSL #+1]
??cmd_write_switches_2:
        ADDS     R5,R5,#+1
        B.N      ??cmd_write_switches_1
??cmd_write_switches_0:
        POP      {R4-R8,PC}       ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
cmd_cur_dac_cs:
        DATA
        DC8 1, 2, 3, 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_pwrdn_dac_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_pwrdn_dac:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_pwrdn_current_st:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_pwrdn_update_ch_st:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_cur_dac_old:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_cur_dac:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_cur_dac_upd_ch_st:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_powerdown_cur_dac:
        PUSH     {R3-R7,LR}
        LDR.W    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.W    ??cmd_powerdown_cur_dac_0
??cmd_powerdown_cur_dac_1:
        LDR.W    R0,??DataTable10_8
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable10_9
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??cmd_powerdown_cur_dac_2
        LDR.W    R0,??DataTable10_8
        LDRH     R0,[R0, #+2]
        LDR.W    R1,??DataTable10_9
        LDRH     R1,[R1, #+2]
        CMP      R0,R1
        BEQ.N    ??cmd_powerdown_cur_dac_3
??cmd_powerdown_cur_dac_2:
        LDR.W    R0,??DataTable10_9
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable10_8
        STRH     R0,[R1, #+0]
        LDR.W    R0,??DataTable10_9
        LDRH     R0,[R0, #+2]
        LDR.W    R1,??DataTable10_8
        STRH     R0,[R1, #+2]
        LDR.W    R0,??DataTable10_10
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable10_11
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable10_8
        LDRH     R0,[R0, #+2]
        LDR.W    R1,??DataTable10_8
        LDRH     R1,[R1, #+0]
        ORRS     R0,R1,R0, LSL #+16
        LDR.W    R1,??DataTable10_10
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable10_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable10_10
        LDR      R1,[R1, #+0]
        EORS     R0,R1,R0
        LDR.W    R1,??DataTable10_11
        STR      R0,[R1, #+0]
        B.N      ??cmd_powerdown_cur_dac_4
??cmd_powerdown_cur_dac_3:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_11
        STR      R0,[R1, #+0]
??cmd_powerdown_cur_dac_4:
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_powerdown_cur_dac_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BGE.N    ??cmd_powerdown_cur_dac_6
        LDR.W    R0,??DataTable10_11
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R2,R4,#+3
        LSLS     R1,R1,R2
        TST      R0,R1
        BEQ.N    ??cmd_powerdown_cur_dac_7
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+1
        BL       Delay_us
        LDR.W    R0,??DataTable10_12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        BL       Set_spi_cs_n
        MOVS     R0,#+5
        BL       Delay_us
        MOVS     R0,#+0
        MOVS     R5,R0
??cmd_powerdown_cur_dac_8:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??cmd_powerdown_cur_dac_7
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4, LSL #+3
        MOVS     R6,R0
        LDR.N    R0,??DataTable10_11
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,R6
        LSLS     R0,R0,#+31
        BPL.N    ??cmd_powerdown_cur_dac_9
        LDR.N    R0,??DataTable10_10
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,R6
        LSLS     R0,R0,#+31
        BPL.N    ??cmd_powerdown_cur_dac_10
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Powerdown_n
        MOVS     R7,R0
        B.N      ??cmd_powerdown_cur_dac_9
??cmd_powerdown_cur_dac_10:
        LDR.N    R0,??DataTable10_13
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRH     R1,[R0, R6, LSL #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Write_n_Updata_n
        MOVS     R7,R0
??cmd_powerdown_cur_dac_9:
        ADDS     R5,R5,#+1
        B.N      ??cmd_powerdown_cur_dac_8
??cmd_powerdown_cur_dac_7:
        ADDS     R4,R4,#+1
        B.N      ??cmd_powerdown_cur_dac_5
??cmd_powerdown_cur_dac_6:
        MOVS     R0,#+6
        BL       Set_spi_cs_n
??cmd_powerdown_cur_dac_0:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_write_cur_dac:
        PUSH     {R3-R7,LR}
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??cmd_write_cur_dac_0
??cmd_write_cur_dac_1:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_14
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_write_cur_dac_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BGE.N    ??cmd_write_cur_dac_3
        MOVS     R0,#+0
        MOVS     R5,R0
??cmd_write_cur_dac_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??cmd_write_cur_dac_5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4, LSL #+3
        MOVS     R6,R0
        LDR.N    R0,??DataTable10_13
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRH     R0,[R0, R6, LSL #+1]
        LDR.N    R1,??DataTable10_15
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRH     R1,[R1, R6, LSL #+1]
        CMP      R0,R1
        BEQ.N    ??cmd_write_cur_dac_6
        LDR.N    R0,??DataTable10_15
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRH     R0,[R0, R6, LSL #+1]
        LDR.N    R1,??DataTable10_13
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STRH     R0,[R1, R6, LSL #+1]
        LDR.N    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R6
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable10_14
        STR      R0,[R1, #+0]
??cmd_write_cur_dac_6:
        ADDS     R5,R5,#+1
        B.N      ??cmd_write_cur_dac_4
??cmd_write_cur_dac_5:
        ADDS     R4,R4,#+1
        B.N      ??cmd_write_cur_dac_2
??cmd_write_cur_dac_3:
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_write_cur_dac_7:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BGE.N    ??cmd_write_cur_dac_8
        LDR.N    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        MOVS     R1,#+255
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R2,R4,#+3
        LSLS     R1,R1,R2
        TST      R0,R1
        BEQ.N    ??cmd_write_cur_dac_9
        MOVS     R0,#+0
        MOVS     R5,R0
??cmd_write_cur_dac_10:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??cmd_write_cur_dac_9
        MOVS     R0,#+6
        BL       Set_spi_cs_n
        MOVS     R0,#+1
        BL       Delay_us
        LDR.N    R0,??DataTable10_12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        BL       Set_spi_cs_n
        MOVS     R0,#+5
        BL       Delay_us
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R4, LSL #+3
        MOVS     R6,R0
        LDR.N    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,R6
        ANDS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??cmd_write_cur_dac_11
        LDR.N    R0,??DataTable10_10
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,R6
        ANDS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??cmd_write_cur_dac_11
        LDR.N    R0,??DataTable10_13
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRH     R1,[R0, R6, LSL #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       LTC2620_Write_n_Updata_n
        MOVS     R7,R0
        MOVS     R0,#+1
        BL       Delay_ms
??cmd_write_cur_dac_11:
        ADDS     R5,R5,#+1
        B.N      ??cmd_write_cur_dac_10
??cmd_write_cur_dac_9:
        ADDS     R4,R4,#+1
        B.N      ??cmd_write_cur_dac_7
??cmd_write_cur_dac_8:
        MOVS     R0,#+6
        BL       Set_spi_cs_n
??cmd_write_cur_dac_0:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_eep_old:
        DS8 28

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_eep:
        DS8 28

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_rd_eep:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_eep_addr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_eep_lenth:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_eep_rd_wr_st:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_rd_wr_eep:
        PUSH     {R3-R5,LR}
        MOVS     R5,#+0
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??cmd_rd_wr_eep_0
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_rd_wr_eep_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+14
        BGE.N    ??cmd_rd_wr_eep_2
        LDR.N    R0,??DataTable10_16
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRH     R0,[R0, R4, LSL #+1]
        LDR.N    R1,??DataTable10_17
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRH     R1,[R1, R4, LSL #+1]
        CMP      R0,R1
        BEQ.N    ??cmd_rd_wr_eep_3
        MOVS     R0,#+1
        MOVS     R5,R0
        B.N      ??cmd_rd_wr_eep_2
??cmd_rd_wr_eep_3:
        ADDS     R4,R4,#+1
        B.N      ??cmd_rd_wr_eep_1
??cmd_rd_wr_eep_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??cmd_rd_wr_eep_0
        LDR.N    R0,??DataTable10_16
        LDRH     R0,[R0, #+2]
        LDR.N    R1,??DataTable10_16
        LDRH     R1,[R1, #+0]
        ORRS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable10_18
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable10_16
        LDRH     R0,[R0, #+6]
        LDR.N    R1,??DataTable10_16
        LDRH     R1,[R1, #+4]
        ORRS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable10_19
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable10_16
        LDRH     R0,[R0, #+10]
        LDR.N    R1,??DataTable10_16
        LDRH     R1,[R1, #+8]
        ORRS     R0,R1,R0, LSL #+16
        LDR.N    R1,??DataTable10_20
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable10_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+17
        BCC.N    ??cmd_rd_wr_eep_4
        MOVS     R0,#+16
        LDR.N    R1,??DataTable10_19
        STR      R0,[R1, #+0]
??cmd_rd_wr_eep_4:
        LDR.N    R0,??DataTable10_20
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable10_21  ;; 0xcc98cc98
        CMP      R0,R1
        BNE.N    ??cmd_rd_wr_eep_5
        LDR.N    R3,??DataTable10_22
        LDR.N    R0,??DataTable10_19
        LDR      R2,[R0, #+0]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R0,??DataTable10_18
        LDR      R1,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,#+0
        BL       AT24HC02C_wr_n_bytes
        B.N      ??cmd_rd_wr_eep_6
??cmd_rd_wr_eep_5:
        LDR.N    R0,??DataTable10_20
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable10_23  ;; 0xaa55aa55
        CMP      R0,R1
        BNE.N    ??cmd_rd_wr_eep_7
        LDR.N    R3,??DataTable10_24
        LDR.N    R0,??DataTable10_19
        LDR      R2,[R0, #+0]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R0,??DataTable10_18
        LDR      R1,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,#+0
        BL       AT24HC02C_rd_n_bytes
        B.N      ??cmd_rd_wr_eep_6
??cmd_rd_wr_eep_7:
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_rd_wr_eep_8:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??cmd_rd_wr_eep_6
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STRH     R0,[R1, R4, LSL #+1]
        ADDS     R4,R4,#+1
        B.N      ??cmd_rd_wr_eep_8
??cmd_rd_wr_eep_6:
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_rd_wr_eep_9:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+14
        BGE.N    ??cmd_rd_wr_eep_10
        LDR.N    R0,??DataTable10_16
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRH     R0,[R0, R4, LSL #+1]
        LDR.N    R1,??DataTable10_17
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STRH     R0,[R1, R4, LSL #+1]
        ADDS     R4,R4,#+1
        B.N      ??cmd_rd_wr_eep_9
??cmd_rd_wr_eep_10:
        MOVS     R0,#+0
        MOVS     R5,R0
??cmd_rd_wr_eep_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_adc_tout:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_read_thmo:
        PUSH     {R3-R5,LR}
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??cmd_read_thmo_0
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_read_thmo_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BGE.N    ??cmd_read_thmo_0
        LDR.N    R0,??DataTable10_25
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R1,R0,R4, LSL #+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_read_THERMO_ch
        MOVS     R5,R0
        ADDS     R4,R4,#+1
        B.N      ??cmd_read_thmo_1
??cmd_read_thmo_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_adc_iout:
        DS8 64

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_read_iout:
        PUSH     {R3-R5,LR}
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??cmd_read_iout_0
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_read_iout_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+32
        BGE.N    ??cmd_read_iout_0
        LDR.N    R0,??DataTable10_26
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R1,R0,R4, LSL #+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_read_ISAMP_ch
        MOVS     R5,R0
        ADDS     R4,R4,#+1
        B.N      ??cmd_read_iout_1
??cmd_read_iout_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_adc_mout:
        DS8 64

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_read_mout:
        PUSH     {R3-R5,LR}
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??cmd_read_mout_0
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_read_mout_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+32
        BGE.N    ??cmd_read_mout_0
        LDR.N    R0,??DataTable10_27
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R1,R0,R4, LSL #+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_read_MPD_ch
        MOVS     R5,R0
        ADDS     R4,R4,#+1
        B.N      ??cmd_read_mout_1
??cmd_read_mout_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cmd_adc_vout:
        DS8 64

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_read_vout:
        PUSH     {R3-R5,LR}
        LDR.N    R0,??DataTable10_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??cmd_read_vout_0
        MOVS     R0,#+0
        MOVS     R4,R0
??cmd_read_vout_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+32
        BGE.N    ??cmd_read_vout_0
        LDR.N    R0,??DataTable10_28
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R1,R0,R4, LSL #+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       AD7949_read_VSAMP_ch
        MOVS     R5,R0
        ADDS     R4,R4,#+1
        B.N      ??cmd_read_vout_1
??cmd_read_vout_0:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     cmd_lock_reg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     cmd_lock_st

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     cmd_potentiometer_res_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     cmd_potentiometer_res

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     cmd_vcc_en

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     cmd_vcc_en_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     cmd_max7312_en_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     cmd_max7312_en

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     cmd_pwrdn_dac_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     cmd_pwrdn_dac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     cmd_pwrdn_current_st

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     cmd_pwrdn_update_ch_st

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     cmd_cur_dac_cs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     cmd_cur_dac_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     cmd_cur_dac_upd_ch_st

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_15:
        DC32     cmd_cur_dac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_16:
        DC32     cmd_eep

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_17:
        DC32     cmd_eep_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_18:
        DC32     cmd_eep_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_19:
        DC32     cmd_eep_lenth

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_20:
        DC32     cmd_eep_rd_wr_st

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_21:
        DC32     0xcc98cc98

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_22:
        DC32     cmd_eep+0xC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_23:
        DC32     0xaa55aa55

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_24:
        DC32     cmd_rd_eep

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_25:
        DC32     cmd_adc_tout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_26:
        DC32     cmd_adc_iout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_27:
        DC32     cmd_adc_mout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_28:
        DC32     cmd_adc_vout

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_stage_fast_proc:
        PUSH     {R7,LR}
        BL       cmd_check_lock
        BL       cmd_write_potentiometer
        BL       cmd_write_vcc_en
        BL       cmd_write_switches
        BL       cmd_rd_wr_eep
        BL       cmd_powerdown_cur_dac
        BL       cmd_write_cur_dac
        BL       cmd_read_thmo
        BL       cmd_read_iout
        BL       cmd_read_mout
        BL       cmd_read_vout
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmd_stage_slow_proc:
        PUSH     {R7,LR}
        BL       AD7949_read_all_data
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
//   448 bytes in section .bss
//     5 bytes in section .data
// 1 456 bytes in section .text
// 
// 1 456 bytes of CODE memory
//   453 bytes of DATA memory
//
//Errors: none
//Warnings: 11
