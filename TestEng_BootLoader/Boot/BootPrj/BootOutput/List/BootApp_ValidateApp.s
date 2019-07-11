///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       03/Jul/2019  23:23:51
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_ValidateApp.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootApp\src\BootApp_ValidateApp.c
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
//        F:\FLT\GitHub\TestEng_BootLoader\TestEng_BootLoader\Boot\BootPrj\BootOutput\List\BootApp_ValidateApp.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BootApp_App_Cfg_cpcst

        PUBLIC BootApp_App_Valid_en
        PUBLIC BootApp_Validate_App


        SECTION `.data`:DATA:REORDER:NOROOT(1)
BootApp_App_Valid_en:
        DATA
        DC16 20482

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Validate_App:
        PUSH     {R4,LR}
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??BootApp_Validate_App_0
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+0]
        BL       BootApp_Validate_Info
        MOVS     R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??BootApp_Validate_App_1
        MOVW     R0,#+20483
        LDR.N    R1,??DataTable1_1
        STRH     R0,[R1, #+0]
        B.N      ??BootApp_Validate_App_2
??BootApp_Validate_App_1:
        MOVW     R0,#+20482
        LDR.N    R1,??DataTable1_1
        STRH     R0,[R1, #+0]
        B.N      ??BootApp_Validate_App_2
??BootApp_Validate_App_0:
        MOVW     R0,#+20484
        LDR.N    R1,??DataTable1_1
        STRH     R0,[R1, #+0]
??BootApp_Validate_App_2:
        LDR.N    R0,??DataTable1_1
        LDRSH    R0,[R0, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BootApp_Validate_Info:
        PUSH     {R4-R6}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R3,[R1, #+8]
        LDR      R4,[R1, #+12]
        LDR.N    R5,??DataTable1_2  ;; 0x800c000
        CMP      R3,R5
        BCC.N    ??BootApp_Validate_Info_0
        LDR.N    R5,??DataTable1_3  ;; 0x800c400
        CMP      R3,R5
        BCS.N    ??BootApp_Validate_Info_0
        LDR.N    R5,??DataTable1_4  ;; 0x801fc00
        CMP      R4,R5
        BCC.N    ??BootApp_Validate_Info_0
        LDR.N    R5,??DataTable1_5  ;; 0x8020000
        CMP      R4,R5
        BCS.N    ??BootApp_Validate_Info_0
        MOVS     R5,#+0
        MOVS     R2,R5
??BootApp_Validate_Info_1:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BGE.N    ??BootApp_Validate_Info_2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R5,[R2, R3]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R6,[R2, R4]
        CMP      R5,R6
        BNE.N    ??BootApp_Validate_Info_3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R5,[R2, R3]
        CMP      R5,#+255
        BNE.N    ??BootApp_Validate_Info_4
??BootApp_Validate_Info_3:
        MOVS     R5,#+0
        MOVS     R0,R5
        B.N      ??BootApp_Validate_Info_2
??BootApp_Validate_Info_4:
        MOVS     R5,#+1
        MOVS     R0,R5
        ADDS     R2,R2,#+1
        B.N      ??BootApp_Validate_Info_1
??BootApp_Validate_Info_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BootApp_Validate_Info_5
        MOVS     R5,#+0
        MOVS     R2,R5
??BootApp_Validate_Info_6:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BGE.N    ??BootApp_Validate_Info_5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R5,R2,R3
        LDRB     R5,[R5, #+32]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R6,R2,R4
        LDRB     R6,[R6, #+32]
        CMP      R5,R6
        BNE.N    ??BootApp_Validate_Info_7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R5,R2,R3
        LDRB     R5,[R5, #+32]
        CMP      R5,#+255
        BNE.N    ??BootApp_Validate_Info_8
??BootApp_Validate_Info_7:
        MOVS     R5,#+0
        MOVS     R0,R5
        B.N      ??BootApp_Validate_Info_5
??BootApp_Validate_Info_8:
        MOVS     R5,#+1
        MOVS     R0,R5
        ADDS     R2,R2,#+1
        B.N      ??BootApp_Validate_Info_6
??BootApp_Validate_Info_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??BootApp_Validate_Info_9
        MOVS     R5,#+0
        MOVS     R2,R5
??BootApp_Validate_Info_10:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BGE.N    ??BootApp_Validate_Info_9
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R5,R2,R3
        LDRB     R5,[R5, #+16]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R6,R2,R4
        LDRB     R6,[R6, #+16]
        CMP      R5,R6
        BNE.N    ??BootApp_Validate_Info_11
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R5,R2,R3
        LDRB     R5,[R5, #+16]
        CMP      R5,#+255
        BNE.N    ??BootApp_Validate_Info_12
??BootApp_Validate_Info_11:
        MOVS     R5,#+0
        MOVS     R0,R5
        B.N      ??BootApp_Validate_Info_9
??BootApp_Validate_Info_12:
        MOVS     R5,#+1
        MOVS     R0,R5
        ADDS     R2,R2,#+1
        B.N      ??BootApp_Validate_Info_10
??BootApp_Validate_Info_0:
        MOVS     R5,#+0
        MOVS     R0,R5
??BootApp_Validate_Info_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     BootApp_App_Cfg_cpcst

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     BootApp_App_Valid_en

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x800c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x800c400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x801fc00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x8020000

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
//   2 bytes in section .data
// 292 bytes in section .text
// 
// 292 bytes of CODE memory
//   2 bytes of DATA memory
//
//Errors: none
//Warnings: none
