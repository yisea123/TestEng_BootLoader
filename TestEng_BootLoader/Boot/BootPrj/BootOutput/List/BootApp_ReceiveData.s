///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       09/Jun/2019  21:27:04
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_ReceiveData.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_ReceiveData.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_ReceiveData.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memclr4

        PUBLIC BootApp_Enable_ReceiveData
        PUBLIC BootApp_Get_Command
        PUBLIC BootApp_Get_ReceiveData_Info
        PUBLIC BootApp_NewCmd_Received
        PUBLIC BootApp_PageBuffer_Read
        PUBLIC BootApp_ReceiveData_st
        PUBLIC BootApp_Receive_Data
        PUBLIC BootApp_Receive_Data_Finish
        PUBLIC BootApp_SectBuffer_Read
        PUBLIC BootApp_SectBuffer_Write
        PUBLIC BootApp_SectBuffer_en
        PUBLIC BootApp_Sect_Dirty_Msk_au16


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
BootApp_SectBuffer_en:
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
BootApp_ReceiveData_st:
        DS8 24

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC16 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
BootApp_Sect_Dirty_Msk_au16:
        DATA
        DC16 0, 1, 3, 7, 15, 31, 63, 127, 255, 511, 1023, 2047, 4095, 8191
        DC16 16383, 32767, 65535
        DC8 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_NewCmd_Received:
        MOVS     R1,R0
        LDR      R2,[R1, #+60]
        LDR.W    R3,??DataTable6
        LDR      R3,[R3, #+0]
        CMP      R2,R3
        BEQ.N    ??BootApp_NewCmd_Received_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??BootApp_NewCmd_Received_1
??BootApp_NewCmd_Received_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??BootApp_NewCmd_Received_1:
        LDR      R2,[R1, #+60]
        LDR.W    R3,??DataTable6
        STR      R2,[R3, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??magic_num:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Get_Command:
        MOVS     R1,R0
        LDRH     R2,[R1, #+0]
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+7
        BLT.N    ??BootApp_Get_Command_0
        MOVS     R2,#+1
        MOVS     R0,R2
??BootApp_Get_Command_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_SectBuffer_Write:
        PUSH     {R4,R5}
        MOVS     R3,R0
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+256
        BGT.N    ??BootApp_SectBuffer_Write_0
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R5,R1,R3
        CMP      R5,#+256
        BGT.N    ??BootApp_SectBuffer_Write_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??BootApp_SectBuffer_Write_0
        CMP      R2,#+0
        BNE.N    ??BootApp_SectBuffer_Write_1
??BootApp_SectBuffer_Write_0:
        MOVS     R5,#+0
        MOVS     R0,R5
        B.N      ??BootApp_SectBuffer_Write_2
??BootApp_SectBuffer_Write_1:
        LDR.W    R5,??DataTable6_1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R5,R5,R3, LSL #+2
        MOVS     R4,R5
??BootApp_SectBuffer_Write_3:
        MOVS     R5,R1
        SUBS     R1,R5,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??BootApp_SectBuffer_Write_4
        LDR      R5,[R2, #+0]
        STR      R5,[R4, #+0]
        ADDS     R2,R2,#+4
        ADDS     R4,R4,#+4
        B.N      ??BootApp_SectBuffer_Write_3
??BootApp_SectBuffer_Write_4:
        MOVS     R5,#+1
        MOVS     R0,R5
??BootApp_SectBuffer_Write_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_SectBuffer_Read:
        PUSH     {R4,R5}
        MOVS     R3,R0
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+512
        BGE.N    ??BootApp_SectBuffer_Read_0
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R5,R1,R3
        CMP      R5,#+512
        BGE.N    ??BootApp_SectBuffer_Read_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??BootApp_SectBuffer_Read_0
        CMP      R2,#+0
        BNE.N    ??BootApp_SectBuffer_Read_1
??BootApp_SectBuffer_Read_0:
        MOVS     R5,#+0
        MOVS     R0,R5
        B.N      ??BootApp_SectBuffer_Read_2
??BootApp_SectBuffer_Read_1:
        LDR.W    R5,??DataTable6_1
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R5,R5,R3, LSL #+2
        MOVS     R4,R5
??BootApp_SectBuffer_Read_3:
        MOVS     R5,R1
        SUBS     R1,R5,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??BootApp_SectBuffer_Read_4
        LDR      R5,[R4, #+0]
        STR      R5,[R2, #+0]
        ADDS     R4,R4,#+4
        ADDS     R2,R2,#+4
        B.N      ??BootApp_SectBuffer_Read_3
??BootApp_SectBuffer_Read_4:
        MOVS     R5,#+1
        MOVS     R0,R5
??BootApp_SectBuffer_Read_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_PageBuffer_Read:
        PUSH     {R4-R6}
        MOVS     R4,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+129
        BGE.N    ??BootApp_PageBuffer_Read_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R6,R2,R1
        CMP      R6,#+129
        BGE.N    ??BootApp_PageBuffer_Read_0
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BEQ.N    ??BootApp_PageBuffer_Read_0
        CMP      R3,#+0
        BNE.N    ??BootApp_PageBuffer_Read_1
??BootApp_PageBuffer_Read_0:
        MOVS     R6,#+0
        MOVS     R0,R6
        B.N      ??BootApp_PageBuffer_Read_2
??BootApp_PageBuffer_Read_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ADDS     R6,R4,R1, LSL #+2
        MOVS     R5,R6
??BootApp_PageBuffer_Read_3:
        MOVS     R6,R2
        SUBS     R2,R6,#+1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??BootApp_PageBuffer_Read_4
        LDR      R6,[R5, #+0]
        STR      R6,[R3, #+0]
        ADDS     R5,R5,#+4
        ADDS     R3,R3,#+4
        B.N      ??BootApp_PageBuffer_Read_3
??BootApp_PageBuffer_Read_4:
        MOVS     R6,#+1
        MOVS     R0,R6
??BootApp_PageBuffer_Read_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Receive_Data:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+24
        MOVS     R7,R0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVW     R6,#+12289
        ADD      R0,SP,#+0
        MOVS     R1,#+24
        BL       __aeabi_memclr4
        LDR.W    R8,??DataTable6_2
        MOV      R9,R7
        ADDS     R10,R7,#+256
        CPSID    I
        LDRH     R0,[R9, #+2]
        STRH     R0,[SP, #+12]
        LDRH     R0,[R9, #+4]
        STRH     R0,[SP, #+0]
        LDRH     R0,[R9, #+6]
        STRH     R0,[SP, #+2]
        LDRH     R0,[R9, #+8]
        STRH     R0,[SP, #+4]
        LDRH     R0,[R9, #+10]
        STRH     R0,[SP, #+6]
        LDR      R0,[R9, #+32]
        STR      R0,[SP, #+16]
        LDR      R0,[R9, #+36]
        STR      R0,[SP, #+20]
        CPSIE    I
        LDRH     R0,[R8, #+8]
        STRH     R0,[SP, #+8]
        LDRH     R0,[R8, #+10]
        STRH     R0,[SP, #+10]
        LDRH     R0,[SP, #+10]
        CMP      R0,#+0
        BEQ.N    ??BootApp_Receive_Data_0
        MOVW     R0,#+12292
        MOVS     R6,R0
        MOVS     R0,R6
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??BootApp_Receive_Data_1
??BootApp_Receive_Data_0:
        LDRH     R0,[SP, #+12]
        CMP      R0,#+81
        BGE.N    ??BootApp_Receive_Data_2
        LDRH     R0,[SP, #+12]
        CMP      R0,#+0
        BEQ.N    ??BootApp_Receive_Data_2
        LDRH     R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??BootApp_Receive_Data_3
        LDRH     R0,[R8, #+12]
        LDRH     R1,[SP, #+12]
        CMP      R0,R1
        BNE.N    ??BootApp_Receive_Data_4
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_5
??BootApp_Receive_Data_4:
        MOVW     R0,#+12294
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_5
??BootApp_Receive_Data_3:
        LDRH     R0,[SP, #+12]
        LDRH     R1,[R8, #+12]
        ADDS     R1,R1,#+1
        CMP      R0,R1
        BNE.N    ??BootApp_Receive_Data_6
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_5
??BootApp_Receive_Data_6:
        MOVW     R0,#+12295
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_5
??BootApp_Receive_Data_2:
        MOVW     R0,#+12293
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??BootApp_Receive_Data_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Receive_Data_7
        LDRH     R0,[SP, #+0]
        CMP      R0,#+5
        BGE.N    ??BootApp_Receive_Data_8
        LDRH     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??BootApp_Receive_Data_8
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_7
??BootApp_Receive_Data_8:
        MOVW     R0,#+12296
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??BootApp_Receive_Data_7:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Receive_Data_9
        LDRH     R0,[SP, #+2]
        CMP      R0,#+256
        BNE.N    ??BootApp_Receive_Data_10
        LDRH     R0,[SP, #+2]
        LDRH     R1,[SP, #+6]
        LDRH     R2,[SP, #+4]
        SUBS     R1,R1,R2
        ADDS     R1,R1,#+1
        CMP      R0,R1
        BNE.N    ??BootApp_Receive_Data_10
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_9
??BootApp_Receive_Data_10:
        MOVW     R0,#+12297
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??BootApp_Receive_Data_9:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Receive_Data_11
        LDRB     R0,[SP, #+4]
        LSLS     R0,R0,#+24
        BNE.N    ??BootApp_Receive_Data_12
        LDRH     R0,[SP, #+4]
        LDRH     R1,[SP, #+0]
        SUBS     R1,R1,#+1
        MOV      R2,#+256
        MULS     R1,R2,R1
        CMP      R0,R1
        BNE.N    ??BootApp_Receive_Data_12
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_11
??BootApp_Receive_Data_12:
        MOVW     R0,#+12298
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??BootApp_Receive_Data_11:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Receive_Data_13
        LDRH     R0,[SP, #+8]
        LDR.N    R1,??DataTable6_3
        LDRH     R2,[SP, #+0]
        ADDS     R1,R1,R2, LSL #+1
        LDRH     R1,[R1, #-2]
        CMP      R0,R1
        BNE.N    ??BootApp_Receive_Data_14
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_13
??BootApp_Receive_Data_14:
        MOVW     R0,#+12299
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??BootApp_Receive_Data_13:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Receive_Data_15
        LDR      R0,[SP, #+20]
        LDR      R1,[SP, #+16]
        SUBS     R0,R0,R1
        ADDS     R0,R0,#+1
        CMP      R0,#+1024
        BNE.N    ??BootApp_Receive_Data_16
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_15
??BootApp_Receive_Data_16:
        MOVW     R0,#+12300
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??BootApp_Receive_Data_15:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Receive_Data_17
        LDR      R0,[SP, #+16]
        LDR.N    R1,??DataTable6_4  ;; 0x800c000
        CMP      R0,R1
        BCC.N    ??BootApp_Receive_Data_18
        LDR      R0,[SP, #+20]
        LDR.N    R1,??DataTable6_5  ;; 0x8020000
        CMP      R0,R1
        BCS.N    ??BootApp_Receive_Data_18
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_17
??BootApp_Receive_Data_18:
        MOVW     R0,#+12301
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??BootApp_Receive_Data_17:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Receive_Data_19
        LDRH     R0,[R8, #+12]
        CMP      R0,#+0
        BNE.N    ??BootApp_Receive_Data_20
        LDR      R0,[SP, #+16]
        LDR.N    R1,??DataTable6_4  ;; 0x800c000
        CMP      R0,R1
        BNE.N    ??BootApp_Receive_Data_21
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_19
??BootApp_Receive_Data_21:
        MOVW     R0,#+12302
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_19
??BootApp_Receive_Data_20:
        LDR      R0,[SP, #+16]
        LDRH     R1,[SP, #+12]
        MOV      R2,#+1024
        LDR.N    R3,??DataTable6_6  ;; 0x800bc00
        MLA      R1,R2,R1,R3
        CMP      R0,R1
        BNE.N    ??BootApp_Receive_Data_22
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??BootApp_Receive_Data_19
??BootApp_Receive_Data_22:
        MOVW     R0,#+12303
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??BootApp_Receive_Data_19:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Receive_Data_23
        MOV      R2,R10
        LDRH     R0,[SP, #+2]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R1,R0,#+2
        LDRH     R0,[SP, #+4]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+2
        BL       BootApp_SectBuffer_Write
        MOVS     R5,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??BootApp_Receive_Data_24
        LDRH     R0,[SP, #+0]
        STRH     R0,[R8, #+0]
        LDRH     R0,[SP, #+2]
        STRH     R0,[R8, #+2]
        LDRH     R0,[SP, #+4]
        STRH     R0,[R8, #+4]
        LDRH     R0,[SP, #+6]
        STRH     R0,[R8, #+6]
        LDRH     R0,[SP, #+12]
        STRH     R0,[R8, #+12]
        LDR      R0,[SP, #+16]
        STR      R0,[R8, #+16]
        LDR      R0,[SP, #+20]
        STR      R0,[R8, #+20]
        LDRH     R0,[R8, #+8]
        MOVS     R1,#+1
        LDRH     R2,[SP, #+0]
        SUBS     R2,R2,#+1
        LSLS     R1,R1,R2
        ORRS     R0,R1,R0
        STRH     R0,[R8, #+8]
        LDRH     R0,[R8, #+8]
        LDR.N    R1,??DataTable6_3
        LDRH     R1,[R1, #+8]
        CMP      R0,R1
        BNE.N    ??BootApp_Receive_Data_25
        MOVS     R0,#+1
        STRH     R0,[R8, #+10]
        MOVS     R0,#+0
        STRH     R0,[R8, #+8]
        MOVS     R0,#+0
        STRH     R0,[R8, #+0]
        MOVS     R0,#+0
        STRH     R0,[R8, #+2]
        MOVS     R0,#+0
        STRH     R0,[R8, #+4]
        MOVS     R0,#+0
        STRH     R0,[R8, #+6]
        MOVW     R0,#+12291
        MOVS     R6,R0
        B.N      ??BootApp_Receive_Data_23
??BootApp_Receive_Data_25:
        MOVS     R0,#+0
        STRH     R0,[R8, #+10]
        MOVW     R0,#+12290
        MOVS     R6,R0
        B.N      ??BootApp_Receive_Data_23
??BootApp_Receive_Data_24:
        MOVW     R0,#+12304
        MOVS     R6,R0
        MOVS     R0,#+0
        STRH     R0,[R8, #+10]
??BootApp_Receive_Data_23:
        MOVS     R0,R6
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
??BootApp_Receive_Data_1:
        ADD      SP,SP,#+24
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Receive_Data_Finish:
        LDR.N    R0,??DataTable6_2
        LDRH     R0,[R0, #+10]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Get_ReceiveData_Info:
        LDR.N    R1,??DataTable6_2
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Enable_ReceiveData:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2
        STRH     R0,[R1, #+10]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     ??magic_num

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     BootApp_SectBuffer_en

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     BootApp_ReceiveData_st

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     BootApp_Sect_Dirty_Msk_au16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x800c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x8020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x800bc00

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
// 1 052 bytes in section .bss
//    60 bytes in section .rodata
// 1 100 bytes in section .text
// 
// 1 100 bytes of CODE  memory
//    60 bytes of CONST memory
// 1 052 bytes of DATA  memory
//
//Errors: none
//Warnings: none
