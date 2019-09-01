///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       01/Sep/2019  10:25:32
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_spi.c
//    Command line =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_spi.c
//        -lcN
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\
//        -lb
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\
//        -o
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --fpu=None --dlib_config "D:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootApp\inc\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootDrv\inc\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\BootOth\inc\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\..\Libraries\CMSIS\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\..\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\ascii\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\include\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\modbus_port\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\rtu\
//        -I
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\..\modbus\tcp\
//        -On -I "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        D:\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\stm32f10x_spi.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd
        EXTERN RCC_GetClocksFreq

        PUBLIC I2S_Cmd
        PUBLIC I2S_Init
        PUBLIC I2S_StructInit
        PUBLIC SPI_BiDirectionalLineConfig
        PUBLIC SPI_CalculateCRC
        PUBLIC SPI_Cmd
        PUBLIC SPI_DataSizeConfig
        PUBLIC SPI_GetCRC
        PUBLIC SPI_GetCRCPolynomial
        PUBLIC SPI_I2S_ClearFlag
        PUBLIC SPI_I2S_ClearITPendingBit
        PUBLIC SPI_I2S_DMACmd
        PUBLIC SPI_I2S_DeInit
        PUBLIC SPI_I2S_GetFlagStatus
        PUBLIC SPI_I2S_GetITStatus
        PUBLIC SPI_I2S_ITConfig
        PUBLIC SPI_I2S_ReceiveData
        PUBLIC SPI_I2S_SendData
        PUBLIC SPI_Init
        PUBLIC SPI_NSSInternalSoftwareConfig
        PUBLIC SPI_SSOutputCmd
        PUBLIC SPI_StructInit
        PUBLIC SPI_TransmitCRC


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.N    R0,??DataTable1  ;; 0x40013000
        CMP      R4,R0
        BNE.N    ??SPI_I2S_DeInit_0
        MOVS     R1,#+1
        MOV      R0,#+4096
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+4096
        BL       RCC_APB2PeriphResetCmd
        B.N      ??SPI_I2S_DeInit_1
??SPI_I2S_DeInit_0:
        LDR.N    R0,??DataTable1_1  ;; 0x40003800
        CMP      R4,R0
        BNE.N    ??SPI_I2S_DeInit_2
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+16384
        BL       RCC_APB1PeriphResetCmd
        B.N      ??SPI_I2S_DeInit_1
??SPI_I2S_DeInit_2:
        LDR.N    R0,??DataTable1_2  ;; 0x40003c00
        CMP      R4,R0
        BNE.N    ??SPI_I2S_DeInit_1
        MOVS     R1,#+1
        MOV      R0,#+32768
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+32768
        BL       RCC_APB1PeriphResetCmd
