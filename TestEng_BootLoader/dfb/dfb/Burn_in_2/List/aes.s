///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       24/Sep/2018  11:06:53
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\aes\aes.c
//    Command line =  
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\aes\aes.c -lcN
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\
//        -lb
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\ -o
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M3 -e --fpu=None --dlib_config "E:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\DFB_inc\ -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\..\Libraries\CMSIS\
//        -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\..\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\ascii\
//        -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\include\
//        -I
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\modbus_port\
//        -I F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\rtu\
//        -I F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\..\modbus\tcp\
//        -On -I "E:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\dfb\TestEng_FL0001A00\TestEng_FL0001A00\dfb\dfb\Burn_in_2\List\aes.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy

        PUBLIC AES_CBC_decrypt_buffer
        PUBLIC AES_CBC_encrypt_buffer
        PUBLIC AES_ctx_set_iv
        PUBLIC AES_init_ctx
        PUBLIC AES_init_ctx_iv


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
sbox:
        DATA
        DC8 99, 124, 119, 123, 242, 107, 111, 197, 48, 1, 103, 43, 254, 215
        DC8 171, 118, 202, 130, 201, 125, 250, 89, 71, 240, 173, 212, 162, 175
        DC8 156, 164, 114, 192, 183, 253, 147, 38, 54, 63, 247, 204, 52, 165
        DC8 229, 241, 113, 216, 49, 21, 4, 199, 35, 195, 24, 150, 5, 154, 7, 18
        DC8 128, 226, 235, 39, 178, 117, 9, 131, 44, 26, 27, 110, 90, 160, 82
        DC8 59, 214, 179, 41, 227, 47, 132, 83, 209, 0, 237, 32, 252, 177, 91
        DC8 106, 203, 190, 57, 74, 76, 88, 207, 208, 239, 170, 251, 67, 77, 51
        DC8 133, 69, 249, 2, 127, 80, 60, 159, 168, 81, 163, 64, 143, 146, 157
        DC8 56, 245, 188, 182, 218, 33, 16, 255, 243, 210, 205, 12, 19, 236, 95
        DC8 151, 68, 23, 196, 167, 126, 61, 100, 93, 25, 115, 96, 129, 79, 220
        DC8 34, 42, 144, 136, 70, 238, 184, 20, 222, 94, 11, 219, 224, 50, 58
        DC8 10, 73, 6, 36, 92, 194, 211, 172, 98, 145, 149, 228, 121, 231, 200
        DC8 55, 109, 141, 213, 78, 169, 108, 86, 244, 234, 101, 122, 174, 8
        DC8 186, 120, 37, 46, 28, 166, 180, 198, 232, 221, 116, 31, 75, 189
        DC8 139, 138, 112, 62, 181, 102, 72, 3, 246, 14, 97, 53, 87, 185, 134
        DC8 193, 29, 158, 225, 248, 152, 17, 105, 217, 142, 148, 155, 30, 135
        DC8 233, 206, 85, 40, 223, 140, 161, 137, 13, 191, 230, 66, 104, 65
        DC8 153, 45, 15, 176, 84, 187, 22

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
rsbox:
        DATA
        DC8 82, 9, 106, 213, 48, 54, 165, 56, 191, 64, 163, 158, 129, 243, 215
        DC8 251, 124, 227, 57, 130, 155, 47, 255, 135, 52, 142, 67, 68, 196
        DC8 222, 233, 203, 84, 123, 148, 50, 166, 194, 35, 61, 238, 76, 149, 11
        DC8 66, 250, 195, 78, 8, 46, 161, 102, 40, 217, 36, 178, 118, 91, 162
        DC8 73, 109, 139, 209, 37, 114, 248, 246, 100, 134, 104, 152, 22, 212
        DC8 164, 92, 204, 93, 101, 182, 146, 108, 112, 72, 80, 253, 237, 185
        DC8 218, 94, 21, 70, 87, 167, 141, 157, 132, 144, 216, 171, 0, 140, 188
        DC8 211, 10, 247, 228, 88, 5, 184, 179, 69, 6, 208, 44, 30, 143, 202
        DC8 63, 15, 2, 193, 175, 189, 3, 1, 19, 138, 107, 58, 145, 17, 65, 79
        DC8 103, 220, 234, 151, 242, 207, 206, 240, 180, 230, 115, 150, 172
        DC8 116, 34, 231, 173, 53, 133, 226, 249, 55, 232, 28, 117, 223, 110
        DC8 71, 241, 26, 113, 29, 41, 197, 137, 111, 183, 98, 14, 170, 24, 190
        DC8 27, 252, 86, 62, 75, 198, 210, 121, 32, 154, 219, 192, 254, 120
        DC8 205, 90, 244, 31, 221, 168, 51, 136, 7, 199, 49, 177, 18, 16, 89
        DC8 39, 128, 236, 95, 96, 81, 127, 169, 25, 181, 74, 13, 45, 229, 122
        DC8 159, 147, 201, 156, 239, 160, 224, 59, 77, 174, 42, 245, 176, 200
        DC8 235, 187, 60, 131, 83, 153, 97, 23, 43, 4, 126, 186, 119, 214, 38
        DC8 225, 105, 20, 99, 85, 33, 12, 125

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
Rcon:
        DATA
        DC8 141, 1, 2, 4, 8, 16, 32, 64, 128, 27, 54, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
