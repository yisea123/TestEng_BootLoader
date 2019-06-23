///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  16:32:33
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\mb.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\mb.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\mb.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN eMBASCIIInit
        EXTERN eMBASCIIReceive
        EXTERN eMBASCIISend
        EXTERN eMBASCIIStart
        EXTERN eMBASCIIStop
        EXTERN eMBFuncReadCoils
        EXTERN eMBFuncReadDiscreteInputs
        EXTERN eMBFuncReadHoldingRegister
        EXTERN eMBFuncReadInputRegister
        EXTERN eMBFuncReadWriteMultipleHoldingRegister
        EXTERN eMBFuncReportSlaveID
        EXTERN eMBFuncWriteCoil
        EXTERN eMBFuncWriteHoldingRegister
        EXTERN eMBFuncWriteMultipleCoils
        EXTERN eMBFuncWriteMultipleHoldingRegister
        EXTERN eMBRTUInit
        EXTERN eMBRTUReceive
        EXTERN eMBRTUSend
        EXTERN eMBRTUStart
        EXTERN eMBRTUStop
        EXTERN vMBPortTimersDelay
        EXTERN xMBASCIIReceiveFSM
        EXTERN xMBASCIITimerT1SExpired
        EXTERN xMBASCIITransmitFSM
        EXTERN xMBPortEventGet
        EXTERN xMBPortEventInit
        EXTERN xMBPortEventPost
        EXTERN xMBRTUReceiveFSM
        EXTERN xMBRTUTimerT35Expired
        EXTERN xMBRTUTransmitFSM

        PUBLIC eMBClose
        PUBLIC eMBDisable
        PUBLIC eMBEnable
        PUBLIC eMBInit
        PUBLIC eMBPoll
        PUBLIC eMBRegisterCB
        PUBLIC pxMBFrameCBByteReceived
        PUBLIC pxMBFrameCBReceiveFSMCur
        PUBLIC pxMBFrameCBTransmitFSMCur
        PUBLIC pxMBFrameCBTransmitterEmpty
        PUBLIC pxMBPortCBTimerExpired


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
ucMBAddress:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
eMBCurrentMode:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
eMBState:
        DATA
        DC8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
