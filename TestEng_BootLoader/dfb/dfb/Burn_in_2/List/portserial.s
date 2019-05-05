///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:36
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\modbus\modbus_port\portserial.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\modbus\modbus_port\portserial.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\portserial.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delay_ms
        EXTERN Disable_usart_rx
        EXTERN Disable_usart_tx
        EXTERN Enable_usart_rx
        EXTERN Enable_usart_tx
        EXTERN USART_ClearITPendingBit
        EXTERN USART_GetITStatus
        EXTERN USART_ITConfig
        EXTERN USART_ReceiveData
        EXTERN USART_SendData
        EXTERN pxMBFrameCBByteReceived
        EXTERN pxMBFrameCBTransmitterEmpty

        PUBLIC USART1_IRQHandler
        PUBLIC vMBPortClose
        PUBLIC vMBPortSerialEnable
        PUBLIC xMBPortSerialGetByte
        PUBLIC xMBPortSerialInit
        PUBLIC xMBPortSerialPutByte


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBPortSerialInit:
        PUSH     {R4}
        MOVS     R4,R0
        MOVS     R0,#+1
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
vMBPortClose:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       vMBPortSerialEnable
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
vMBPortSerialEnable:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??vMBPortSerialEnable_0
        BL       Enable_usart_rx
        MOVS     R2,#+1
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_ITConfig
        B.N      ??vMBPortSerialEnable_1
??vMBPortSerialEnable_0:
        BL       Disable_usart_rx
        MOVS     R2,#+0
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_ITConfig
??vMBPortSerialEnable_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??vMBPortSerialEnable_2
        BL       Enable_usart_tx
        MOVS     R2,#+1
        MOVW     R1,#+1831
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_ITConfig
        B.N      ??vMBPortSerialEnable_3
??vMBPortSerialEnable_2:
        MOVS     R0,#+5
        BL       Delay_ms
        BL       Disable_usart_tx
        MOVS     R2,#+0
        MOVW     R1,#+1831
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_ITConfig
??vMBPortSerialEnable_3:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBPortSerialPutByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_SendData
        MOVS     R0,#+1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBPortSerialGetByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_ReceiveData
        STRB     R0,[R4, #+0]
        MOVS     R0,#+1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
prvvUARTTxReadyISR:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable5_1
        LDR      R0,[R0, #+0]
        BLX      R0
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
prvvUARTRxISR:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        BLX      R0
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART1_IRQHandler:
        PUSH     {R7,LR}
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+1
        BNE.N    ??USART1_IRQHandler_0
        BL       prvvUARTRxISR
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_ClearITPendingBit
??USART1_IRQHandler_0:
        MOVW     R1,#+1831
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+1
        BNE.N    ??USART1_IRQHandler_1
        BL       prvvUARTTxReadyISR
        MOVW     R1,#+1831
        LDR.N    R0,??DataTable5  ;; 0x40013800
        BL       USART_ClearITPendingBit
??USART1_IRQHandler_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     pxMBFrameCBTransmitterEmpty

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     pxMBFrameCBByteReceived

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
// 244 bytes in section .text
// 
// 244 bytes of CODE memory
//
//Errors: none
//Warnings: none