KeyExpansion:
        PUSH     {R3-R7}
        MOVS     R5,#+0
        MOVS     R4,R5
??KeyExpansion_0:
        CMP      R4,#+4
        BCS.N    ??KeyExpansion_1
        LDRB     R5,[R1, R4, LSL #+2]
        STRB     R5,[R0, R4, LSL #+2]
        ADDS     R5,R1,R4, LSL #+2
        LDRB     R5,[R5, #+1]
        ADDS     R6,R0,R4, LSL #+2
        STRB     R5,[R6, #+1]
        ADDS     R5,R1,R4, LSL #+2
        LDRB     R5,[R5, #+2]
        ADDS     R6,R0,R4, LSL #+2
        STRB     R5,[R6, #+2]
        ADDS     R5,R1,R4, LSL #+2
        LDRB     R5,[R5, #+3]
        ADDS     R6,R0,R4, LSL #+2
        STRB     R5,[R6, #+3]
        ADDS     R4,R4,#+1
        B.N      ??KeyExpansion_0
??KeyExpansion_1:
        MOVS     R5,#+4
        MOVS     R4,R5
??KeyExpansion_2:
        CMP      R4,#+44
        BCS.N    ??KeyExpansion_3
        SUBS     R5,R4,#+1
        LSLS     R5,R5,#+2
        MOVS     R3,R5
        LDRB     R5,[R3, R0]
        STRB     R5,[SP, #+0]
        ADDS     R5,R3,R0
        LDRB     R5,[R5, #+1]
        STRB     R5,[SP, #+1]
        ADDS     R5,R3,R0
        LDRB     R5,[R5, #+2]
        STRB     R5,[SP, #+2]
        ADDS     R5,R3,R0
        LDRB     R5,[R5, #+3]
        STRB     R5,[SP, #+3]
        MOVS     R5,#+4
        UDIV     R6,R4,R5
        MLS      R6,R6,R5,R4
        CMP      R6,#+0
        BNE.N    ??KeyExpansion_4
        LDRB     R5,[SP, #+0]
        MOVS     R3,R5
        LDRB     R5,[SP, #+1]
        STRB     R5,[SP, #+0]
        LDRB     R5,[SP, #+2]
        STRB     R5,[SP, #+1]
        LDRB     R5,[SP, #+3]
        STRB     R5,[SP, #+2]
        MOVS     R5,R3
        STRB     R5,[SP, #+3]
        LDR.W    R5,??DataTable2
        LDRB     R6,[SP, #+0]
        LDRB     R5,[R6, R5]
        STRB     R5,[SP, #+0]
        LDR.W    R5,??DataTable2
        LDRB     R6,[SP, #+1]
        LDRB     R5,[R6, R5]
        STRB     R5,[SP, #+1]
        LDR.W    R5,??DataTable2
        LDRB     R6,[SP, #+2]
        LDRB     R5,[R6, R5]
        STRB     R5,[SP, #+2]
        LDR.W    R5,??DataTable2
        LDRB     R6,[SP, #+3]
        LDRB     R5,[R6, R5]
        STRB     R5,[SP, #+3]
        LDRB     R5,[SP, #+0]
        LDR.W    R6,??DataTable2_1
        LSRS     R7,R4,#+2
        LDRB     R6,[R7, R6]
        EORS     R5,R6,R5
        STRB     R5,[SP, #+0]
??KeyExpansion_4:
        LSLS     R5,R4,#+2
        MOVS     R2,R5
        SUBS     R5,R4,#+4
        LSLS     R5,R5,#+2
        MOVS     R3,R5
        LDRB     R5,[R3, R0]
        LDRB     R6,[SP, #+0]
        EORS     R5,R6,R5
        STRB     R5,[R2, R0]
        ADDS     R5,R3,R0
        LDRB     R5,[R5, #+1]
        LDRB     R6,[SP, #+1]
        EORS     R5,R6,R5
        ADDS     R6,R2,R0
        STRB     R5,[R6, #+1]
        ADDS     R5,R3,R0
        LDRB     R5,[R5, #+2]
        LDRB     R6,[SP, #+2]
        EORS     R5,R6,R5
        ADDS     R6,R2,R0
        STRB     R5,[R6, #+2]
        ADDS     R5,R3,R0
        LDRB     R5,[R5, #+3]
        LDRB     R6,[SP, #+3]
        EORS     R5,R6,R5
        ADDS     R6,R2,R0
        STRB     R5,[R6, #+3]
        ADDS     R4,R4,#+1
        B.N      ??KeyExpansion_2
??KeyExpansion_3:
        POP      {R0,R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AES_init_ctx:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R1,R5
        MOVS     R0,R4
        BL       KeyExpansion
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AES_init_ctx_iv:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,R5
        MOVS     R0,R4
        BL       KeyExpansion
        MOVS     R7,#+16
        ADDS     R8,R4,#+176
        MOVS     R2,R7
        MOVS     R1,R6
        MOV      R0,R8
        BL       __aeabi_memcpy
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AES_ctx_set_iv:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+16
        ADDS     R7,R4,#+176
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R7
        BL       __aeabi_memcpy
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AddRoundKey:
        PUSH     {R4-R7}
        MOVS     R5,#+0
        MOVS     R3,R5
??AddRoundKey_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+4
        BGE.N    ??AddRoundKey_1
        MOVS     R5,#+0
        MOVS     R4,R5
??AddRoundKey_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BGE.N    ??AddRoundKey_3
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ADDS     R5,R1,R3, LSL #+2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ADDS     R6,R1,R3, LSL #+2
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRB     R6,[R4, R6]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R7,R3,#+2
        ADDS     R7,R7,R0, LSL #+4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R7,R4,R7
        LDRB     R7,[R7, R2]
        EORS     R6,R7,R6
        STRB     R6,[R4, R5]
        ADDS     R4,R4,#+1
        B.N      ??AddRoundKey_2
??AddRoundKey_3:
        ADDS     R3,R3,#+1
        B.N      ??AddRoundKey_0
??AddRoundKey_1:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SubBytes:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R1,R3
??SubBytes_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+4
        BGE.N    ??SubBytes_1
        MOVS     R3,#+0
        MOVS     R2,R3
??SubBytes_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+4
        BGE.N    ??SubBytes_3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R0,R2, LSL #+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.W    R4,??DataTable2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R5,R0,R2, LSL #+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRB     R5,[R1, R5]
        LDRB     R4,[R5, R4]
        STRB     R4,[R1, R3]
        ADDS     R2,R2,#+1
        B.N      ??SubBytes_2
??SubBytes_3:
        ADDS     R1,R1,#+1
        B.N      ??SubBytes_0
??SubBytes_1:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ShiftRows:
        LDRB     R2,[R0, #+1]
        MOVS     R1,R2
        LDRB     R2,[R0, #+5]
        STRB     R2,[R0, #+1]
        LDRB     R2,[R0, #+9]
        STRB     R2,[R0, #+5]
        LDRB     R2,[R0, #+13]
        STRB     R2,[R0, #+9]
        STRB     R1,[R0, #+13]
        LDRB     R2,[R0, #+2]
        MOVS     R1,R2
        LDRB     R2,[R0, #+10]
        STRB     R2,[R0, #+2]
        STRB     R1,[R0, #+10]
        LDRB     R2,[R0, #+6]
        MOVS     R1,R2
        LDRB     R2,[R0, #+14]
        STRB     R2,[R0, #+6]
        STRB     R1,[R0, #+14]
        LDRB     R2,[R0, #+3]
        MOVS     R1,R2
        LDRB     R2,[R0, #+15]
        STRB     R2,[R0, #+3]
        LDRB     R2,[R0, #+11]
        STRB     R2,[R0, #+15]
        LDRB     R2,[R0, #+7]
        STRB     R2,[R0, #+11]
        STRB     R1,[R0, #+7]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
xtime:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R1,R0,#+7
        MOVS     R2,#+27
        MULS     R1,R2,R1
        EORS     R0,R1,R0, LSL #+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
MixColumns:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R0,#+0
        MOVS     R5,R0
??MixColumns_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BGE.N    ??MixColumns_1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R4, R5, LSL #+2]
        MOV      R8,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R4, R5, LSL #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R4,R5, LSL #+2
        LDRB     R1,[R1, #+1]
        EORS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R4,R5, LSL #+2
        LDRB     R1,[R1, #+2]
        EORS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R4,R5, LSL #+2
        LDRB     R1,[R1, #+3]
        EORS     R0,R1,R0
        MOVS     R6,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R4, R5, LSL #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R4,R5, LSL #+2
        LDRB     R1,[R1, #+1]
        EORS     R0,R1,R0
        MOVS     R7,R0
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R7,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R4, R5, LSL #+2]
        EORS     R1,R6,R7
        EORS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STRB     R0,[R4, R5, LSL #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R4,R5, LSL #+2
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R4,R5, LSL #+2
        LDRB     R1,[R1, #+2]
        EORS     R0,R1,R0
        MOVS     R7,R0
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R7,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R4,R5, LSL #+2
        LDRB     R0,[R0, #+1]
        EORS     R1,R6,R7
        EORS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R4,R5, LSL #+2
        STRB     R0,[R1, #+1]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R4,R5, LSL #+2
        LDRB     R0,[R0, #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R4,R5, LSL #+2
        LDRB     R1,[R1, #+3]
        EORS     R0,R1,R0
        MOVS     R7,R0
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R7,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R4,R5, LSL #+2
        LDRB     R0,[R0, #+2]
        EORS     R1,R6,R7
        EORS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R4,R5, LSL #+2
        STRB     R0,[R1, #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R4,R5, LSL #+2
        LDRB     R0,[R0, #+3]
        EORS     R0,R8,R0
        MOVS     R7,R0
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R7,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R4,R5, LSL #+2
        LDRB     R0,[R0, #+3]
        EORS     R1,R6,R7
        EORS     R0,R1,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R4,R5, LSL #+2
        STRB     R0,[R1, #+3]
        ADDS     R5,R5,#+1
        B.N      ??MixColumns_0
??MixColumns_1:
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
InvMixColumns:
        PUSH     {R0,R4-R11,LR}
        SUB      SP,SP,#+16
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
??InvMixColumns_0:
        LDR      R0,[SP, #+12]
        CMP      R0,#+4
        BGE.W    ??InvMixColumns_1
        LDR      R0,[SP, #+16]
        LDR      R1,[SP, #+12]
        LDRB     R0,[R0, R1, LSL #+2]
        STRB     R0,[SP, #+3]
        LDR      R0,[SP, #+16]
        LDR      R1,[SP, #+12]
        ADDS     R0,R0,R1, LSL #+2
        LDRB     R0,[R0, #+1]
        STRB     R0,[SP, #+2]
        LDR      R0,[SP, #+16]
        LDR      R1,[SP, #+12]
        ADDS     R0,R0,R1, LSL #+2
        LDRB     R0,[R0, #+2]
        STRB     R0,[SP, #+1]
        LDR      R0,[SP, #+16]
        LDR      R1,[SP, #+12]
        ADDS     R0,R0,R1, LSL #+2
        LDRB     R0,[R0, #+3]
        STRB     R0,[SP, #+0]
        LDRB     R0,[SP, #+3]
        BL       xtime
        STRB     R0,[SP, #+4]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+5]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+6]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+7]
        LDRB     R0,[SP, #+2]
        BL       xtime
        STRB     R0,[SP, #+8]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+9]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+10]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R4,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        MOVS     R5,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R6,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R7,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R8,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        MOV      R9,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R10,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R11,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        LDRB     R1,[SP, #+3]
        MOVS     R2,#+0
        MULS     R1,R2,R1
        LDRB     R2,[SP, #+4]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+5]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+6]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+7]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+2]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+8]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+9]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+10]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R4
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+1]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R5
        EORS     R1,R2,R1
        EORS     R1,R6,R1
        EORS     R1,R7,R1
        MOVS     R2,#+0
        MUL      R2,R2,R8
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+0]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R9
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R10
        EORS     R1,R2,R1
        EORS     R4,R11,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R1,#+0
        MULS     R0,R1,R0
        EORS     R0,R0,R4
        LDR      R1,[SP, #+16]
        LDR      R2,[SP, #+12]
        STRB     R0,[R1, R2, LSL #+2]
        LDRB     R0,[SP, #+3]
        BL       xtime
        STRB     R0,[SP, #+10]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+9]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+8]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R4,R0
        LDRB     R0,[SP, #+2]
        BL       xtime
        STRB     R0,[SP, #+7]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+6]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+5]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R5,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        STRB     R0,[SP, #+4]
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R6,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R7,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R8,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        MOV      R9,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R10,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R11,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        LDRB     R1,[SP, #+3]
        LDRB     R2,[SP, #+10]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+9]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+8]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R4
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+2]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+7]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+6]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+5]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R5
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+1]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+4]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R6
        EORS     R1,R2,R1
        EORS     R1,R7,R1
        MOVS     R2,#+0
        MUL      R2,R2,R8
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+0]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R9
        EORS     R1,R2,R1
        EORS     R1,R10,R1
        EORS     R4,R11,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R1,#+0
        MULS     R0,R1,R0
        EORS     R0,R0,R4
        LDR      R1,[SP, #+16]
        LDR      R2,[SP, #+12]
        ADDS     R1,R1,R2, LSL #+2
        STRB     R0,[R1, #+1]
        LDRB     R0,[SP, #+3]
        BL       xtime
        STRB     R0,[SP, #+4]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+5]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+6]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+7]
        LDRB     R0,[SP, #+2]
        BL       xtime
        STRB     R0,[SP, #+8]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R4,R0
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+9]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R5,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        STRB     R0,[SP, #+10]
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R6,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R7,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R8,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        MOV      R9,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R10,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R11,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        LDRB     R1,[SP, #+3]
        LDRB     R2,[SP, #+4]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+5]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+6]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+7]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+2]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+8]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R4
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+9]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R5
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+1]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+10]
        EORS     R1,R2,R1
        EORS     R1,R6,R1
        EORS     R1,R7,R1
        MOVS     R2,#+0
        MUL      R2,R2,R8
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+0]
        EORS     R1,R2,R1
        EORS     R1,R9,R1
        MOVS     R2,#+0
        MUL      R2,R2,R10
        EORS     R1,R2,R1
        EORS     R4,R11,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R1,#+0
        MULS     R0,R1,R0
        EORS     R0,R0,R4
        LDR      R1,[SP, #+16]
        LDR      R2,[SP, #+12]
        ADDS     R1,R1,R2, LSL #+2
        STRB     R0,[R1, #+2]
        LDRB     R0,[SP, #+3]
        BL       xtime
        STRB     R0,[SP, #+10]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+9]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+8]
        LDRB     R0,[SP, #+3]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+7]
        LDRB     R0,[SP, #+2]
        BL       xtime
        STRB     R0,[SP, #+6]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+5]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        STRB     R0,[SP, #+4]
        LDRB     R0,[SP, #+2]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R4,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        MOVS     R5,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R6,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R7,R0
        LDRB     R0,[SP, #+1]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R8,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        MOV      R9,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R10,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOV      R11,R0
        LDRB     R0,[SP, #+0]
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        LDRB     R1,[SP, #+3]
        LDRB     R2,[SP, #+10]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+9]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+8]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+7]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+2]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+6]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+5]
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+4]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R4
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+1]
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R5
        EORS     R1,R2,R1
        MOVS     R2,#+0
        MUL      R2,R2,R6
        EORS     R1,R2,R1
        EORS     R1,R7,R1
        MOVS     R2,#+0
        MUL      R2,R2,R8
        EORS     R1,R2,R1
        LDRB     R2,[SP, #+0]
        MOVS     R3,#+0
        MULS     R2,R3,R2
        EORS     R1,R2,R1
        EORS     R1,R9,R1
        EORS     R1,R10,R1
        EORS     R4,R11,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       xtime
        MOVS     R1,#+0
        MULS     R0,R1,R0
        EORS     R0,R0,R4
        LDR      R1,[SP, #+16]
        LDR      R2,[SP, #+12]
        ADDS     R1,R1,R2, LSL #+2
        STRB     R0,[R1, #+3]
        LDR      R0,[SP, #+12]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+12]
        B.N      ??InvMixColumns_0
??InvMixColumns_1:
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
InvSubBytes:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R1,R3
??InvSubBytes_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+4
        BGE.N    ??InvSubBytes_1
        MOVS     R3,#+0
        MOVS     R2,R3
??InvSubBytes_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+4
        BGE.N    ??InvSubBytes_3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R3,R0,R2, LSL #+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R4,??DataTable2_2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ADDS     R5,R0,R2, LSL #+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRB     R5,[R1, R5]
        LDRB     R4,[R5, R4]
        STRB     R4,[R1, R3]
        ADDS     R2,R2,#+1
        B.N      ??InvSubBytes_2
??InvSubBytes_3:
        ADDS     R1,R1,#+1
        B.N      ??InvSubBytes_0
??InvSubBytes_1:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     sbox

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     Rcon

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     rsbox

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
InvShiftRows:
        LDRB     R2,[R0, #+13]
        MOVS     R1,R2
        LDRB     R2,[R0, #+9]
        STRB     R2,[R0, #+13]
        LDRB     R2,[R0, #+5]
        STRB     R2,[R0, #+9]
        LDRB     R2,[R0, #+1]
        STRB     R2,[R0, #+5]
        STRB     R1,[R0, #+1]
        LDRB     R2,[R0, #+2]
        MOVS     R1,R2
        LDRB     R2,[R0, #+10]
        STRB     R2,[R0, #+2]
        STRB     R1,[R0, #+10]
        LDRB     R2,[R0, #+6]
        MOVS     R1,R2
        LDRB     R2,[R0, #+14]
        STRB     R2,[R0, #+6]
        STRB     R1,[R0, #+14]
        LDRB     R2,[R0, #+3]
        MOVS     R1,R2
        LDRB     R2,[R0, #+7]
        STRB     R2,[R0, #+3]
        LDRB     R2,[R0, #+11]
        STRB     R2,[R0, #+7]
        LDRB     R2,[R0, #+15]
        STRB     R2,[R0, #+11]
        STRB     R1,[R0, #+15]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Cipher:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,#+0
        BL       AddRoundKey
        MOVS     R0,#+1
        MOVS     R6,R0
??Cipher_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+10
        BGE.N    ??Cipher_1
        MOVS     R0,R4
        BL       SubBytes
        MOVS     R0,R4
        BL       ShiftRows
        MOVS     R0,R4
        BL       MixColumns
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       AddRoundKey
        ADDS     R6,R6,#+1
        B.N      ??Cipher_0
??Cipher_1:
        MOVS     R0,R4
        BL       SubBytes
        MOVS     R0,R4
        BL       ShiftRows
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,#+10
        BL       AddRoundKey
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
InvCipher:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,#+10
        BL       AddRoundKey
        MOVS     R0,#+9
        MOVS     R6,R0
??InvCipher_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??InvCipher_1
        MOVS     R0,R4
        BL       InvShiftRows
        MOVS     R0,R4
        BL       InvSubBytes
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       AddRoundKey
        MOVS     R0,R4
        BL       InvMixColumns
        SUBS     R6,R6,#+1
        B.N      ??InvCipher_0
??InvCipher_1:
        MOVS     R0,R4
        BL       InvShiftRows
        MOVS     R0,R4
        BL       InvSubBytes
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,#+0
        BL       AddRoundKey
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
XorWithIv:
        PUSH     {R4}
        MOVS     R3,#+0
        MOVS     R2,R3
??XorWithIv_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BGE.N    ??XorWithIv_1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R3,[R2, R0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R4,[R2, R1]
        EORS     R3,R4,R3
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRB     R3,[R2, R0]
        ADDS     R2,R2,#+1
        B.N      ??XorWithIv_0
??XorWithIv_1:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AES_CBC_encrypt_buffer:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        ADDS     R8,R4,#+176
        MOVS     R0,#+0
        MOVS     R7,R0
??AES_CBC_encrypt_buffer_0:
        CMP      R7,R6
        BCS.N    ??AES_CBC_encrypt_buffer_1
        MOV      R1,R8
        MOVS     R0,R5
        BL       XorWithIv
        MOVS     R1,R4
        MOVS     R0,R5
        BL       Cipher
        MOV      R8,R5
        ADDS     R5,R5,#+16
        ADDS     R7,R7,#+16
        B.N      ??AES_CBC_encrypt_buffer_0
??AES_CBC_encrypt_buffer_1:
        MOVS     R9,#+16
        ADDS     R10,R4,#+176
        MOV      R2,R9
        MOV      R1,R8
        MOV      R0,R10
        BL       __aeabi_memcpy
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
AES_CBC_decrypt_buffer:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+28
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R0,#+0
        MOVS     R7,R0
??AES_CBC_decrypt_buffer_0:
        CMP      R7,R6
        BCS.N    ??AES_CBC_decrypt_buffer_1
        MOVS     R8,#+16
        STR      R5,[SP, #+0]
        ADD      R9,SP,#+8
        MOV      R2,R8
        LDR      R1,[SP, #+0]
        MOV      R0,R9
        BL       __aeabi_memcpy
        STR      R9,[SP, #+4]
        MOVS     R1,R4
        MOVS     R0,R5
        BL       InvCipher
        ADDS     R1,R4,#+176
        MOVS     R0,R5
        BL       XorWithIv
        MOVS     R9,#+16
        ADD      R10,SP,#+8
        ADDS     R11,R4,#+176
        MOV      R2,R9
        MOV      R1,R10
        MOV      R0,R11
        BL       __aeabi_memcpy
        ADDS     R5,R5,#+16
        ADDS     R7,R7,#+16
        B.N      ??AES_CBC_decrypt_buffer_0
??AES_CBC_decrypt_buffer_1:
        ADD      SP,SP,#+28
        POP      {R4-R11,PC}      ;; return

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
//   524 bytes in section .rodata
// 3 256 bytes in section .text
// 
// 3 256 bytes of CODE  memory
//   524 bytes of CONST memory
//
//Errors: none
//Warnings: 1
