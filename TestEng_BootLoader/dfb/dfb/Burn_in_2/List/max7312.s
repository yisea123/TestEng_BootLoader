///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:33
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\max7312.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\max7312.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\max7312.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN I2c_command_read
        EXTERN I2c_command_write

        PUBLIC Max7312_Set_All_Port_Hi
        PUBLIC Max7312_Set_All_Port_Input
        PUBLIC Max7312_Set_All_Port_Lo
        PUBLIC Max7312_Set_All_Port_Output
        PUBLIC Max7312_Set_Port1_HiLo
        PUBLIC Max7312_Set_Port1_IO
        PUBLIC Max7312_Set_Port2_HiLo
        PUBLIC Max7312_Set_Port2_IO
        PUBLIC Max7312_init
        PUBLIC max7312_command_cst
        PUBLIC max7312_dev_addr_ca
        PUBLIC max7312_reg_st


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
max7312_command_cst:
        DATA
        DC8 0, 1, 2, 3, 4, 5, 6, 7, 8, 255, 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
max7312_reg_st:
        DS8 16

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
max7312_dev_addr_ca:
        DATA
        DC8 78, 70

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_init:
        PUSH     {R4,LR}
        MOVS     R0,#+0
        BL       Max7312_Set_All_Port_Output
        MOVS     R4,R0
        MOVS     R0,#+0
        BL       Max7312_Set_All_Port_Lo
        ANDS     R0,R0,R4
        MOVS     R4,R0
        MOVS     R0,#+1
        BL       Max7312_Set_All_Port_Output
        ANDS     R0,R0,R4
        MOVS     R4,R0
        MOVS     R0,#+1
        BL       Max7312_Set_All_Port_Lo
        ANDS     R0,R0,R4
        MOVS     R4,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Set_All_Port_Output:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R1,#+0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port1_IO
        MOVS     R5,R0
        MOVS     R1,#+0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port2_IO
        MOVS     R6,R0
        ANDS     R0,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Set_All_Port_Input:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R1,#+255
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port1_IO
        MOVS     R5,R0
        MOVS     R1,#+255
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port2_IO
        MOVS     R6,R0
        ANDS     R0,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Set_All_Port_Hi:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R1,#+255
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port1_HiLo
        MOVS     R5,R0
        MOVS     R1,#+255
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port2_HiLo
        MOVS     R6,R0
        ANDS     R0,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Set_All_Port_Lo:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R1,#+0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port1_HiLo
        MOVS     R5,R0
        MOVS     R1,#+0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Set_Port2_HiLo
        MOVS     R6,R0
        ANDS     R0,R6,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Set_Port1_IO:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        LDR.N    R0,??DataTable5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R0,R4, LSL #+3
        ADDS     R8,R0,#+6
        STRB     R5,[SP, #+0]
        LDR.N    R0,??DataTable5_1
        LDRB     R0,[R0, #+6]
        MOVS     R7,R0
        MOV      R3,R8
        ADD      R2,SP,#+0
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Write_Reg_Check
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Set_Port2_IO:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        LDR.N    R0,??DataTable5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R0,R4, LSL #+3
        ADDS     R8,R0,#+6
        STRB     R5,[SP, #+0]
        LDR.N    R0,??DataTable5_1
        LDRB     R0,[R0, #+7]
        MOVS     R7,R0
        ADDS     R3,R8,#+1
        ADD      R2,SP,#+0
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Write_Reg_Check
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Set_Port1_HiLo:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        LDR.N    R0,??DataTable5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R0,R4, LSL #+3
        ADDS     R8,R0,#+2
        STRB     R5,[SP, #+0]
        LDR.N    R0,??DataTable5_1
        LDRB     R0,[R0, #+2]
        MOVS     R7,R0
        MOV      R3,R8
        ADD      R2,SP,#+0
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Write_Reg_Check
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Set_Port2_HiLo:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        LDR.N    R0,??DataTable5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R0,R0,R4, LSL #+3
        ADDS     R8,R0,#+2
        STRB     R5,[SP, #+0]
        LDR.N    R0,??DataTable5_1
        LDRB     R0,[R0, #+3]
        MOVS     R7,R0
        ADDS     R3,R8,#+1
        ADD      R2,SP,#+0
        MOVS     R1,R7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Write_Reg_Check
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Write_Reg_Check:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOV      R9,R6
        MOV      R10,R7
        MOVS     R2,R6
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Write_Register
        MOV      R8,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??Max7312_Write_Reg_Check_0
        MOVS     R2,R7
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Max7312_Read_Register
        MOV      R8,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??Max7312_Write_Reg_Check_1
        LDRB     R0,[R9, #+0]
        LDRB     R1,[R10, #+0]
        CMP      R0,R1
        BNE.N    ??Max7312_Write_Reg_Check_2
        MOVS     R0,#+1
        MOV      R8,R0
        B.N      ??Max7312_Write_Reg_Check_3
??Max7312_Write_Reg_Check_2:
        MOVS     R0,#+0
        MOV      R8,R0
        B.N      ??Max7312_Write_Reg_Check_3
??Max7312_Write_Reg_Check_1:
        MOVS     R0,#+0
        MOV      R8,R0
        B.N      ??Max7312_Write_Reg_Check_3
??Max7312_Write_Reg_Check_0:
        MOVS     R0,#+0
        MOV      R8,R0
??Max7312_Write_Reg_Check_3:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Write_Register:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BCC.N    ??Max7312_Write_Register_0
        MOVS     R0,#+0
        B.N      ??Max7312_Write_Register_1
??Max7312_Write_Register_0:
        CMP      R6,#+0
        BNE.N    ??Max7312_Write_Register_2
        MOVS     R0,#+0
        B.N      ??Max7312_Write_Register_1
??Max7312_Write_Register_2:
        LDR.N    R0,??DataTable5_2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        MOV      R8,R0
        STR      R6,[SP, #+0]
        MOV      R3,R8
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,#+1
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5_3  ;; 0x40005400
        BL       I2c_command_write
        MOVS     R7,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??Max7312_Write_Register_3
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??Max7312_Write_Register_4
??Max7312_Write_Register_3:
        MOVS     R0,#+0
        MOVS     R7,R0
??Max7312_Write_Register_4:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??Max7312_Write_Register_1:
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Max7312_Read_Register:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BCC.N    ??Max7312_Read_Register_0
        MOVS     R0,#+0
        B.N      ??Max7312_Read_Register_1
??Max7312_Read_Register_0:
        CMP      R6,#+0
        BNE.N    ??Max7312_Read_Register_2
        MOVS     R0,#+0
        B.N      ??Max7312_Read_Register_1
??Max7312_Read_Register_2:
        LDR.N    R0,??DataTable5_2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        MOV      R8,R0
        STR      R6,[SP, #+0]
        MOV      R3,R8
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,#+1
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5_3  ;; 0x40005400
        BL       I2c_command_read
        MOVS     R7,R0
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??Max7312_Read_Register_3
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??Max7312_Read_Register_4
??Max7312_Read_Register_3:
        MOVS     R0,#+0
        MOVS     R7,R0
??Max7312_Read_Register_4:
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??Max7312_Read_Register_1:
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     max7312_reg_st

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     max7312_command_cst

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     max7312_dev_addr_ca

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40005400

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
//  16 bytes in section .bss
//  14 bytes in section .rodata
// 720 bytes in section .text
// 
// 720 bytes of CODE  memory
//  14 bytes of CONST memory
//  16 bytes of DATA  memory
//
//Errors: none
//Warnings: none
