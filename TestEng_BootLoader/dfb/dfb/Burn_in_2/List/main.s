///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:47:44
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\main.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\main.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delay_Init
        EXTERN Disable_sw_vs1
        EXTERN Get_board_address
        EXTERN Get_test_n
        EXTERN SystemInit
        EXTERN cmd_stage_fast_proc
        EXTERN cmd_stage_slow_proc
        EXTERN eMBEnable
        EXTERN eMBInit
        EXTERN eMBPoll
        EXTERN init

        PUBLIC main
        PUBLIC set_module_state
        PUBLIC state
        PUBLIC state_machine
        PUBLIC sub_state


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SystemReset(void)
NVIC_SystemReset:
        DSB      
        LDR.N    R0,??DataTable3  ;; 0xe000ed0c
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x700
        LDR.N    R1,??DataTable3_1  ;; 0x5fa0004
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable3  ;; 0xe000ed0c
        STR      R0,[R1, #+0]
        DSB      
??NVIC_SystemReset_0:
        B.N      ??NVIC_SystemReset_0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
state:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
sub_state:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
mainloop_counter:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_module_state:
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+0]
        MOVS     R1,#+0
        LDR.N    R2,??DataTable3_3
        STRB     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
main:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        BL       SystemInit
        MOVS     R0,#+72
        BL       Delay_Init
        LDR.N    R0,??DataTable3_4  ;; 0x40010004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable3_4  ;; 0x40010004
        STR      R0,[R1, #+0]
        CPSID    I
        BL       init
        BL       Get_board_address
        MOVS     R4,R0
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOV      R3,#+19200
        MOVS     R2,#+1
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+0
        BL       eMBInit
        BL       eMBEnable
        CPSIE    I
        MOVS     R0,#+2
        BL       set_module_state
??main_0:
        BL       state_machine
        B.N      ??main_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
state_machine:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable3_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??state_machine_0
        CMP      R0,#+2
        BEQ.N    ??state_machine_1
        BCC.N    ??state_machine_2
        B.N      ??state_machine_3
??state_machine_0:
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??state_machine_4
        CMP      R0,#+2
        BEQ.N    ??state_machine_5
        BCC.N    ??state_machine_6
        B.N      ??state_machine_7
??state_machine_4:
        MOVS     R0,#+1
        MSR      FAULTMASK,R0
        BL       NVIC_SystemReset
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B.N      ??state_machine_7
??state_machine_6:
        MOVS     R0,#+2
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B.N      ??state_machine_7
??state_machine_5:
        MOVS     R0,#+2
        BL       set_module_state
??state_machine_7:
        B.N      ??state_machine_3
??state_machine_2:
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??state_machine_8
        CMP      R0,#+2
        BEQ.N    ??state_machine_9
        BCC.N    ??state_machine_10
        B.N      ??state_machine_11
??state_machine_8:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B.N      ??state_machine_11
??state_machine_10:
        MOVS     R0,#+2
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B.N      ??state_machine_11
??state_machine_9:
        MOVS     R0,#+2
        BL       set_module_state
??state_machine_11:
        B.N      ??state_machine_3
??state_machine_1:
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??state_machine_12
        CMP      R0,#+2
        BEQ.N    ??state_machine_13
        BCC.N    ??state_machine_14
        CMP      R0,#+3
        BEQ.N    ??state_machine_15
        B.N      ??state_machine_16
??state_machine_12:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B.N      ??state_machine_16
??state_machine_14:
        BL       Get_test_n
        CMP      R0,#+0
        BEQ.N    ??state_machine_17
        BL       Disable_sw_vs1
??state_machine_17:
        BL       eMBPoll
        BL       cmd_stage_fast_proc
        LDR.N    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_5
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        MOVW     R1,#+10000
        CMP      R0,R1
        BNE.N    ??state_machine_18
        BL       cmd_stage_slow_proc
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_5
        STR      R0,[R1, #+0]
??state_machine_18:
        B.N      ??state_machine_16
??state_machine_13:
        B.N      ??state_machine_16
??state_machine_15:
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??state_machine_19
        CMP      R0,#+2
        BEQ.N    ??state_machine_20
        BCC.N    ??state_machine_21
        B.N      ??state_machine_22
??state_machine_19:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B.N      ??state_machine_22
??state_machine_21:
        MOVS     R0,#+2
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B.N      ??state_machine_22
??state_machine_20:
        MOVS     R0,#+0
        BL       set_module_state
??state_machine_22:
??state_machine_16:
??state_machine_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0xe000ed0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x5fa0004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     sub_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x40010004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     mainloop_counter

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
//   6 bytes in section .bss
// 370 bytes in section .text
// 
// 370 bytes of CODE memory
//   6 bytes of DATA memory
//
//Errors: none
//Warnings: none
