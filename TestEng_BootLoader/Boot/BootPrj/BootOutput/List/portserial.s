///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  16:32:36
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\modbus_port\portserial.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\modbus\modbus_port\portserial.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\portserial.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BootApp_Disable_usart_rx
        EXTERN BootApp_Disable_usart_tx
        EXTERN BootApp_Enable_usart_rx
        EXTERN BootApp_Enable_usart_tx
        EXTERN BootApp_Get_Uart
        EXTERN Delay_ms
        EXTERN USART_ClearITPendingBit
        EXTERN USART_GetITStatus
        EXTERN USART_ITConfig
        EXTERN USART_ReceiveData
        EXTERN USART_SendData
        EXTERN pxMBFrameCBByteReceived
        EXTERN pxMBFrameCBTransmitterEmpty

        PUBLIC MB_USART_PORT
        PUBLIC USART1_IRQHandler
        PUBLIC vMBPortClose
        PUBLIC vMBPortSerialEnable
        PUBLIC xMBPortSerialGetByte
        PUBLIC xMBPortSerialInit
        PUBLIC xMBPortSerialPutByte


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
MB_USART_PORT:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBPortSerialInit:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR.N    R0,??DataTable6
        BL       BootApp_Get_Uart
        MOVS     R0,#+1
        POP      {R1,R4-R7,PC}    ;; return

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
        BL       BootApp_Enable_usart_rx
        MOVS     R2,#+1
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       USART_ITConfig
        B.N      ??vMBPortSerialEnable_1
??vMBPortSerialEnable_0:
        BL       BootApp_Disable_usart_rx
        MOVS     R2,#+0
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       USART_ITConfig
??vMBPortSerialEnable_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??vMBPortSerialEnable_2
        BL       BootApp_Enable_usart_tx
        MOVS     R2,#+1
        MOVW     R1,#+1831
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       USART_ITConfig
        B.N      ??vMBPortSerialEnable_3
??vMBPortSerialEnable_2:
        MOVS     R0,#+5
        BL       Delay_ms
        BL       BootApp_Disable_usart_tx
        MOVS     R2,#+0
        MOVW     R1,#+1831
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
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
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       USART_SendData
        MOVS     R0,#+1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xMBPortSerialGetByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       USART_ReceiveData
        STRB     R0,[R4, #+0]
        MOVS     R0,#+1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
prvvUARTTxReadyISR:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        BLX      R0
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
prvvUARTRxISR:
        PUSH     {R7,LR}
        LDR.N    R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        BLX      R0
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART1_IRQHandler:
        PUSH     {R7,LR}
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       USART_GetITStatus
        CMP      R0,#+1
        BNE.N    ??USART1_IRQHandler_0
        BL       prvvUARTRxISR
        MOVW     R1,#+1317
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       USART_ClearITPendingBit
??USART1_IRQHandler_0:
        MOVW     R1,#+1831
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       USART_GetITStatus
        CMP      R0,#+1
        BNE.N    ??USART1_IRQHandler_1
        BL       prvvUARTTxReadyISR
        MOVW     R1,#+1831
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       USART_ClearITPendingBit
??USART1_IRQHandler_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     MB_USART_PORT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     pxMBFrameCBTransmitterEmpty

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
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
//   4 bytes in section .bss
// 274 bytes in section .text
// 
// 274 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
