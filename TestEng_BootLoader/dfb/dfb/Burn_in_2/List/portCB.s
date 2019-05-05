///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:49
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\modbus\modbus_port\portCB.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\modbus\modbus_port\portCB.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\portCB.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN cmd_adc_iout
        EXTERN cmd_adc_mout
        EXTERN cmd_adc_tout
        EXTERN cmd_adc_vout
        EXTERN cmd_cur_dac
        EXTERN cmd_eep
        EXTERN cmd_lock_reg
        EXTERN cmd_max7312_en
        EXTERN cmd_potentiometer_res
        EXTERN cmd_pwrdn_dac
        EXTERN cmd_rd_eep
        EXTERN cmd_vcc_en

        PUBLIC eMBRegCoilsCB
        PUBLIC eMBRegDiscreteCB
        PUBLIC eMBRegHoldingCB
        PUBLIC eMBRegInputCB
        PUBLIC eReadMBRegHolding
        PUBLIC eWriteMBRegInput
        PUBLIC usRegHoldingBuf
        PUBLIC usRegInputBuf


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
usRegHoldingBuf:
        DS8 108

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRegHoldingCB:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R8,#+0
        CMP      R4,#+0
        BNE.N    ??eMBRegHoldingCB_0
        MOVS     R0,#+2
        B.N      ??eMBRegHoldingCB_1
??eMBRegHoldingCB_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??eMBRegHoldingCB_2
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,R5
        CMP      R0,#+56
        BGE.N    ??eMBRegHoldingCB_2
        SUBS     R0,R5,#+1
        MOV      R9,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??eMBRegHoldingCB_3
        CMP      R7,#+1
        BEQ.N    ??eMBRegHoldingCB_4
        B.N      ??eMBRegHoldingCB_5
