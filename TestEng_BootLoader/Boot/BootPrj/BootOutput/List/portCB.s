///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       09/Jun/2019  21:27:06
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\modbus_port\portCB.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\modbus_port\portCB.c
//        -lcN
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\
//        -lb
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\
//        -o
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --fpu=None --dlib_config "E:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootApp\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootDrv\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootOth\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\..\Libraries\CMSIS\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\..\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\ascii\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\include\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\modbus_port\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\rtu\
//        -I
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\tcp\
//        -On -I "E:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\portCB.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

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
        DS8 512

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRegHoldingCB:
        PUSH     {R4-R7}
        MOVS     R4,R0
        MOVS     R5,#+0
        CMP      R4,#+0
        BNE.N    ??eMBRegHoldingCB_0
        MOVS     R0,#+2
        B.N      ??eMBRegHoldingCB_1
??eMBRegHoldingCB_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??eMBRegHoldingCB_2
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R0,R2,R1
        CMP      R0,#+258
        BGE.N    ??eMBRegHoldingCB_2
        SUBS     R0,R1,#+1
        MOVS     R7,R0
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??eMBRegHoldingCB_3
        CMP      R3,#+1
        BEQ.N    ??eMBRegHoldingCB_4
        B.N      ??eMBRegHoldingCB_5
??eMBRegHoldingCB_3:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BEQ.N    ??eMBRegHoldingCB_6
        LDR.N    R0,??DataTable3
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRH     R0,[R0, R7, LSL #+1]
        MOVS     R6,R0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        STRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
        STRB     R6,[R4, #+0]
        ADDS     R4,R4,#+1
        ADDS     R7,R7,#+1
        SUBS     R2,R2,#+1
        B.N      ??eMBRegHoldingCB_3
??eMBRegHoldingCB_6:
        B.N      ??eMBRegHoldingCB_5
??eMBRegHoldingCB_4:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BEQ.N    ??eMBRegHoldingCB_7
        LDRB     R0,[R4, #+0]
        LSLS     R0,R0,#+8
        MOVS     R6,R0
        ADDS     R4,R4,#+1
        LDRB     R0,[R4, #+0]
        ORRS     R6,R0,R6
        ADDS     R4,R4,#+1
        LDR.N    R0,??DataTable3
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        STRH     R6,[R0, R7, LSL #+1]
        ADDS     R7,R7,#+1
        SUBS     R2,R2,#+1
        B.N      ??eMBRegHoldingCB_4
??eMBRegHoldingCB_7:
        B.N      ??eMBRegHoldingCB_5
??eMBRegHoldingCB_2:
        MOVS     R0,#+1
        MOVS     R5,R0
??eMBRegHoldingCB_5:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??eMBRegHoldingCB_1:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
usRegInputBuf:
        DATA
        DC16 8217, 1312, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC16 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRegInputCB:
        PUSH     {R4-R6}
        MOVS     R3,R0
        MOVS     R4,#+0
        CMP      R3,#+0
        BNE.N    ??eMBRegInputCB_0
        MOVS     R0,#+2
        B.N      ??eMBRegInputCB_1
??eMBRegInputCB_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??eMBRegInputCB_2
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R0,R2,R1
        CMP      R0,#+130
        BGE.N    ??eMBRegInputCB_2
        SUBS     R0,R1,#+1
        MOVS     R5,R0
??eMBRegInputCB_3:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BEQ.N    ??eMBRegInputCB_4
        LDR.N    R0,??DataTable3_1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDRH     R0,[R0, R5, LSL #+1]
        MOVS     R6,R0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        STRB     R0,[R3, #+0]
        ADDS     R3,R3,#+1
        STRB     R6,[R3, #+0]
        ADDS     R3,R3,#+1
        ADDS     R5,R5,#+1
        SUBS     R2,R2,#+1
        B.N      ??eMBRegInputCB_3
??eMBRegInputCB_2:
        MOVS     R0,#+1
        MOVS     R4,R0
??eMBRegInputCB_4:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??eMBRegInputCB_1:
        POP      {R4-R6}
        BX       LR               ;; return

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
        CMP      R0,#+129
        BGE.N    ??eWriteMBRegInput_2
        MOVS     R5,R1
        CPSID    I
??eWriteMBRegInput_3:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BEQ.N    ??eWriteMBRegInput_4
        LDRH     R0,[R3, #+0]
        LDR.N    R6,??DataTable3_1
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
        CMP      R0,#+256
        BGT.N    ??eReadMBRegHolding_2
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
// 512 bytes in section .bss
// 256 bytes in section .data
// 374 bytes in section .text
// 
// 374 bytes of CODE memory
// 768 bytes of DATA memory
//
//Errors: none
//Warnings: 2
