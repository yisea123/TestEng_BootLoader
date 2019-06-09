///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       09/Jun/2019  20:34:54
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\rtu\mbrtu.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\rtu\mbrtu.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\mbrtu.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN usMBCRC16
        EXTERN vMBPortSerialEnable
        EXTERN vMBPortTimersDisable
        EXTERN vMBPortTimersEnable
        EXTERN xMBPortEventPost
        EXTERN xMBPortSerialGetByte
        EXTERN xMBPortSerialInit
        EXTERN xMBPortSerialPutByte
        EXTERN xMBPortTimersInit

        PUBLIC eMBRTUInit
        PUBLIC eMBRTUReceive
        PUBLIC eMBRTUSend
        PUBLIC eMBRTUStart
        PUBLIC eMBRTUStop
        PUBLIC ucRTUBuf
        PUBLIC xMBRTUReceiveFSM
        PUBLIC xMBRTUTimerT35Expired
        PUBLIC xMBRTUTransmitFSM


        SECTION `.bss`:DATA:REORDER:NOROOT(0)
eSndState:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
eRcvState:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
ucRTUBuf:
        DS8 256

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pucSndBufferCur:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
usSndBufferCount:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
usRcvBufferPos:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRTUInit:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R8,#+0
        CPSID    I
        MOVS     R3,R7
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,#+8
        MOVS     R1,R6
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xMBPortSerialInit
        CMP      R0,#+1
        BEQ.N    ??eMBRTUInit_0
        MOVS     R0,#+3
        MOV      R8,R0
        B.N      ??eMBRTUInit_1
??eMBRTUInit_0:
        CMP      R6,#+19200
        BLS.N    ??eMBRTUInit_2
        MOVS     R0,#+35
        MOV      R9,R0
        B.N      ??eMBRTUInit_3
??eMBRTUInit_2:
        LDR.N    R0,??DataTable6  ;; 0x177fa0
        LSLS     R1,R6,#+1
        UDIV     R0,R0,R1
        MOV      R9,R0
??eMBRTUInit_3:
        MOV      R0,R9
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       xMBPortTimersInit
        CMP      R0,#+1
        BEQ.N    ??eMBRTUInit_1
        MOVS     R0,#+3
        MOV      R8,R0