peMBFrameSendCur:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pvMBFrameStartCur:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pvMBFrameStopCur:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
peMBFrameReceiveCur:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pvMBFrameCloseCur:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pxMBFrameCBByteReceived:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pxMBFrameCBTransmitterEmpty:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pxMBPortCBTimerExpired:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pxMBFrameCBReceiveFSMCur:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pxMBFrameCBTransmitFSMCur:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
xFuncHandlers:
        DATA
        DC8 17, 0, 0, 0
        DC32 eMBFuncReportSlaveID
        DC8 4, 0, 0, 0
        DC32 eMBFuncReadInputRegister
        DC8 3, 0, 0, 0
        DC32 eMBFuncReadHoldingRegister
        DC8 16, 0, 0, 0
        DC32 eMBFuncWriteMultipleHoldingRegister
        DC8 6, 0, 0, 0
        DC32 eMBFuncWriteHoldingRegister
        DC8 23, 0, 0, 0
        DC32 eMBFuncReadWriteMultipleHoldingRegister
        DC8 1, 0, 0, 0
        DC32 eMBFuncReadCoils
        DC8 5, 0, 0, 0
        DC32 eMBFuncWriteCoil
        DC8 15, 0, 0, 0
        DC32 eMBFuncWriteMultipleCoils
        DC8 2, 0, 0, 0
        DC32 eMBFuncReadDiscreteInputs
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBInit:
        PUSH     {R3-R9,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
        LDR      R4,[SP, #+32]
        MOVS     R9,#+0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??eMBInit_0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??eMBInit_0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+248
        BLT.N    ??eMBInit_1
??eMBInit_0:
        MOVS     R0,#+2
        MOV      R9,R0
        B.N      ??eMBInit_2
??eMBInit_1:
        LDR.W    R0,??DataTable5
        STRB     R6,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??eMBInit_3
        CMP      R5,#+1
        BEQ.N    ??eMBInit_4
        B.N      ??eMBInit_5
??eMBInit_3:
        LDR.W    R0,??DataTable5_1
        LDR.W    R1,??DataTable5_2
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_3
        LDR.W    R1,??DataTable5_4
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_5
        LDR.W    R1,??DataTable5_6
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_7
        LDR.W    R1,??DataTable5_8
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable5_9
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_10
        LDR.W    R1,??DataTable5_11
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_12
        LDR.W    R1,??DataTable5_13
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable5_14
        LDR.W    R1,??DataTable5_15
        STR      R0,[R1, #+0]
        MOVS     R3,R4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOV      R2,R8
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        BL       eMBRTUInit
        MOV      R9,R0
        B.N      ??eMBInit_6
??eMBInit_4:
        LDR.N    R0,??DataTable5_16
        LDR.N    R1,??DataTable5_2
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable5_17
        LDR.N    R1,??DataTable5_4
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable5_18
        LDR.N    R1,??DataTable5_6
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable5_19
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_9
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable5_20
        LDR.N    R1,??DataTable5_11
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable5_21
        LDR.N    R1,??DataTable5_13
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable5_22
        LDR.N    R1,??DataTable5_15
        STR      R0,[R1, #+0]
        MOVS     R3,R4
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOV      R2,R8
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        BL       eMBASCIIInit
        MOV      R9,R0
        B.N      ??eMBInit_6
??eMBInit_5:
        MOVS     R0,#+2
        MOV      R9,R0
??eMBInit_6:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.N    ??eMBInit_2
        BL       xMBPortEventInit
        CMP      R0,#+0
        BNE.N    ??eMBInit_7
        MOVS     R0,#+3
        MOV      R9,R0
        B.N      ??eMBInit_2
??eMBInit_7:
        LDR.N    R0,??DataTable5_23
        STRB     R5,[R0, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_24
        STRB     R0,[R1, #+0]
??eMBInit_2:
        MOV      R0,R9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRegisterCB:
        PUSH     {R4,R5}
        MOVS     R2,R0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??eMBRegisterCB_0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+128
        BGE.N    ??eMBRegisterCB_0
        CPSID    I
        MOVS     R4,R1
        CMP      R4,#+0
        BEQ.N    ??eMBRegisterCB_1
        MOVS     R4,#+0
        MOVS     R3,R4
??eMBRegisterCB_2:
        CMP      R3,#+16
        BGE.N    ??eMBRegisterCB_3
        LDR.N    R4,??DataTable5_25
        ADDS     R4,R4,R3, LSL #+3
        LDR      R4,[R4, #+4]
        CMP      R4,#+0
        BEQ.N    ??eMBRegisterCB_4
        LDR.N    R4,??DataTable5_25
        ADDS     R4,R4,R3, LSL #+3
        LDR      R4,[R4, #+4]
        MOVS     R5,R1
        CMP      R4,R5
        BNE.N    ??eMBRegisterCB_5
??eMBRegisterCB_4:
        LDR.N    R4,??DataTable5_25
        STRB     R2,[R4, R3, LSL #+3]
        LDR.N    R4,??DataTable5_25
        ADDS     R4,R4,R3, LSL #+3
        STR      R1,[R4, #+4]
        B.N      ??eMBRegisterCB_3
??eMBRegisterCB_5:
        ADDS     R3,R3,#+1
        B.N      ??eMBRegisterCB_2
??eMBRegisterCB_3:
        CMP      R3,#+16
        BEQ.N    ??eMBRegisterCB_6
        MOVS     R0,#+0
        B.N      ??eMBRegisterCB_7
??eMBRegisterCB_6:
        MOVS     R0,#+4
        B.N      ??eMBRegisterCB_7
??eMBRegisterCB_1:
        MOVS     R4,#+0
        MOVS     R3,R4
??eMBRegisterCB_8:
        CMP      R3,#+16
        BGE.N    ??eMBRegisterCB_9
        LDR.N    R4,??DataTable5_25
        LDRB     R4,[R4, R3, LSL #+3]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R4,R2
        BNE.N    ??eMBRegisterCB_10
        MOVS     R4,#+0
        LDR.N    R5,??DataTable5_25
        STRB     R4,[R5, R3, LSL #+3]
        MOVS     R4,#+0
        LDR.N    R5,??DataTable5_25
        ADDS     R5,R5,R3, LSL #+3
        STR      R4,[R5, #+4]
        B.N      ??eMBRegisterCB_9
??eMBRegisterCB_10:
        ADDS     R3,R3,#+1
        B.N      ??eMBRegisterCB_8
??eMBRegisterCB_9:
        MOVS     R4,#+0
        MOVS     R0,R4
??eMBRegisterCB_7:
        CPSIE    I
        B.N      ??eMBRegisterCB_11
??eMBRegisterCB_0:
        MOVS     R4,#+2
        MOVS     R0,R4
??eMBRegisterCB_11:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBClose:
        PUSH     {R4,LR}
        MOVS     R4,#+0
        LDR.N    R0,??DataTable5_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??eMBClose_0
        LDR.N    R0,??DataTable5_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??eMBClose_1
        LDR.N    R0,??DataTable5_9
        LDR      R0,[R0, #+0]
        BLX      R0
        B.N      ??eMBClose_1
??eMBClose_0:
        MOVS     R0,#+6
        MOVS     R4,R0
??eMBClose_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBEnable:
        PUSH     {R4,LR}
        MOVS     R4,#+0
        LDR.N    R0,??DataTable5_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??eMBEnable_0
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        BLX      R0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_24
        STRB     R0,[R1, #+0]
        B.N      ??eMBEnable_1
??eMBEnable_0:
        MOVS     R0,#+6
        MOVS     R4,R0
??eMBEnable_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBDisable:
        PUSH     {R4,LR}
        LDR.N    R0,??DataTable5_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??eMBDisable_0
        LDR.N    R0,??DataTable5_4
        LDR      R0,[R0, #+0]
        BLX      R0
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_24
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??eMBDisable_1
??eMBDisable_0:
        LDR.N    R0,??DataTable5_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??eMBDisable_2
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??eMBDisable_1
??eMBDisable_2:
        MOVS     R0,#+6
        MOVS     R4,R0
??eMBDisable_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBPoll:
        PUSH     {R3-R5,LR}
        MOVS     R5,#+0
        LDR.N    R0,??DataTable5_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??eMBPoll_0
        MOVS     R0,#+6
        B.N      ??eMBPoll_1
??eMBPoll_0:
        ADD      R0,SP,#+0
        BL       xMBPortEventGet
        CMP      R0,#+1
        BNE.W    ??eMBPoll_2
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??eMBPoll_3
        CMP      R0,#+2
        BEQ.N    ??eMBPoll_4
        BCC.N    ??eMBPoll_5
        CMP      R0,#+3
        BEQ.N    ??eMBPoll_6
        B.N      ??eMBPoll_2
??eMBPoll_3:
        B.N      ??eMBPoll_2
??eMBPoll_5:
        LDR.N    R2,??DataTable5_26
        LDR.N    R1,??DataTable5_27
        LDR.N    R0,??DataTable5_28
        LDR.N    R3,??DataTable5_8
        LDR      R3,[R3, #+0]
        BLX      R3
        MOVS     R5,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??eMBPoll_7
        LDR.N    R0,??DataTable5_28
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BEQ.N    ??eMBPoll_8
        LDR.N    R0,??DataTable5_28
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??eMBPoll_7
??eMBPoll_8:
        MOVS     R0,#+2
        BL       xMBPortEventPost
??eMBPoll_7:
        B.N      ??eMBPoll_2
??eMBPoll_4:
        LDR.N    R0,??DataTable5_27
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_29
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_30
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        MOVS     R4,R0
??eMBPoll_9:
        CMP      R4,#+16
        BGE.N    ??eMBPoll_10
        LDR.N    R0,??DataTable5_25
        LDRB     R0,[R0, R4, LSL #+3]
        CMP      R0,#+0
        BEQ.N    ??eMBPoll_10
??eMBPoll_11:
        LDR.N    R0,??DataTable5_25
        LDRB     R0,[R0, R4, LSL #+3]
        LDR.N    R1,??DataTable5_29
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??eMBPoll_12
        LDR.N    R1,??DataTable5_26
        LDR.N    R0,??DataTable5_27
        LDR      R0,[R0, #+0]
        LDR.N    R2,??DataTable5_25
        ADDS     R2,R2,R4, LSL #+3
        LDR      R2,[R2, #+4]
        BLX      R2
        LDR.N    R1,??DataTable5_30
        STRB     R0,[R1, #+0]
        B.N      ??eMBPoll_10
??eMBPoll_12:
        ADDS     R4,R4,#+1
        B.N      ??eMBPoll_9
??eMBPoll_10:
        LDR.N    R0,??DataTable5_28
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??eMBPoll_13
        LDR.N    R0,??DataTable5_30
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??eMBPoll_14
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_26
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable5_29
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable5_27
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable5_26
        LDRH     R2,[R2, #+0]
        STRB     R0,[R2, R1]
        LDR.N    R0,??DataTable5_26
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_26
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable5_30
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_27
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable5_26
        LDRH     R2,[R2, #+0]
        STRB     R0,[R2, R1]
        LDR.N    R0,??DataTable5_26
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_26
        STRH     R0,[R1, #+0]
??eMBPoll_14:
        LDR.N    R0,??DataTable5_23
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??eMBPoll_15
        MOVS     R0,#+10
        BL       vMBPortTimersDelay
??eMBPoll_15:
        LDR.N    R0,??DataTable5_26
        LDRH     R2,[R0, #+0]
        LDR.N    R0,??DataTable5_27
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable5
        LDRB     R0,[R0, #+0]
        LDR.N    R3,??DataTable5_6
        LDR      R3,[R3, #+0]
        BLX      R3
        MOVS     R5,R0
??eMBPoll_13:
        B.N      ??eMBPoll_2
??eMBPoll_6:
??eMBPoll_2:
        MOVS     R0,#+0
??eMBPoll_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     ucMBAddress

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     eMBRTUStart

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     pvMBFrameStartCur

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     eMBRTUStop

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     pvMBFrameStopCur

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     eMBRTUSend

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     peMBFrameSendCur

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     eMBRTUReceive

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     peMBFrameReceiveCur

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     pvMBFrameCloseCur

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     xMBRTUReceiveFSM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     pxMBFrameCBByteReceived

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     xMBRTUTransmitFSM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     pxMBFrameCBTransmitterEmpty

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     xMBRTUTimerT35Expired

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     pxMBPortCBTimerExpired

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     eMBASCIIStart

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     eMBASCIIStop

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     eMBASCIISend

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_19:
        DC32     eMBASCIIReceive

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_20:
        DC32     xMBASCIIReceiveFSM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_21:
        DC32     xMBASCIITransmitFSM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_22:
        DC32     xMBASCIITimerT1SExpired

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_23:
        DC32     eMBCurrentMode

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_24:
        DC32     eMBState

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_25:
        DC32     xFuncHandlers

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_26:
        DC32     ??usLength

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_27:
        DC32     ??ucMBFrame

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_28:
        DC32     ??ucRcvAddress

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_29:
        DC32     ??ucFunctionCode

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_30:
        DC32     ??eException

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??ucMBFrame:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??ucRcvAddress:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??ucFunctionCode:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
??usLength:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??eException:
        DS8 1

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
//  51 bytes in section .bss
// 129 bytes in section .data
// 964 bytes in section .text
// 
// 964 bytes of CODE memory
// 180 bytes of DATA memory
//
//Errors: none
//Warnings: none
