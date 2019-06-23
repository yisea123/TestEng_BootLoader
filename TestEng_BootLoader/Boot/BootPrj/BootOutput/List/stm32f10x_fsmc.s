///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       23/Jun/2019  15:42:56
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_fsmc.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_fsmc.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\stm32f10x_fsmc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC FSMC_ClearFlag
        PUBLIC FSMC_ClearITPendingBit
        PUBLIC FSMC_GetECC
        PUBLIC FSMC_GetFlagStatus
        PUBLIC FSMC_GetITStatus
        PUBLIC FSMC_ITConfig
        PUBLIC FSMC_NANDCmd
        PUBLIC FSMC_NANDDeInit
        PUBLIC FSMC_NANDECCCmd
        PUBLIC FSMC_NANDInit
        PUBLIC FSMC_NANDStructInit
        PUBLIC FSMC_NORSRAMCmd
        PUBLIC FSMC_NORSRAMDeInit
        PUBLIC FSMC_NORSRAMInit
        PUBLIC FSMC_NORSRAMStructInit
        PUBLIC FSMC_PCCARDCmd
        PUBLIC FSMC_PCCARDDeInit
        PUBLIC FSMC_PCCARDInit
        PUBLIC FSMC_PCCARDStructInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_NORSRAMDeInit:
        CMP      R0,#+0
        BNE.N    ??FSMC_NORSRAMDeInit_0
        MOVW     R1,#+12507
        LSLS     R2,R0,#+2
        SUBS     R2,R2,#+1610612736
        STR      R1,[R2, #+0]
        B.N      ??FSMC_NORSRAMDeInit_1
??FSMC_NORSRAMDeInit_0:
        MOVW     R1,#+12498
        LSLS     R2,R0,#+2
        SUBS     R2,R2,#+1610612736
        STR      R1,[R2, #+0]
??FSMC_NORSRAMDeInit_1:
        MVNS     R1,#-268435456
        LSLS     R2,R0,#+2
        SUBS     R2,R2,#+1610612736
        STR      R1,[R2, #+4]
        MVNS     R1,#-268435456
        LDR.W    R2,??DataTable15  ;; 0xa0000104
        STR      R1,[R2, R0, LSL #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_NANDDeInit:
        CMP      R0,#+16
        BNE.N    ??FSMC_NANDDeInit_0
        MOVS     R1,#+24
        LDR.W    R2,??DataTable15_1  ;; 0xa0000060
        STR      R1,[R2, #+0]
        MOVS     R1,#+64
        LDR.W    R2,??DataTable15_2  ;; 0xa0000064
        STR      R1,[R2, #+0]
        MOVS     R1,#-50529028
        LDR.W    R2,??DataTable15_3  ;; 0xa0000068
        STR      R1,[R2, #+0]
        MOVS     R1,#-50529028
        LDR.W    R2,??DataTable15_4  ;; 0xa000006c
        STR      R1,[R2, #+0]
        B.N      ??FSMC_NANDDeInit_1
??FSMC_NANDDeInit_0:
        MOVS     R1,#+24
        LDR.W    R2,??DataTable15_5  ;; 0xa0000080
        STR      R1,[R2, #+0]
        MOVS     R1,#+64
        LDR.W    R2,??DataTable15_6  ;; 0xa0000084
        STR      R1,[R2, #+0]
        MOVS     R1,#-50529028
        LDR.W    R2,??DataTable15_7  ;; 0xa0000088
        STR      R1,[R2, #+0]
        MOVS     R1,#-50529028
        LDR.W    R2,??DataTable15_8  ;; 0xa000008c
        STR      R1,[R2, #+0]
??FSMC_NANDDeInit_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_PCCARDDeInit:
        MOVS     R0,#+24
        LDR.W    R1,??DataTable15_9  ;; 0xa00000a0
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable15_10  ;; 0xa00000a4
        STR      R0,[R1, #+0]
        MOVS     R0,#-50529028
        LDR.W    R1,??DataTable15_11  ;; 0xa00000a8
        STR      R0,[R1, #+0]
        MOVS     R0,#-50529028
        LDR.W    R1,??DataTable15_12  ;; 0xa00000ac
        STR      R0,[R1, #+0]
        MOVS     R0,#-50529028
        LDR.W    R1,??DataTable15_13  ;; 0xa00000b0
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_NORSRAMInit:
        LDR      R1,[R0, #+4]
        LDR      R2,[R0, #+8]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+12]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+16]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+20]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+24]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+28]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+32]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+36]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+40]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+44]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+48]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+0]
        LSLS     R2,R2,#+2
        SUBS     R2,R2,#+1610612736
        STR      R1,[R2, #+0]
        LDR      R1,[R0, #+8]
        CMP      R1,#+8
        BNE.N    ??FSMC_NORSRAMInit_0
        LDR      R1,[R0, #+0]
        LSLS     R1,R1,#+2
        SUBS     R1,R1,#+1610612736
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x40
        LDR      R2,[R0, #+0]
        LSLS     R2,R2,#+2
        SUBS     R2,R2,#+1610612736
        STR      R1,[R2, #+0]
??FSMC_NORSRAMInit_0:
        LDR      R1,[R0, #+52]
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+52]
        LDR      R2,[R2, #+4]
        ORRS     R1,R1,R2, LSL #+4
        LDR      R2,[R0, #+52]
        LDR      R2,[R2, #+8]
        ORRS     R1,R1,R2, LSL #+8
        LDR      R2,[R0, #+52]
        LDR      R2,[R2, #+12]
        ORRS     R1,R1,R2, LSL #+16
        LDR      R2,[R0, #+52]
        LDR      R2,[R2, #+16]
        ORRS     R1,R1,R2, LSL #+20
        LDR      R2,[R0, #+52]
        LDR      R2,[R2, #+20]
        ORRS     R1,R1,R2, LSL #+24
        LDR      R2,[R0, #+52]
        LDR      R2,[R2, #+24]
        ORRS     R1,R2,R1
        LDR      R2,[R0, #+0]
        LSLS     R2,R2,#+2
        SUBS     R2,R2,#+1610612736
        STR      R1,[R2, #+4]
        LDR      R1,[R0, #+44]
        CMP      R1,#+16384
        BNE.N    ??FSMC_NORSRAMInit_1
        LDR      R1,[R0, #+56]
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+56]
        LDR      R2,[R2, #+4]
        ORRS     R1,R1,R2, LSL #+4
        LDR      R2,[R0, #+56]
        LDR      R2,[R2, #+8]
        ORRS     R1,R1,R2, LSL #+8
        LDR      R2,[R0, #+56]
        LDR      R2,[R2, #+16]
        ORRS     R1,R1,R2, LSL #+20
        LDR      R2,[R0, #+56]
        LDR      R2,[R2, #+20]
        ORRS     R1,R1,R2, LSL #+24
        LDR      R2,[R0, #+56]
        LDR      R2,[R2, #+24]
        ORRS     R1,R2,R1
        LDR.W    R2,??DataTable15  ;; 0xa0000104
        LDR      R3,[R0, #+0]
        STR      R1,[R2, R3, LSL #+2]
        B.N      ??FSMC_NORSRAMInit_2
??FSMC_NORSRAMInit_1:
        MVNS     R1,#-268435456
        LDR.W    R2,??DataTable15  ;; 0xa0000104
        LDR      R3,[R0, #+0]
        STR      R1,[R2, R3, LSL #+2]
??FSMC_NORSRAMInit_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_NANDInit:
        PUSH     {R4,R5}
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        LDR      R4,[R0, #+4]
        LDR      R5,[R0, #+8]
        ORRS     R4,R5,R4
        LDR      R5,[R0, #+12]
        ORRS     R4,R5,R4
        LDR      R5,[R0, #+16]
        ORRS     R4,R5,R4
        LDR      R5,[R0, #+20]
        ORRS     R4,R4,R5, LSL #+9
        LDR      R5,[R0, #+24]
        ORRS     R4,R4,R5, LSL #+13
        ORRS     R4,R4,#0x8
        MOVS     R1,R4
        LDR      R4,[R0, #+28]
        LDR      R4,[R4, #+0]
        LDR      R5,[R0, #+28]
        LDR      R5,[R5, #+4]
        ORRS     R4,R4,R5, LSL #+8
        LDR      R5,[R0, #+28]
        LDR      R5,[R5, #+8]
        ORRS     R4,R4,R5, LSL #+16
        LDR      R5,[R0, #+28]
        LDR      R5,[R5, #+12]
        ORRS     R4,R4,R5, LSL #+24
        MOVS     R2,R4
        LDR      R4,[R0, #+32]
        LDR      R4,[R4, #+0]
        LDR      R5,[R0, #+32]
        LDR      R5,[R5, #+4]
        ORRS     R4,R4,R5, LSL #+8
        LDR      R5,[R0, #+32]
        LDR      R5,[R5, #+8]
        ORRS     R4,R4,R5, LSL #+16
        LDR      R5,[R0, #+32]
        LDR      R5,[R5, #+12]
        ORRS     R4,R4,R5, LSL #+24
        MOVS     R3,R4
        LDR      R4,[R0, #+0]
        CMP      R4,#+16
        BNE.N    ??FSMC_NANDInit_0
        LDR.W    R4,??DataTable15_1  ;; 0xa0000060
        STR      R1,[R4, #+0]
        LDR.W    R4,??DataTable15_3  ;; 0xa0000068
        STR      R2,[R4, #+0]
        LDR.W    R4,??DataTable15_4  ;; 0xa000006c
        STR      R3,[R4, #+0]
        B.N      ??FSMC_NANDInit_1
??FSMC_NANDInit_0:
        LDR.W    R4,??DataTable15_5  ;; 0xa0000080
        STR      R1,[R4, #+0]
        LDR.W    R4,??DataTable15_7  ;; 0xa0000088
        STR      R2,[R4, #+0]
        LDR.W    R4,??DataTable15_8  ;; 0xa000008c
        STR      R3,[R4, #+0]
??FSMC_NANDInit_1:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_PCCARDInit:
        LDR      R1,[R0, #+0]
        LDR      R2,[R0, #+4]
        ORRS     R1,R1,R2, LSL #+9
        LDR      R2,[R0, #+8]
        ORRS     R1,R1,R2, LSL #+13
        ORRS     R1,R1,#0x10
        LDR.W    R2,??DataTable15_9  ;; 0xa00000a0
        STR      R1,[R2, #+0]
        LDR      R1,[R0, #+12]
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+12]
        LDR      R2,[R2, #+4]
        ORRS     R1,R1,R2, LSL #+8
        LDR      R2,[R0, #+12]
        LDR      R2,[R2, #+8]
        ORRS     R1,R1,R2, LSL #+16
        LDR      R2,[R0, #+12]
        LDR      R2,[R2, #+12]
        ORRS     R1,R1,R2, LSL #+24
        LDR.W    R2,??DataTable15_11  ;; 0xa00000a8
        STR      R1,[R2, #+0]
        LDR      R1,[R0, #+16]
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+16]
        LDR      R2,[R2, #+4]
        ORRS     R1,R1,R2, LSL #+8
        LDR      R2,[R0, #+16]
        LDR      R2,[R2, #+8]
        ORRS     R1,R1,R2, LSL #+16
        LDR      R2,[R0, #+16]
        LDR      R2,[R2, #+12]
        ORRS     R1,R1,R2, LSL #+24
        LDR.W    R2,??DataTable15_12  ;; 0xa00000ac
        STR      R1,[R2, #+0]
        LDR      R1,[R0, #+20]
        LDR      R1,[R1, #+0]
        LDR      R2,[R0, #+20]
        LDR      R2,[R2, #+4]
        ORRS     R1,R1,R2, LSL #+8
        LDR      R2,[R0, #+20]
        LDR      R2,[R2, #+8]
        ORRS     R1,R1,R2, LSL #+16
        LDR      R2,[R0, #+20]
        LDR      R2,[R2, #+12]
        ORRS     R1,R1,R2, LSL #+24
        LDR.W    R2,??DataTable15_13  ;; 0xa00000b0
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_NORSRAMStructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+2
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
        MOVS     R1,#+0
        STR      R1,[R0, #+28]
        MOVS     R1,#+0
        STR      R1,[R0, #+32]
        MOV      R1,#+4096
        STR      R1,[R0, #+36]
        MOV      R1,#+8192
        STR      R1,[R0, #+40]
        MOVS     R1,#+0
        STR      R1,[R0, #+44]
        MOVS     R1,#+0
        STR      R1,[R0, #+48]
        MOVS     R1,#+15
        LDR      R2,[R0, #+52]
        STR      R1,[R2, #+0]
        MOVS     R1,#+15
        LDR      R2,[R0, #+52]
        STR      R1,[R2, #+4]
        MOVS     R1,#+255
        LDR      R2,[R0, #+52]
        STR      R1,[R2, #+8]
        MOVS     R1,#+15
        LDR      R2,[R0, #+52]
        STR      R1,[R2, #+12]
        MOVS     R1,#+15
        LDR      R2,[R0, #+52]
        STR      R1,[R2, #+16]
        MOVS     R1,#+15
        LDR      R2,[R0, #+52]
        STR      R1,[R2, #+20]
        MOVS     R1,#+0
        LDR      R2,[R0, #+52]
        STR      R1,[R2, #+24]
        MOVS     R1,#+15
        LDR      R2,[R0, #+56]
        STR      R1,[R2, #+0]
        MOVS     R1,#+15
        LDR      R2,[R0, #+56]
        STR      R1,[R2, #+4]
        MOVS     R1,#+255
        LDR      R2,[R0, #+56]
        STR      R1,[R2, #+8]
        MOVS     R1,#+15
        LDR      R2,[R0, #+56]
        STR      R1,[R2, #+12]
        MOVS     R1,#+15
        LDR      R2,[R0, #+56]
        STR      R1,[R2, #+16]
        MOVS     R1,#+15
        LDR      R2,[R0, #+56]
        STR      R1,[R2, #+20]
        MOVS     R1,#+0
        LDR      R2,[R0, #+56]
        STR      R1,[R2, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_NANDStructInit:
        MOVS     R1,#+16
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
        MOVS     R1,#+252
        LDR      R2,[R0, #+28]
        STR      R1,[R2, #+0]
        MOVS     R1,#+252
        LDR      R2,[R0, #+28]
        STR      R1,[R2, #+4]
        MOVS     R1,#+252
        LDR      R2,[R0, #+28]
        STR      R1,[R2, #+8]
        MOVS     R1,#+252
        LDR      R2,[R0, #+28]
        STR      R1,[R2, #+12]
        MOVS     R1,#+252
        LDR      R2,[R0, #+32]
        STR      R1,[R2, #+0]
        MOVS     R1,#+252
        LDR      R2,[R0, #+32]
        STR      R1,[R2, #+4]
        MOVS     R1,#+252
        LDR      R2,[R0, #+32]
        STR      R1,[R2, #+8]
        MOVS     R1,#+252
        LDR      R2,[R0, #+32]
        STR      R1,[R2, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_PCCARDStructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+252
        LDR      R2,[R0, #+12]
        STR      R1,[R2, #+0]
        MOVS     R1,#+252
        LDR      R2,[R0, #+12]
        STR      R1,[R2, #+4]
        MOVS     R1,#+252
        LDR      R2,[R0, #+12]
        STR      R1,[R2, #+8]
        MOVS     R1,#+252
        LDR      R2,[R0, #+12]
        STR      R1,[R2, #+12]
        MOVS     R1,#+252
        LDR      R2,[R0, #+16]
        STR      R1,[R2, #+0]
        MOVS     R1,#+252
        LDR      R2,[R0, #+16]
        STR      R1,[R2, #+4]
        MOVS     R1,#+252
        LDR      R2,[R0, #+16]
        STR      R1,[R2, #+8]
        MOVS     R1,#+252
        LDR      R2,[R0, #+16]
        STR      R1,[R2, #+12]
        MOVS     R1,#+252
        LDR      R2,[R0, #+20]
        STR      R1,[R2, #+0]
        MOVS     R1,#+252
        LDR      R2,[R0, #+20]
        STR      R1,[R2, #+4]
        MOVS     R1,#+252
        LDR      R2,[R0, #+20]
        STR      R1,[R2, #+8]
        MOVS     R1,#+252
        LDR      R2,[R0, #+20]
        STR      R1,[R2, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_NORSRAMCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??FSMC_NORSRAMCmd_0
        LSLS     R2,R0,#+2
        SUBS     R2,R2,#+1610612736
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x1
        LSLS     R3,R0,#+2
        SUBS     R3,R3,#+1610612736
        STR      R2,[R3, #+0]
        B.N      ??FSMC_NORSRAMCmd_1
??FSMC_NORSRAMCmd_0:
        LSLS     R2,R0,#+2
        SUBS     R2,R2,#+1610612736
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable15_14  ;; 0xffffe
        ANDS     R2,R3,R2
        LSLS     R3,R0,#+2
        SUBS     R3,R3,#+1610612736
        STR      R2,[R3, #+0]
??FSMC_NORSRAMCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_NANDCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??FSMC_NANDCmd_0
        CMP      R0,#+16
        BNE.N    ??FSMC_NANDCmd_1
        LDR.N    R2,??DataTable15_1  ;; 0xa0000060
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x4
        LDR.N    R3,??DataTable15_1  ;; 0xa0000060
        STR      R2,[R3, #+0]
        B.N      ??FSMC_NANDCmd_2
??FSMC_NANDCmd_1:
        LDR.N    R2,??DataTable15_5  ;; 0xa0000080
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x4
        LDR.N    R3,??DataTable15_5  ;; 0xa0000080
        STR      R2,[R3, #+0]
        B.N      ??FSMC_NANDCmd_2
??FSMC_NANDCmd_0:
        CMP      R0,#+16
        BNE.N    ??FSMC_NANDCmd_3
        LDR.N    R2,??DataTable15_1  ;; 0xa0000060
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable15_15  ;; 0xffffb
        ANDS     R2,R3,R2
        LDR.N    R3,??DataTable15_1  ;; 0xa0000060
        STR      R2,[R3, #+0]
        B.N      ??FSMC_NANDCmd_2
??FSMC_NANDCmd_3:
        LDR.N    R2,??DataTable15_5  ;; 0xa0000080
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable15_15  ;; 0xffffb
        ANDS     R2,R3,R2
        LDR.N    R3,??DataTable15_5  ;; 0xa0000080
        STR      R2,[R3, #+0]
??FSMC_NANDCmd_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_PCCARDCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FSMC_PCCARDCmd_0
        LDR.N    R1,??DataTable15_9  ;; 0xa00000a0
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x4
        LDR.N    R2,??DataTable15_9  ;; 0xa00000a0
        STR      R1,[R2, #+0]
        B.N      ??FSMC_PCCARDCmd_1
??FSMC_PCCARDCmd_0:
        LDR.N    R1,??DataTable15_9  ;; 0xa00000a0
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable15_15  ;; 0xffffb
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable15_9  ;; 0xa00000a0
        STR      R1,[R2, #+0]
??FSMC_PCCARDCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_NANDECCCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??FSMC_NANDECCCmd_0
        CMP      R0,#+16
        BNE.N    ??FSMC_NANDECCCmd_1
        LDR.N    R2,??DataTable15_1  ;; 0xa0000060
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x40
        LDR.N    R3,??DataTable15_1  ;; 0xa0000060
        STR      R2,[R3, #+0]
        B.N      ??FSMC_NANDECCCmd_2
??FSMC_NANDECCCmd_1:
        LDR.N    R2,??DataTable15_5  ;; 0xa0000080
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x40
        LDR.N    R3,??DataTable15_5  ;; 0xa0000080
        STR      R2,[R3, #+0]
        B.N      ??FSMC_NANDECCCmd_2
??FSMC_NANDECCCmd_0:
        CMP      R0,#+16
        BNE.N    ??FSMC_NANDECCCmd_3
        LDR.N    R2,??DataTable15_1  ;; 0xa0000060
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable15_16  ;; 0xfffbf
        ANDS     R2,R3,R2
        LDR.N    R3,??DataTable15_1  ;; 0xa0000060
        STR      R2,[R3, #+0]
        B.N      ??FSMC_NANDECCCmd_2
??FSMC_NANDECCCmd_3:
        LDR.N    R2,??DataTable15_5  ;; 0xa0000080
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable15_16  ;; 0xfffbf
        ANDS     R2,R3,R2
        LDR.N    R3,??DataTable15_5  ;; 0xa0000080
        STR      R2,[R3, #+0]
??FSMC_NANDECCCmd_2:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_GetECC:
        MOVS     R1,R0
        MOVS     R0,#+0
        CMP      R1,#+16
        BNE.N    ??FSMC_GetECC_0
        LDR.N    R2,??DataTable15_17  ;; 0xa0000074
        LDR      R2,[R2, #+0]
        MOVS     R0,R2
        B.N      ??FSMC_GetECC_1
??FSMC_GetECC_0:
        LDR.N    R2,??DataTable15_18  ;; 0xa0000094
        LDR      R2,[R2, #+0]
        MOVS     R0,R2
??FSMC_GetECC_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_ITConfig:
        PUSH     {R4}
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??FSMC_ITConfig_0
        CMP      R0,#+16
        BNE.N    ??FSMC_ITConfig_1
        LDR.N    R3,??DataTable15_2  ;; 0xa0000064
        LDR      R3,[R3, #+0]
        ORRS     R3,R1,R3
        LDR.N    R4,??DataTable15_2  ;; 0xa0000064
        STR      R3,[R4, #+0]
        B.N      ??FSMC_ITConfig_2
??FSMC_ITConfig_1:
        CMP      R0,#+256
        BNE.N    ??FSMC_ITConfig_3
        LDR.N    R3,??DataTable15_6  ;; 0xa0000084
        LDR      R3,[R3, #+0]
        ORRS     R3,R1,R3
        LDR.N    R4,??DataTable15_6  ;; 0xa0000084
        STR      R3,[R4, #+0]
        B.N      ??FSMC_ITConfig_2
??FSMC_ITConfig_3:
        LDR.N    R3,??DataTable15_10  ;; 0xa00000a4
        LDR      R3,[R3, #+0]
        ORRS     R3,R1,R3
        LDR.N    R4,??DataTable15_10  ;; 0xa00000a4
        STR      R3,[R4, #+0]
        B.N      ??FSMC_ITConfig_2
??FSMC_ITConfig_0:
        CMP      R0,#+16
        BNE.N    ??FSMC_ITConfig_4
        LDR.N    R3,??DataTable15_2  ;; 0xa0000064
        LDR      R3,[R3, #+0]
        BICS     R3,R3,R1
        LDR.N    R4,??DataTable15_2  ;; 0xa0000064
        STR      R3,[R4, #+0]
        B.N      ??FSMC_ITConfig_2
??FSMC_ITConfig_4:
        CMP      R0,#+256
        BNE.N    ??FSMC_ITConfig_5
        LDR.N    R3,??DataTable15_6  ;; 0xa0000084
        LDR      R3,[R3, #+0]
        BICS     R3,R3,R1
        LDR.N    R4,??DataTable15_6  ;; 0xa0000084
        STR      R3,[R4, #+0]
        B.N      ??FSMC_ITConfig_2
??FSMC_ITConfig_5:
        LDR.N    R3,??DataTable15_10  ;; 0xa00000a4
        LDR      R3,[R3, #+0]
        BICS     R3,R3,R1
        LDR.N    R4,??DataTable15_10  ;; 0xa00000a4
        STR      R3,[R4, #+0]
??FSMC_ITConfig_2:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_GetFlagStatus:
        PUSH     {R4}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        CMP      R2,#+16
        BNE.N    ??FSMC_GetFlagStatus_0
        LDR.N    R4,??DataTable15_2  ;; 0xa0000064
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        B.N      ??FSMC_GetFlagStatus_1
??FSMC_GetFlagStatus_0:
        CMP      R2,#+256
        BNE.N    ??FSMC_GetFlagStatus_2
        LDR.N    R4,??DataTable15_6  ;; 0xa0000084
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        B.N      ??FSMC_GetFlagStatus_1
??FSMC_GetFlagStatus_2:
        LDR.N    R4,??DataTable15_10  ;; 0xa00000a4
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
??FSMC_GetFlagStatus_1:
        TST      R3,R1
        BEQ.N    ??FSMC_GetFlagStatus_3
        MOVS     R4,#+1
        MOVS     R0,R4
        B.N      ??FSMC_GetFlagStatus_4
??FSMC_GetFlagStatus_3:
        MOVS     R4,#+0
        MOVS     R0,R4
??FSMC_GetFlagStatus_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_ClearFlag:
        CMP      R0,#+16
        BNE.N    ??FSMC_ClearFlag_0
        LDR.N    R2,??DataTable15_2  ;; 0xa0000064
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1
        LDR.N    R3,??DataTable15_2  ;; 0xa0000064
        STR      R2,[R3, #+0]
        B.N      ??FSMC_ClearFlag_1
??FSMC_ClearFlag_0:
        CMP      R0,#+256
        BNE.N    ??FSMC_ClearFlag_2
        LDR.N    R2,??DataTable15_6  ;; 0xa0000084
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1
        LDR.N    R3,??DataTable15_6  ;; 0xa0000084
        STR      R2,[R3, #+0]
        B.N      ??FSMC_ClearFlag_1
??FSMC_ClearFlag_2:
        LDR.N    R2,??DataTable15_10  ;; 0xa00000a4
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1
        LDR.N    R3,??DataTable15_10  ;; 0xa00000a4
        STR      R2,[R3, #+0]
??FSMC_ClearFlag_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_GetITStatus:
        PUSH     {R4-R6}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        CMP      R2,#+16
        BNE.N    ??FSMC_GetITStatus_0
        LDR.N    R6,??DataTable15_2  ;; 0xa0000064
        LDR      R6,[R6, #+0]
        MOVS     R3,R6
        B.N      ??FSMC_GetITStatus_1
??FSMC_GetITStatus_0:
        CMP      R2,#+256
        BNE.N    ??FSMC_GetITStatus_2
        LDR.N    R6,??DataTable15_6  ;; 0xa0000084
        LDR      R6,[R6, #+0]
        MOVS     R3,R6
        B.N      ??FSMC_GetITStatus_1
??FSMC_GetITStatus_2:
        LDR.N    R6,??DataTable15_10  ;; 0xa00000a4
        LDR      R6,[R6, #+0]
        MOVS     R3,R6
??FSMC_GetITStatus_1:
        ANDS     R6,R1,R3
        MOVS     R4,R6
        ANDS     R6,R3,R1, LSR #+3
        MOVS     R5,R6
        CMP      R4,#+0
        BEQ.N    ??FSMC_GetITStatus_3
        CMP      R5,#+0
        BEQ.N    ??FSMC_GetITStatus_3
        MOVS     R6,#+1
        MOVS     R0,R6
        B.N      ??FSMC_GetITStatus_4
??FSMC_GetITStatus_3:
        MOVS     R6,#+0
        MOVS     R0,R6
??FSMC_GetITStatus_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FSMC_ClearITPendingBit:
        CMP      R0,#+16
        BNE.N    ??FSMC_ClearITPendingBit_0
        LDR.N    R2,??DataTable15_2  ;; 0xa0000064
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1, LSR #+3
        LDR.N    R3,??DataTable15_2  ;; 0xa0000064
        STR      R2,[R3, #+0]
        B.N      ??FSMC_ClearITPendingBit_1
??FSMC_ClearITPendingBit_0:
        CMP      R0,#+256
        BNE.N    ??FSMC_ClearITPendingBit_2
        LDR.N    R2,??DataTable15_6  ;; 0xa0000084
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1, LSR #+3
        LDR.N    R3,??DataTable15_6  ;; 0xa0000084
        STR      R2,[R3, #+0]
        B.N      ??FSMC_ClearITPendingBit_1
??FSMC_ClearITPendingBit_2:
        LDR.N    R2,??DataTable15_10  ;; 0xa00000a4
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R1, LSR #+3
        LDR.N    R3,??DataTable15_10  ;; 0xa00000a4
        STR      R2,[R3, #+0]
??FSMC_ClearITPendingBit_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0xa0000104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_1:
        DC32     0xa0000060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_2:
        DC32     0xa0000064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_3:
        DC32     0xa0000068

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_4:
        DC32     0xa000006c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_5:
        DC32     0xa0000080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_6:
        DC32     0xa0000084

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_7:
        DC32     0xa0000088

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_8:
        DC32     0xa000008c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_9:
        DC32     0xa00000a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_10:
        DC32     0xa00000a4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_11:
        DC32     0xa00000a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_12:
        DC32     0xa00000ac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_13:
        DC32     0xa00000b0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_14:
        DC32     0xffffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_15:
        DC32     0xffffb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_16:
        DC32     0xfffbf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_17:
        DC32     0xa0000074

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15_18:
        DC32     0xa0000094

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
// 1 654 bytes in section .text
// 
// 1 654 bytes of CODE memory
//
//Errors: none
//Warnings: none
