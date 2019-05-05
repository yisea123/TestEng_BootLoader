///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       30/Mar/2019  15:46:37
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\power_manage.c
//    Command line =  
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\DFB_src\power_manage.c
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
//        F:\FLT\GitHub\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\power_manage.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1
        #define SHF_WRITE 0x1
        #define SHF_EXECINSTR 0x4

        PUBLIC all_sys_power_off
        PUBLIC all_sys_power_on
        PUBLIC check_current_source_status
        PUBLIC check_power_status
        PUBLIC check_voltage_source_status
        PUBLIC clear_current_source_status
        PUBLIC clear_power_status
        PUBLIC clear_voltage_source_status
        PUBLIC globle_flag_dfb_current_status
        PUBLIC globle_flag_dfb_voltage_status
        PUBLIC globle_flag_power_status
        PUBLIC set_current_source_status
        PUBLIC set_power_status
        PUBLIC set_voltage_source_status


        SECTION `.bss`:DATA:REORDER:NOROOT(1)
globle_flag_power_status:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
globle_flag_dfb_current_status:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
globle_flag_dfb_voltage_status:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
all_sys_power_on:
        PUSH     {R7,LR}
        MOVS     R0,#+7
        BL       set_power_status
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
all_sys_power_off:
        PUSH     {R7,LR}
        MOVS     R0,#+7
        BL       clear_power_status
        POP      {R0,PC}          ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
check_power_status:
        MOVS     R1,R0
        LDR.N    R0,??DataTable8
        LDRH     R0,[R0, #+0]
        TST      R0,R1
        BEQ.N    ??check_power_status_0
        MOVS     R0,#+1
        B.N      ??check_power_status_1
??check_power_status_0:
        MOVS     R0,#+0
??check_power_status_1:
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
set_power_status:
        LDR.N    R1,??DataTable8
        LDRH     R1,[R1, #+0]
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable8
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
clear_power_status:
        LDR.N    R1,??DataTable8
        LDRH     R1,[R1, #+0]
        BICS     R1,R1,R0
        LDR.N    R2,??DataTable8
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
check_current_source_status:
        MOVS     R1,R0
        LDR.N    R0,??DataTable8_1
        LDRH     R0,[R0, #+0]
        TST      R0,R1
        BEQ.N    ??check_current_source_status_0
        MOVS     R0,#+1
        B.N      ??check_current_source_status_1
??check_current_source_status_0:
        MOVS     R0,#+0
??check_current_source_status_1:
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
set_current_source_status:
        LDR.N    R1,??DataTable8_1
        LDRH     R1,[R1, #+0]
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable8_1
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
clear_current_source_status:
        LDR.N    R1,??DataTable8_1
        LDRH     R1,[R1, #+0]
        BICS     R1,R1,R0
        LDR.N    R2,??DataTable8_1
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
check_voltage_source_status:
        MOVS     R1,R0
        LDR.N    R0,??DataTable8_2
        LDRH     R0,[R0, #+0]
        TST      R0,R1
        BEQ.N    ??check_voltage_source_status_0
        MOVS     R0,#+1
        B.N      ??check_voltage_source_status_1
??check_voltage_source_status_0:
        MOVS     R0,#+0
??check_voltage_source_status_1:
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
set_voltage_source_status:
        LDR.N    R1,??DataTable8_2
        LDRH     R1,[R1, #+0]
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable8_2
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(1)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
clear_voltage_source_status:
        LDR.N    R1,??DataTable8_2
        LDRH     R1,[R1, #+0]
        BICS     R1,R1,R0
        LDR.N    R2,??DataTable8_2
        STRH     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE
        DATA
??DataTable8:
        DC32     globle_flag_power_status

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE
        DATA
??DataTable8_1:
        DC32     globle_flag_dfb_current_status

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE
        DATA
??DataTable8_2:
        DC32     globle_flag_dfb_voltage_status

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
//   6 bytes in section .bss
//  20 bytes in section .text
// 138 bytes in section .textrw
// 
// 158 bytes of CODE memory
//   6 bytes of DATA memory
//
//Errors: none
//Warnings: none
