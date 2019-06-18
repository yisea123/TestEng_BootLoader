///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       18/Jun/2019  23:23:56
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_cec.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_cec.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\stm32f10x_cec.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC CEC_ClearFlag
        PUBLIC CEC_ClearITPendingBit
        PUBLIC CEC_Cmd
        PUBLIC CEC_DeInit
        PUBLIC CEC_EndOfMessageCmd
        PUBLIC CEC_GetFlagStatus
        PUBLIC CEC_GetITStatus
        PUBLIC CEC_ITConfig
        PUBLIC CEC_Init
        PUBLIC CEC_OwnAddressConfig
        PUBLIC CEC_ReceiveDataByte
        PUBLIC CEC_SendDataByte
        PUBLIC CEC_SetPrescaler
        PUBLIC CEC_StartOfMessage


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+1073741824
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1073741824
        BL       RCC_APB1PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_Init:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable12  ;; 0x40007800
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        ANDS     R1,R1,#0xF3
        LDRH     R2,[R0, #+0]
        LDRH     R3,[R0, #+2]
        ORRS     R2,R3,R2
        ORRS     R1,R2,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R2,??DataTable12  ;; 0x40007800
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_Cmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_1  ;; 0x420f0000
        STR      R0,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??CEC_Cmd_0
??CEC_Cmd_1:
        LDR.N    R1,??DataTable12  ;; 0x40007800
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+31
        BMI.N    ??CEC_Cmd_1
??CEC_Cmd_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ITConfig:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_2  ;; 0x420f0004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_OwnAddressConfig:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_3  ;; 0x40007804
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_SetPrescaler:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable12_4  ;; 0x40007808
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_SendDataByte:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_5  ;; 0x40007814
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ReceiveDataByte:
        LDR.N    R0,??DataTable12_6  ;; 0x40007818
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_StartOfMessage:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable12_7  ;; 0x420f0200
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_EndOfMessageCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable12_8  ;; 0x420f0204
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_GetFlagStatus:
        PUSH     {R4}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        LDR.N    R4,??DataTable12  ;; 0x40007800
        MOVS     R3,R4
        LSRS     R4,R1,#+28
        MOVS     R2,R4
        LSLS     R1,R1,#+8        ;; ZeroExtS R1,R1,#+8,#+8
        LSRS     R1,R1,#+8
        CMP      R2,#+0
        BEQ.N    ??CEC_GetFlagStatus_0
        LSRS     R1,R1,#+16
        ADDS     R3,R3,#+12
        B.N      ??CEC_GetFlagStatus_1
??CEC_GetFlagStatus_0:
        ADDS     R3,R3,#+16
??CEC_GetFlagStatus_1:
        LDR      R4,[R3, #+0]
        TST      R4,R1
        BEQ.N    ??CEC_GetFlagStatus_2
        MOVS     R4,#+1
        MOVS     R0,R4
        B.N      ??CEC_GetFlagStatus_3
??CEC_GetFlagStatus_2:
        MOVS     R4,#+0
        MOVS     R0,R4
??CEC_GetFlagStatus_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ClearFlag:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable12_9  ;; 0x40007810
        LDR      R2,[R2, #+0]
        ANDS     R2,R2,#0x2
        MOVS     R1,R2
        LDR.N    R2,??DataTable12_9  ;; 0x40007810
        LDR      R2,[R2, #+0]
        MVNS     R3,R0
        LSRS     R3,R3,#+2
        LSLS     R3,R3,#+2
        ORRS     R3,R1,R3
        ANDS     R2,R3,R2
        LDR.N    R3,??DataTable12_9  ;; 0x40007810
        STR      R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_GetITStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        LDR.N    R3,??DataTable12  ;; 0x40007800
        LDR      R3,[R3, #+0]
        ANDS     R3,R3,#0x2
        MOVS     R2,R3
        LDR.N    R3,??DataTable12_9  ;; 0x40007810
        LDR      R3,[R3, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        TST      R3,R1
        BEQ.N    ??CEC_GetITStatus_0
        CMP      R2,#+0
        BEQ.N    ??CEC_GetITStatus_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??CEC_GetITStatus_1
??CEC_GetITStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??CEC_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ClearITPendingBit:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable12_9  ;; 0x40007810
        LDR      R2,[R2, #+0]
        ANDS     R2,R2,#0x2
        MOVS     R1,R2
        LDR.N    R2,??DataTable12_9  ;; 0x40007810
        LDR      R2,[R2, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MVNS     R3,R0
        LSRS     R3,R3,#+2
        LSLS     R3,R3,#+2
        ORRS     R3,R1,R3
        ANDS     R2,R3,R2
        LDR.N    R3,??DataTable12_9  ;; 0x40007810
        STR      R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x40007800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x420f0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0x420f0004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0x40007804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     0x40007808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0x40007814

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     0x40007818

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     0x420f0200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     0x420f0204

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     0x40007810

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
// 336 bytes in section .text
// 
// 336 bytes of CODE memory
//
//Errors: none
//Warnings: none