??eMBRegHoldingCB_3:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??eMBRegHoldingCB_6
        LDR.N    R0,??DataTable3
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDRH     R0,[R0, R9, LSL #+1]
        MOV      R10,R0
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        LSRS     R0,R10,#+8
        STRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
        STRB     R10,[R4, #+0]
        ADDS     R4,R4,#+1
        ADDS     R9,R9,#+1
        SUBS     R6,R6,#+1
        B.N      ??eMBRegHoldingCB_3
??eMBRegHoldingCB_6:
        B.N      ??eMBRegHoldingCB_5
??eMBRegHoldingCB_4:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??eMBRegHoldingCB_7
        LDRB     R0,[R4, #+0]
        LSLS     R0,R0,#+8
        MOV      R10,R0
        ADDS     R4,R4,#+1
        LDRB     R0,[R4, #+0]
        ORRS     R10,R0,R10
        ADDS     R4,R4,#+1
        LDR.N    R0,??DataTable3
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        STRH     R10,[R0, R9, LSL #+1]
        ADDS     R9,R9,#+1
        SUBS     R6,R6,#+1
        B.N      ??eMBRegHoldingCB_4
??eMBRegHoldingCB_7:
        MOVS     R2,#+2
        MOVS     R1,#+0
        LDR.N    R0,??DataTable3_1
        BL       eReadMBRegHolding
        MOV      R8,R0
        MOVS     R2,#+1
        MOVS     R1,#+2
        LDR.N    R0,??DataTable3_2
        BL       eReadMBRegHolding
        MOV      R8,R0
        MOVS     R2,#+2
        MOVS     R1,#+3
        LDR.N    R0,??DataTable3_3
        BL       eReadMBRegHolding
        MOV      R8,R0
        MOVS     R2,#+1
        MOVS     R1,#+5
        LDR.N    R0,??DataTable3_4
        BL       eReadMBRegHolding
        MOV      R8,R0
        MOVS     R2,#+2
        MOVS     R1,#+6
        LDR.N    R0,??DataTable3_5
        BL       eReadMBRegHolding
        MOV      R8,R0
        MOVS     R2,#+32
        MOVS     R1,#+8
        LDR.N    R0,??DataTable3_6
        BL       eReadMBRegHolding
        MOV      R8,R0
        MOVS     R2,#+14
        MOVS     R1,#+40
        LDR.N    R0,??DataTable3_7
        BL       eReadMBRegHolding
        MOV      R8,R0
        B.N      ??eMBRegHoldingCB_5
??eMBRegHoldingCB_2:
        MOVS     R0,#+1
        MOV      R8,R0
??eMBRegHoldingCB_5:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??eMBRegHoldingCB_1:
        POP      {R4-R10,PC}      ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
usRegInputBuf:
        DATA
        DC16 8217, 816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRegInputCB:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,#+0
        CMP      R4,#+0
        BNE.N    ??eMBRegInputCB_0
        MOVS     R0,#+2
        B.N      ??eMBRegInputCB_1
??eMBRegInputCB_0:
        MOVS     R2,#+2
        MOVS     R1,#+4
        LDR.N    R0,??DataTable3_8
        BL       eWriteMBRegInput
        MOVS     R7,R0
        MOVS     R2,#+32
        MOVS     R1,#+8
        LDR.N    R0,??DataTable3_9
        BL       eWriteMBRegInput
        MOVS     R7,R0
        MOVS     R2,#+32
        MOVS     R1,#+40
        LDR.N    R0,??DataTable3_10
        BL       eWriteMBRegInput
        MOVS     R7,R0
        MOVS     R2,#+32
        MOVS     R1,#+72
        LDR.N    R0,??DataTable3_11
        BL       eWriteMBRegInput
        MOVS     R7,R0
        MOVS     R2,#+8
        MOVS     R1,#+104
        LDR.N    R0,??DataTable3_12
        BL       eWriteMBRegInput
        MOVS     R7,R0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??eMBRegInputCB_2
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R6,R5
        CMP      R0,#+114
        BGE.N    ??eMBRegInputCB_2
        SUBS     R0,R5,#+1
        MOV      R8,R0
??eMBRegInputCB_3:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??eMBRegInputCB_4
        LDR.N    R0,??DataTable3_13
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDRH     R0,[R0, R8, LSL #+1]
        MOV      R9,R0
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LSRS     R0,R9,#+8
        STRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
        STRB     R9,[R4, #+0]
        ADDS     R4,R4,#+1
        ADDS     R8,R8,#+1
        SUBS     R6,R6,#+1
        B.N      ??eMBRegInputCB_3
??eMBRegInputCB_2:
        MOVS     R0,#+1
        MOVS     R7,R0
??eMBRegInputCB_4:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??eMBRegInputCB_1:
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRegCoilsCB:
        PUSH     {R4}
        MOVS     R4,R0
        MOVS     R0,#+0
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRegDiscreteCB:
        MOVS     R3,R0
        MOVS     R0,#+0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eWriteMBRegInput:
        PUSH     {R4-R6}
        MOVS     R3,R0
        MOVS     R4,#+0
        CMP      R3,#+0
        BNE.N    ??eWriteMBRegInput_0
        MOVS     R0,#+2
        B.N      ??eWriteMBRegInput_1
??eWriteMBRegInput_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R0,R2,R1
        CMP      R0,#+113
        BGE.N    ??eWriteMBRegInput_2
        MOVS     R5,R1
        CPSID    I
??eWriteMBRegInput_3:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BEQ.N    ??eWriteMBRegInput_4
        LDRH     R0,[R3, #+0]
        LDR.N    R6,??DataTable3_13
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        STRH     R0,[R6, R5, LSL #+1]
        ADDS     R3,R3,#+2
        ADDS     R5,R5,#+1
        SUBS     R2,R2,#+1
        B.N      ??eWriteMBRegInput_3
??eWriteMBRegInput_4:
        CPSIE    I
        B.N      ??eWriteMBRegInput_5
??eWriteMBRegInput_2:
        MOVS     R0,#+1
        MOVS     R4,R0
??eWriteMBRegInput_5:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??eWriteMBRegInput_1:
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eReadMBRegHolding:
        PUSH     {R4,R5}
        MOVS     R3,R0
        MOVS     R4,#+0
        CMP      R3,#+0
        BNE.N    ??eReadMBRegHolding_0
        MOVS     R0,#+2
        B.N      ??eReadMBRegHolding_1
??eReadMBRegHolding_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R0,R2,R1
        CMP      R0,#+55
        BGE.N    ??eReadMBRegHolding_2
        MOVS     R5,R1
        CPSID    I
??eReadMBRegHolding_3:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BEQ.N    ??eReadMBRegHolding_4
        LDR.N    R0,??DataTable3
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDRH     R0,[R0, R5, LSL #+1]
        STRH     R0,[R3, #+0]
        ADDS     R3,R3,#+2
        ADDS     R5,R5,#+1
        SUBS     R2,R2,#+1
        B.N      ??eReadMBRegHolding_3
??eReadMBRegHolding_4:
        CPSIE    I
        B.N      ??eReadMBRegHolding_5
??eReadMBRegHolding_2:
        MOVS     R0,#+1
        MOVS     R4,R0
??eReadMBRegHolding_5:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??eReadMBRegHolding_1:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     usRegHoldingBuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     cmd_lock_reg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     cmd_potentiometer_res

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     cmd_pwrdn_dac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     cmd_vcc_en

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     cmd_max7312_en

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     cmd_cur_dac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     cmd_eep

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     cmd_adc_tout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     cmd_adc_iout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     cmd_adc_mout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     cmd_adc_vout

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     cmd_rd_eep

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     usRegInputBuf

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
// 108 bytes in section .bss
// 224 bytes in section .data
// 604 bytes in section .text
// 
// 604 bytes of CODE memory
// 332 bytes of DATA memory
//
//Errors: none
//Warnings: 2
