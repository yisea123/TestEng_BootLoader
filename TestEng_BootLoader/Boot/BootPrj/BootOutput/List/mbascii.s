///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  16:32:33
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\ascii\mbascii.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\ascii\mbascii.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\mbascii.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ucRTUBuf
        EXTERN vMBPortSerialEnable
        EXTERN vMBPortTimersDisable
        EXTERN vMBPortTimersEnable
        EXTERN xMBPortEventPost
        EXTERN xMBPortSerialGetByte
        EXTERN xMBPortSerialInit
        EXTERN xMBPortSerialPutByte
        EXTERN xMBPortTimersInit

        PUBLIC eMBASCIIInit
        PUBLIC eMBASCIIReceive
        PUBLIC eMBASCIISend
        PUBLIC eMBASCIIStart
        PUBLIC eMBASCIIStop
        PUBLIC xMBASCIIReceiveFSM
        PUBLIC xMBASCIITimerT1SExpired
        PUBLIC xMBASCIITransmitFSM


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
eSndState:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
eRcvState:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
ucASCIIBuf:
        DATA
        DC32 ucRTUBuf

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
usRcvBufferPos:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
eBytePos:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pucSndBufferCur:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
usSndBufferCount:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
ucMBLFCharacter:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBASCIIInit:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R8,#+0
        CPSID    I
        MOVS     R0,#+10
        LDR.W    R1,??DataTable6
        STRB     R0,[R1, #+0]
        MOVS     R3,R7
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,#+7
        MOVS     R1,R6
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xMBPortSerialInit
        CMP      R0,#+1
        BEQ.N    ??eMBASCIIInit_0
        MOVS     R0,#+3
        MOV      R8,R0
        B.N      ??eMBASCIIInit_1
??eMBASCIIInit_0:
        MOVW     R0,#+20000
        BL       xMBPortTimersInit
        CMP      R0,#+1
        BEQ.N    ??eMBASCIIInit_1
        MOVS     R0,#+3
        MOV      R8,R0
??eMBASCIIInit_1:
        CPSIE    I
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBASCIIStart:
        PUSH     {R7,LR}
        CPSID    I
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       vMBPortSerialEnable
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        CPSIE    I
        MOVS     R0,#+0
        BL       xMBPortEventPost
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBASCIIStop:
        PUSH     {R7,LR}
        CPSID    I
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       vMBPortSerialEnable
        BL       vMBPortTimersDisable
        CPSIE    I
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBASCIIReceive:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,#+0
        CPSID    I
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        CMP      R0,#+3
        BLT.N    ??eMBASCIIReceive_0
        LDR.N    R0,??DataTable6_2
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        BL       prvucMBLRC
        CMP      R0,#+0
        BNE.N    ??eMBASCIIReceive_0
        LDR.N    R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        STRB     R0,[R4, #+0]
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+2
        STRH     R0,[R6, #+0]
        LDR.N    R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[R5, #+0]
        B.N      ??eMBASCIIReceive_1
??eMBASCIIReceive_0:
        MOVS     R0,#+5
        MOVS     R7,R0
??eMBASCIIReceive_1:
        CPSIE    I
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBASCIISend:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,#+0
        CPSID    I
        LDR.N    R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??eMBASCIISend_0
        SUBS     R0,R5,#+1
        LDR.N    R1,??DataTable6_4
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_5
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        STRB     R4,[R0, #+0]
        LDR.N    R0,??DataTable6_5
        LDRH     R0,[R0, #+0]
        ADDS     R0,R6,R0
        LDR.N    R1,??DataTable6_5
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable6_5
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        BL       prvucMBLRC
        MOV      R8,R0
        LDR.N    R0,??DataTable6_5
        LDRH     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.N    R2,??DataTable6_5
        STRH     R1,[R2, #+0]
        LDR.N    R1,??DataTable6_3
        LDR      R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STRB     R8,[R0, R1]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_6
        STRB     R0,[R1, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       vMBPortSerialEnable
        B.N      ??eMBASCIISend_1
??eMBASCIISend_0:
        MOVS     R0,#+5
        MOVS     R7,R0
??eMBASCIISend_1:
        CPSIE    I
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBASCIIReceiveFSM:
        PUSH     {R3-R5,LR}
        MOVS     R4,#+0
        ADD      R0,SP,#+0
        BL       xMBPortSerialGetByte
        LDR.N    R1,??DataTable6_1
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??xMBASCIIReceiveFSM_0
        CMP      R1,#+2
        BEQ.N    ??xMBASCIIReceiveFSM_1
        BCS.N    ??xMBASCIIReceiveFSM_2
??xMBASCIIReceiveFSM_3:
        BL       vMBPortTimersEnable
        LDRB     R0,[SP, #+0]
        CMP      R0,#+58
        BNE.N    ??xMBASCIIReceiveFSM_4
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2
        STRH     R0,[R1, #+0]
        B.N      ??xMBASCIIReceiveFSM_5
??xMBASCIIReceiveFSM_4:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+13
        BNE.N    ??xMBASCIIReceiveFSM_6
        MOVS     R0,#+2
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        B.N      ??xMBASCIIReceiveFSM_5
??xMBASCIIReceiveFSM_6:
        LDRB     R0,[SP, #+0]
        BL       prvucMBCHAR2BIN
        MOVS     R5,R0
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xMBASCIIReceiveFSM_7
        CMP      R0,#+1
        BEQ.N    ??xMBASCIIReceiveFSM_8
        B.N      ??xMBASCIIReceiveFSM_5
??xMBASCIIReceiveFSM_7:
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        CMP      R0,#+255
        BGT.N    ??xMBASCIIReceiveFSM_9
        LSLS     R0,R5,#+4
        LDR.N    R1,??DataTable6_3
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable6_2
        LDRH     R2,[R2, #+0]
        STRB     R0,[R2, R1]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
        B.N      ??xMBASCIIReceiveFSM_5
??xMBASCIIReceiveFSM_9:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        BL       vMBPortTimersDisable
        B.N      ??xMBASCIIReceiveFSM_5
??xMBASCIIReceiveFSM_8:
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable6_3
        LDR      R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R0, R1]
        ORRS     R1,R5,R1
        LDR.N    R2,??DataTable6_3
        LDR      R2,[R2, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STRB     R1,[R0, R2]
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_2
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
??xMBASCIIReceiveFSM_5:
        B.N      ??xMBASCIIReceiveFSM_2
??xMBASCIIReceiveFSM_1:
        LDRB     R0,[SP, #+0]
        LDR.N    R1,??DataTable6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??xMBASCIIReceiveFSM_10
        BL       vMBPortTimersDisable
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        BL       xMBPortEventPost
        MOVS     R4,R0
        B.N      ??xMBASCIIReceiveFSM_11
??xMBASCIIReceiveFSM_10:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+58
        BNE.N    ??xMBASCIIReceiveFSM_12
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2
        STRH     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        BL       vMBPortTimersEnable
        B.N      ??xMBASCIIReceiveFSM_11
??xMBASCIIReceiveFSM_12:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
??xMBASCIIReceiveFSM_11:
        B.N      ??xMBASCIIReceiveFSM_2
??xMBASCIIReceiveFSM_0:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+58
        BNE.N    ??xMBASCIIReceiveFSM_13
        BL       vMBPortTimersEnable
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
??xMBASCIIReceiveFSM_13:
??xMBASCIIReceiveFSM_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBASCIITransmitFSM:
        PUSH     {R3-R5,LR}
        MOVS     R4,#+0
        LDR.N    R0,??DataTable6_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xMBASCIITransmitFSM_0
        CMP      R0,#+2
        BEQ.N    ??xMBASCIITransmitFSM_1
        BCC.N    ??xMBASCIITransmitFSM_2
        CMP      R0,#+4
        BEQ.N    ??xMBASCIITransmitFSM_3
        BCC.N    ??xMBASCIITransmitFSM_4
        B.N      ??xMBASCIITransmitFSM_5
??xMBASCIITransmitFSM_2:
        MOVS     R0,#+58
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xMBPortSerialPutByte
        MOVS     R0,#+2
        LDR.N    R1,??DataTable6_6
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
        B.N      ??xMBASCIITransmitFSM_5
??xMBASCIITransmitFSM_1:
        LDR.N    R0,??DataTable6_5
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xMBASCIITransmitFSM_6
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xMBASCIITransmitFSM_7
        CMP      R0,#+1
        BEQ.N    ??xMBASCIITransmitFSM_8
        B.N      ??xMBASCIITransmitFSM_9
??xMBASCIITransmitFSM_7:
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+4
        BL       prvucMBBIN2CHAR
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xMBPortSerialPutByte
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
        B.N      ??xMBASCIITransmitFSM_9
??xMBASCIITransmitFSM_8:
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xF
        BL       prvucMBBIN2CHAR
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xMBPortSerialPutByte
        LDR.N    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_4
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable6_5
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable6_5
        STRH     R0,[R1, #+0]
        B.N      ??xMBASCIITransmitFSM_9
??xMBASCIITransmitFSM_6:
        MOVS     R0,#+13
        BL       xMBPortSerialPutByte
        MOVS     R0,#+3
        LDR.N    R1,??DataTable6_6
        STRB     R0,[R1, #+0]
??xMBASCIITransmitFSM_9:
        B.N      ??xMBASCIITransmitFSM_5
??xMBASCIITransmitFSM_4:
        LDR.N    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        BL       xMBPortSerialPutByte
        MOVS     R0,#+4
        LDR.N    R1,??DataTable6_6
        STRB     R0,[R1, #+0]
        B.N      ??xMBASCIITransmitFSM_5
??xMBASCIITransmitFSM_3:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_6
        STRB     R0,[R1, #+0]
        MOVS     R0,#+3
        BL       xMBPortEventPost
        MOVS     R4,R0
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       vMBPortSerialEnable
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_6
        STRB     R0,[R1, #+0]
        B.N      ??xMBASCIITransmitFSM_5
??xMBASCIITransmitFSM_0:
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       vMBPortSerialEnable
??xMBASCIITransmitFSM_5:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBASCIITimerT1SExpired:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        CMP      R0,#+1
        BHI.N    ??xMBASCIITimerT1SExpired_0
??xMBASCIITimerT1SExpired_1:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        B.N      ??xMBASCIITimerT1SExpired_2
??xMBASCIITimerT1SExpired_0:
??xMBASCIITimerT1SExpired_2:
        BL       vMBPortTimersDisable
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     ucMBLFCharacter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     eRcvState

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     usRcvBufferPos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     ucASCIIBuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     pucSndBufferCur

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     usSndBufferCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     eSndState

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     eBytePos

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
prvucMBCHAR2BIN:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+48
        BLT.N    ??prvucMBCHAR2BIN_0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+58
        BGE.N    ??prvucMBCHAR2BIN_0
        SUBS     R0,R1,#+48
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??prvucMBCHAR2BIN_1
??prvucMBCHAR2BIN_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+65
        BLT.N    ??prvucMBCHAR2BIN_2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+71
        BGE.N    ??prvucMBCHAR2BIN_2
        SUBS     R0,R1,#+55
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??prvucMBCHAR2BIN_1
??prvucMBCHAR2BIN_2:
        MOVS     R0,#+255
??prvucMBCHAR2BIN_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
prvucMBBIN2CHAR:
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BGE.N    ??prvucMBBIN2CHAR_0
        ADDS     R0,R1,#+48
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??prvucMBBIN2CHAR_1
??prvucMBBIN2CHAR_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BLT.N    ??prvucMBBIN2CHAR_2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+16
        BGE.N    ??prvucMBBIN2CHAR_2
        ADDS     R0,R1,#+55
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??prvucMBBIN2CHAR_1
??prvucMBBIN2CHAR_2:
        MOVS     R0,#+48
??prvucMBBIN2CHAR_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
prvucMBLRC:
        MOVS     R2,R0
        MOVS     R0,#+0
??prvucMBLRC_0:
        MOVS     R3,R1
        SUBS     R1,R3,#+1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+0
        BEQ.N    ??prvucMBLRC_1
        LDRB     R3,[R2, #+0]
        ADDS     R0,R3,R0
        ADDS     R2,R2,#+1
        B.N      ??prvucMBLRC_0
??prvucMBLRC_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        RSBS     R0,R0,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
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
//    12 bytes in section .bss
//     4 bytes in section .data
// 1 000 bytes in section .text
// 
// 1 000 bytes of CODE memory
//    16 bytes of DATA memory
//
//Errors: none
//Warnings: 1