??eMBRTUInit_1:
        CPSIE    I
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRTUStart:
        PUSH     {R7,LR}
        CPSID    I
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       vMBPortSerialEnable
        BL       vMBPortTimersEnable
        CPSIE    I
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRTUStop:
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
eMBRTUReceive:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,#+0
        MOVS     R8,#+0
        CPSID    I
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        CMP      R0,#+4
        BLT.N    ??eMBRTUReceive_0
        LDR.N    R0,??DataTable6_2
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_3
        BL       usMBCRC16
        CMP      R0,#+0
        BNE.N    ??eMBRTUReceive_0
        LDR.N    R0,??DataTable6_3
        LDRB     R0,[R0, #+0]
        STRB     R0,[R4, #+0]
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+3
        STRH     R0,[R6, #+0]
        LDR.N    R0,??DataTable6_4
        STR      R0,[R5, #+0]
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??eMBRTUReceive_1
??eMBRTUReceive_0:
        MOVS     R0,#+5
        MOV      R8,R0
??eMBRTUReceive_1:
        CPSIE    I
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
eMBRTUSend:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,#+0
        CPSID    I
        LDR.N    R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??eMBRTUSend_0
        SUBS     R0,R5,#+1
        LDR.N    R1,??DataTable6_5
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_6
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable6_5
        LDR      R0,[R0, #+0]
        STRB     R4,[R0, #+0]
        LDR.N    R0,??DataTable6_6
        LDRH     R0,[R0, #+0]
        ADDS     R0,R6,R0
        LDR.N    R1,??DataTable6_6
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable6_6
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable6_5
        LDR      R0,[R0, #+0]
        BL       usMBCRC16
        MOV      R8,R0
        LDR.N    R0,??DataTable6_6
        LDRH     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.N    R2,??DataTable6_6
        STRH     R1,[R2, #+0]
        LDR.N    R1,??DataTable6_3
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STRB     R8,[R0, R1]
        LDR.N    R0,??DataTable6_6
        LDRH     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.N    R2,??DataTable6_6
        STRH     R1,[R2, #+0]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LSRS     R1,R8,#+8
        LDR.N    R2,??DataTable6_3
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STRB     R1,[R0, R2]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       vMBPortSerialEnable
        B.N      ??eMBRTUSend_1
??eMBRTUSend_0:
        MOVS     R0,#+5
        MOVS     R7,R0
??eMBRTUSend_1:
        CPSIE    I
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBRTUReceiveFSM:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,#+0
        ADD      R0,SP,#+0
        BL       xMBPortSerialGetByte
        LDR.N    R1,??DataTable6_1
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??xMBRTUReceiveFSM_0
        CMP      R1,#+2
        BEQ.N    ??xMBRTUReceiveFSM_1
        BCC.N    ??xMBRTUReceiveFSM_2
        CMP      R1,#+3
        BEQ.N    ??xMBRTUReceiveFSM_3
        B.N      ??xMBRTUReceiveFSM_4
??xMBRTUReceiveFSM_0:
        BL       vMBPortTimersEnable
        B.N      ??xMBRTUReceiveFSM_4
??xMBRTUReceiveFSM_3:
        BL       vMBPortTimersEnable
        B.N      ??xMBRTUReceiveFSM_4
??xMBRTUReceiveFSM_2:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.N    R2,??DataTable6_2
        STRH     R1,[R2, #+0]
        LDRB     R1,[SP, #+0]
        LDR.N    R2,??DataTable6_3
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STRB     R1,[R0, R2]
        MOVS     R0,#+2
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        BL       vMBPortTimersEnable
        B.N      ??xMBRTUReceiveFSM_4
??xMBRTUReceiveFSM_1:
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        CMP      R0,#+255
        BGT.N    ??xMBRTUReceiveFSM_5
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        ADDS     R1,R0,#+1
        LDR.N    R2,??DataTable6_2
        STRH     R1,[R2, #+0]
        LDRB     R1,[SP, #+0]
        LDR.N    R2,??DataTable6_3
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STRB     R1,[R0, R2]
        B.N      ??xMBRTUReceiveFSM_6
??xMBRTUReceiveFSM_5:
        MOVS     R0,#+3
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
??xMBRTUReceiveFSM_6:
        BL       vMBPortTimersEnable
??xMBRTUReceiveFSM_4:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBRTUTransmitFSM:
        PUSH     {R4,LR}
        MOVS     R4,#+0
        LDR.N    R0,??DataTable6_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xMBRTUTransmitFSM_0
        CMP      R0,#+1
        BEQ.N    ??xMBRTUTransmitFSM_1
        B.N      ??xMBRTUTransmitFSM_2
??xMBRTUTransmitFSM_0:
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       vMBPortSerialEnable
        B.N      ??xMBRTUTransmitFSM_2
??xMBRTUTransmitFSM_1:
        LDR.N    R0,??DataTable6_6
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xMBRTUTransmitFSM_3
        LDR.N    R0,??DataTable6_5
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        BL       xMBPortSerialPutByte
        LDR.N    R0,??DataTable6_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_5
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable6_6
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable6_6
        STRH     R0,[R1, #+0]
        B.N      ??xMBRTUTransmitFSM_4
??xMBRTUTransmitFSM_3:
        MOVS     R0,#+3
        BL       xMBPortEventPost
        MOVS     R4,R0
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       vMBPortSerialEnable
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_7
        STRB     R0,[R1, #+0]
??xMBRTUTransmitFSM_4:
??xMBRTUTransmitFSM_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBRTUTimerT35Expired:
        PUSH     {R4,LR}
        MOVS     R4,#+0
        LDR.N    R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??xMBRTUTimerT35Expired_0
        CMP      R0,#+2
        BEQ.N    ??xMBRTUTimerT35Expired_1
        CMP      R0,#+3
        BEQ.N    ??xMBRTUTimerT35Expired_2
        B.N      ??xMBRTUTimerT35Expired_3
??xMBRTUTimerT35Expired_0:
        MOVS     R0,#+0
        BL       xMBPortEventPost
        MOVS     R4,R0
        B.N      ??xMBRTUTimerT35Expired_4
??xMBRTUTimerT35Expired_1:
        MOVS     R0,#+1
        BL       xMBPortEventPost
        MOVS     R4,R0
        B.N      ??xMBRTUTimerT35Expired_4
??xMBRTUTimerT35Expired_2:
        B.N      ??xMBRTUTimerT35Expired_4
??xMBRTUTimerT35Expired_3:
??xMBRTUTimerT35Expired_4:
        BL       vMBPortTimersDisable
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x177fa0

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
        DC32     ucRTUBuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     ucRTUBuf+0x1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     pucSndBufferCur

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     usSndBufferCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     eSndState

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
// 266 bytes in section .bss
// 668 bytes in section .text
// 
// 668 bytes of CODE memory
// 266 bytes of DATA memory
//
//Errors: none
//Warnings: 1