??SPI_I2S_DeInit_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_Init:
        PUSH     {R4}
        MOVS     R2,#+0
        LDRH     R3,[R0, #+0]
        MOVS     R2,R3
        ANDS     R2,R2,#0x3040
        LDRH     R3,[R1, #+0]
        LDRH     R4,[R1, #+2]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+4]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+6]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+8]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+10]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+12]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+14]
        ORRS     R3,R4,R3
        ORRS     R2,R3,R2
        STRH     R2,[R0, #+0]
        LDRH     R3,[R0, #+28]
        MOVW     R4,#+63487
        ANDS     R3,R4,R3
        STRH     R3,[R0, #+28]
        LDRH     R3,[R1, #+16]
        STRH     R3,[R0, #+16]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_Init:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R7,#+2
        MOVS     R8,#+0
        MOVS     R9,#+1
        MOVS     R10,#+0
        MOVS     R11,#+0
        LDRH     R0,[R4, #+28]
        MOVW     R1,#+61504
        ANDS     R0,R1,R0
        STRH     R0,[R4, #+28]
        MOVS     R0,#+2
        STRH     R0,[R4, #+32]
        LDRH     R0,[R4, #+28]
        MOVS     R6,R0
        LDR      R0,[R5, #+8]
        CMP      R0,#+2
        BNE.N    ??I2S_Init_0
        MOVS     R0,#+0
        MOV      R8,R0
        MOVS     R0,#+2
        MOVS     R7,R0
        B.N      ??I2S_Init_1
??I2S_Init_0:
        LDRH     R0,[R5, #+4]
        CMP      R0,#+0
        BNE.N    ??I2S_Init_2
        MOVS     R0,#+1
        MOV      R9,R0
        B.N      ??I2S_Init_3
??I2S_Init_2:
        MOVS     R0,#+2
        MOV      R9,R0
??I2S_Init_3:
        LDR.N    R0,??DataTable1_1  ;; 0x40003800
        CMP      R4,R0
        BNE.N    ??I2S_Init_4
        MOVS     R0,#+131072
        MOV      R10,R0
        B.N      ??I2S_Init_5
??I2S_Init_4:
        MOVS     R0,#+262144
        MOV      R10,R0
??I2S_Init_5:
        ADD      R0,SP,#+0
        BL       RCC_GetClocksFreq
        LDR      R0,[SP, #+0]
        MOV      R11,R0
        LDRH     R0,[R5, #+6]
        CMP      R0,#+512
        BNE.N    ??I2S_Init_6
        LSRS     R0,R11,#+8
        MOVS     R1,#+10
        MULS     R0,R1,R0
        LDR      R1,[R5, #+8]
        UDIV     R0,R0,R1
        ADDS     R0,R0,#+5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R10,R0
        B.N      ??I2S_Init_7
??I2S_Init_6:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LSLS     R0,R9,#+5
        UDIV     R0,R11,R0
        MOVS     R1,#+10
        MULS     R0,R1,R0
        LDR      R1,[R5, #+8]
        UDIV     R0,R0,R1
        ADDS     R0,R0,#+5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R10,R0
??I2S_Init_7:
        MOVS     R0,#+10
        UDIV     R10,R10,R0
        ANDS     R0,R10,#0x1
        MOV      R8,R0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R10,R8
        LSRS     R0,R0,#+1
        MOVS     R7,R0
        LSLS     R8,R8,#+8
??I2S_Init_1:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+2
        BLT.N    ??I2S_Init_8
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+255
        BLE.N    ??I2S_Init_9
??I2S_Init_8:
        MOVS     R0,#+2
        MOVS     R7,R0
        MOVS     R0,#+0
        MOV      R8,R0
??I2S_Init_9:
        LDRH     R0,[R5, #+6]
        ORRS     R0,R0,R8
        ORRS     R0,R0,R7
        STRH     R0,[R4, #+32]
        LDRH     R0,[R5, #+0]
        LDRH     R1,[R5, #+2]
        LDRH     R2,[R5, #+4]
        LDRH     R3,[R5, #+12]
        ORRS     R2,R3,R2
        ORRS     R1,R2,R1
        ORRS     R0,R1,R0
        ORRS     R0,R0,#0x800
        ORRS     R6,R0,R6
        STRH     R6,[R4, #+28]
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40003c00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_StructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        MOVS     R1,#+0
        STRH     R1,[R0, #+14]
        MOVS     R1,#+7
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_StructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+2
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SPI_Cmd_0
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x40
        STRH     R2,[R0, #+0]
        B.N      ??SPI_Cmd_1
??SPI_Cmd_0:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+65471
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
??SPI_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2S_Cmd_0
        LDRH     R2,[R0, #+28]
        ORRS     R2,R2,#0x400
        STRH     R2,[R0, #+28]
        B.N      ??I2S_Cmd_1
??I2S_Cmd_0:
        LDRH     R2,[R0, #+28]
        MOVW     R3,#+64511
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+28]
??I2S_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ITConfig:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R5,R1,#+4
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R3,R5
        MOVS     R5,#+1
        LSLS     R5,R5,R3
        MOVS     R4,R5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SPI_I2S_ITConfig_0
        LDRH     R5,[R0, #+4]
        ORRS     R5,R4,R5
        STRH     R5,[R0, #+4]
        B.N      ??SPI_I2S_ITConfig_1
??SPI_I2S_ITConfig_0:
        LDRH     R5,[R0, #+4]
        BICS     R5,R5,R4
        STRH     R5,[R0, #+4]
??SPI_I2S_ITConfig_1:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_DMACmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??SPI_I2S_DMACmd_0
        LDRH     R3,[R0, #+4]
        ORRS     R3,R1,R3
        STRH     R3,[R0, #+4]
        B.N      ??SPI_I2S_DMACmd_1
??SPI_I2S_DMACmd_0:
        LDRH     R3,[R0, #+4]
        BICS     R3,R3,R1
        STRH     R3,[R0, #+4]
??SPI_I2S_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_SendData:
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ReceiveData:
        LDRH     R0,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_NSSInternalSoftwareConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R2,#+65279
        CMP      R1,R2
        BEQ.N    ??SPI_NSSInternalSoftwareConfig_0
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x100
        STRH     R2,[R0, #+0]
        B.N      ??SPI_NSSInternalSoftwareConfig_1
??SPI_NSSInternalSoftwareConfig_0:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+65279
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
??SPI_NSSInternalSoftwareConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_SSOutputCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SPI_SSOutputCmd_0
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,#0x4
        STRH     R2,[R0, #+4]
        B.N      ??SPI_SSOutputCmd_1
??SPI_SSOutputCmd_0:
        LDRH     R2,[R0, #+4]
        MOVW     R3,#+65531
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+4]
??SPI_SSOutputCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_DataSizeConfig:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
        LDRH     R2,[R0, #+0]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_TransmitCRC:
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x1000
        STRH     R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_CalculateCRC:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??SPI_CalculateCRC_0
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x2000
        STRH     R2,[R0, #+0]
        B.N      ??SPI_CalculateCRC_1
??SPI_CalculateCRC_0:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+57343
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
??SPI_CalculateCRC_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetCRC:
        MOVS     R2,R0
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BEQ.N    ??SPI_GetCRC_0
        LDRH     R3,[R2, #+24]
        MOVS     R0,R3
        B.N      ??SPI_GetCRC_1
??SPI_GetCRC_0:
        LDRH     R3,[R2, #+20]
        MOVS     R0,R3
??SPI_GetCRC_1:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetCRCPolynomial:
        LDRH     R0,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_BiDirectionalLineConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+16384
        BNE.N    ??SPI_BiDirectionalLineConfig_0
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x4000
        STRH     R2,[R0, #+0]
        B.N      ??SPI_BiDirectionalLineConfig_1
??SPI_BiDirectionalLineConfig_0:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+49151
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
??SPI_BiDirectionalLineConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_GetFlagStatus:
        MOVS     R2,R0
        MOVS     R0,#+0
        LDRH     R3,[R2, #+8]
        TST      R3,R1
        BEQ.N    ??SPI_I2S_GetFlagStatus_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??SPI_I2S_GetFlagStatus_1
??SPI_I2S_GetFlagStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??SPI_I2S_GetFlagStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R1
        STRH     R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_GetITStatus:
        PUSH     {R4-R7}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R4,#+0
        MOVS     R6,#+1
        ANDS     R7,R1,#0xF
        LSLS     R6,R6,R7
        MOVS     R3,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R6,R1,#+4
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R5,R6
        MOVS     R6,#+1
        LSLS     R5,R6,R5
        LDRH     R6,[R2, #+4]
        ANDS     R6,R5,R6
        MOVS     R4,R6
        LDRH     R6,[R2, #+8]
        TST      R6,R3
        BEQ.N    ??SPI_I2S_GetITStatus_0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BEQ.N    ??SPI_I2S_GetITStatus_0
        MOVS     R6,#+1
        MOVS     R0,R6
        B.N      ??SPI_I2S_GetITStatus_1
??SPI_I2S_GetITStatus_0:
        MOVS     R6,#+0
        MOVS     R0,R6
??SPI_I2S_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ClearITPendingBit:
        PUSH     {R4}
        MOVS     R2,#+0
        MOVS     R3,#+1
        ANDS     R4,R1,#0xF
        LSLS     R3,R3,R4
        MOVS     R2,R3
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MVNS     R3,R2
        STRH     R3,[R0, #+8]
        POP      {R4}
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
// 912 bytes in section .text
// 
// 912 bytes of CODE memory
//
//Errors: none
//Warnings: none
