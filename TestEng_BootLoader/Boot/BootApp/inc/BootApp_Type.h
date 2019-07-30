/*<BASDKey>
 **********************************************************************************************************************
 *
 * COPYRIGHT RESERVED, FeedLiTech, 2019. All rights reserved.
 * The reproduction, distribution and utilization of this document as well as the communication of its contents to
 * others without explicit authorization is prohibited. Offenders will be held liable for the payment of damages.
 * All rights reserved in the event of the grant of a patent, utility model or design.
 *
 **********************************************************************************************************************
</BASDKey>*/

#ifndef _BOOTAPP_TYPE_H_
#define _BOOTAPP_TYPE_H_

typedef enum
{
    BOOTAPP_RESET_POWERON,
    BOOTAPP_RESET_PROG,
}BootApp_Reset_ten;




typedef enum
{
    BOOTAPP_STATE_INIT,     /*Init state*/
    BOOTAPP_STATE_RCMD,     /*Receive command*/
    BOOTAPP_STATE_STRP,     /*Start program, erase app*/
    BOOTAPP_STATE_RDAT,     /*Receive data*/
    BOOTAPP_STATE_WDAT,     /*Write data*/
    BOOTAPP_STATE_VALI,     /*Validate app*/
    BOOTAPP_STATE_JUMP,     /*Jump to app*/
    BOOTAPP_STATE_NUMB,
}BootApp_State_ten;

typedef enum
{
    BOOTAPP_STATUS_INI,
    BOOTAPP_EREASE_OK = 0x1001,
    BOOTAPP_EREASE_ONGOING = 0x1002,
    BOOTAPP_EREASE_ERR = 0x1003,

    BOOTAPP_RDATA_ONGOING = 0x3001,
    BOOTAPP_RDATA_PAGEOK = 0x3002,
    BOOTAPP_RDATA_FINISH = 0x3003,
    BOOTAPP_RDATA_BUF_FUL_ERR = 0x3004,
    BOOTAPP_RDATA_INVALID_SEC_ERR = 0x3005,
    BOOTAPP_RDATA_SEC_N_COMPLETE_ERR = 0x3006,
    BOOTAPP_RDATA_SEC_N_CONTIOUS_ERR = 0x3007,
    BOOTAPP_RDATA_INVALID_PAGE_ERR = 0x3008,
    BOOTAPP_RDATA_INVALID_PAGE_LEN_ERR = 0x3009,
    BOOTAPP_RDATA_INVALID_STR_ADDR_ERR = 0x300A,
    BOOTAPP_RDATA_PAGE_N_CONTIOUS_ERR = 0x300B,
    BOOTAPP_RDATA_INVALID_SEC_BOUND_ERR = 0x300C,
    BOOTAPP_RDATA_HEX_ADDR_ERR = 0x300D,
    BOOTAPP_RDATA_SEC0_ADDR_ALIGN_ERR = 0x300E,
    BOOTAPP_RDATA_SECN_ADDR_ALIGN_ERR = 0x300F,
    BOOTAPP_RDATA_SEC_WBUF_ERR = 0x3010,

    BOOTAPP_WDAT_ONGOING = 0x4001,
    BOOTAPP_WDAT_SEC_FINISH = 0x4002,
    BOOTAPP_WDAT_FINISH = 0x4003,
    BOOTAPP_WDAT_GET_DATAINFO_ERR = 0x4004,
    BOOTAPP_WDAT_DATA_NOT_READY_ERR = 0x4005,
    BOOTAPP_WDAT_SEC_ADDR_ALIGN_ERR = 0x4006,
    BOOTAPP_WDAT_SEC_LEN_ERR = 0x4007,
    BOOTAPP_WDAT_SEC_NUM_ERR = 0x4008,
    BOOTAPP_WDAT_SEC_NOT_MATCH_ERR = 0x4009,
    BOOTAPP_WDAT_ADDR_NOT_MATCH_ERR = 0x400A,
    BOOTAPP_WDAT_PROG_FLASH_ERR = 0x400B,

    BOOTAAPP_VALI_ONGOING = 0x5001,
    BOOTAAPP_VALI_NOT_COMPLETE = 0x5002,
    BOOTAAPP_VALI_COMPLETE = 0x5003,
    BOOTAAPP_VALI_APPCFG_INVALID = 0x5004,

    BOOTAPP_JUMP_TO_APP = 0x6001,


}BootApp_Status_ten;

typedef struct
{
    uint32_t start_addr;
    uint32_t end_addr;
    uint32_t length;
    uint32_t sector_num;
    uint32_t sector_size;
    uint32_t page_num;
    uint32_t page_size;
}BootApp_Flash_Info_tst;

typedef union
{
    uint8_t  buf_au8[BOOTAPP_APP_SECTOR_SIZE];
    uint16_t buf_au16[BOOTAPP_APP_SECTOR_SIZE/2];
    uint32_t buf_au32[BOOTAPP_APP_SECTOR_SIZE/4];
}BootApp_SectBuffer_ten;

typedef union
{
    uint8_t  buf_au8[BOOTAPP_APP_PAGE_SIZE];
    uint16_t buf_au16[BOOTAPP_APP_PAGE_SIZE/2];
    uint32_t buf_au32[BOOTAPP_APP_PAGE_SIZE/4];
}BootApp_PageBuffer_ten;

typedef struct
{
    uint16_t cmd16_00;
    uint16_t cmd16_01;
    uint16_t cmd16_02;
    uint16_t cmd16_03;
    uint16_t cmd16_04;
    uint16_t cmd16_05;
    uint16_t cmd16_06;
    uint16_t cmd16_07;
    uint16_t cmd16_08;
    uint16_t cmd16_09;
    uint16_t cmd16_0a;
    uint16_t cmd16_0b;
    uint16_t cmd16_0c;
    uint16_t cmd16_0d;
    uint16_t cmd16_0e;
    uint16_t cmd16_0f;
    uint32_t cmd32_00;
    uint32_t cmd32_01;
    uint32_t cmd32_02;
    uint32_t cmd32_03;
    uint32_t cmd32_04;
    uint32_t cmd32_05;
    uint32_t cmd32_06;
    uint32_t cmd32_07;
    uint16_t cmd_res[128 - 32];
}BootApp_CmdBuffer_tst;

typedef struct
{
    BootApp_CmdBuffer_tst cmdbuffer_st;
    BootApp_PageBuffer_ten pagebuffer_en;
}BootApp_CommunicationBuffer_tst;

typedef union
{
    uint16_t buf_au16[BOOTAPP_COMMUBICATION_BUF_SIZE];
    BootApp_CommunicationBuffer_tst com_st;
}BootApp_CommunicationBuffer_tun;

typedef struct
{
    uint16_t fw_version0;
    uint16_t fw_version1;
    uint16_t fw_version2;
    uint16_t fw_res[5];
    uint16_t sts16_00;
    uint16_t sts16_01;
    uint16_t sts16_02;
    uint16_t sts16_03;
    uint16_t sts16_04;
    uint16_t sts16_05;
    uint16_t sts16_06;
    uint16_t sts16_07;
    uint16_t sts_res[BOOTAPP_STATUS_BUF_SIZE - 16];
}BootApp_StsBuffer_tst;

typedef union
{
    uint16_t buf_au16[BOOTAPP_STATUS_BUF_SIZE];
    BootApp_StsBuffer_tst sts_st;
}BootApp_StatusBuffer_tun;

typedef struct
{
    uint16_t page_num_u16;
    uint16_t page_len_u16;
    uint16_t page_str_addr_u16;
    uint16_t page_end_addr_u16;

    uint16_t sect_dirty_u16;
    uint16_t sect_ready_u16;
    uint16_t sect_num_u16;
    uint32_t start_addr_u32;
    uint32_t end_addr_u32;
}BootApp_ReceiveData_tst;


typedef struct
{
    uint16_t sect_num_u16;
    uint16_t sect_prog_u16;
    uint32_t start_addr_u32;
    uint32_t end_addr_u32;
}BootApp_WriteData_tst;

typedef enum
{
    GPIO_BOARD_ADDR,
    GPIO_UART_RX,
    GPIO_UART_TX,
    GPIO_UART_RX_EN,
    GPIO_UART_TX_EN,
    GPIO_ERR_LED,
    GPIO_RUN_LED,
}BootApp_GPIO_Function_ten;

typedef enum
{
    GPIO_WRITE,
    GPIO_READ,
}BootApp_GPIO_Operation_ten;

typedef struct
{
    BootApp_GPIO_TypeDef * app_cfg_gpio;
    BootApp_GPIO_Function_ten app_cfg_gpio_func_en;
    BootApp_GPIO_InitTypeDef app_cfg_gpio_pin_st;
}BootApp_GpioPin_tst;

typedef struct
{
    uint16_t  app_cfg_gpio_num;
    uint16_t  app_cfg_addr_num;
    BootApp_GpioPin_tst *  app_cfg_gpio_init_past;
}BootApp_Gpio_tst;


typedef struct
{
    BootApp_USART_TypeDef * app_cfg_uart;
    BootApp_USART_InitTypeDef app_cfg_uart_port_st;
}BootApp_UartPort_tst;

typedef struct
{
    uint16_t app_cfg_uart_num;
    BootApp_UartPort_tst * app_cfg_uart_init_past;
}BootApp_Uart_tst;

typedef struct
{
    uint8_t app_cfg_hardversion[16];
    uint8_t app_cfg_fwversion[16];
    uint8_t app_cfg_signature[16];
}BootApp_Prolog_tst;

typedef struct
{
    uint8_t app_cfg_hardversion[16];
    uint8_t app_cfg_fwversion[16];
    uint8_t app_cfg_signature[16];
}BootApp_Epilog_tst;

typedef struct
{

    BootApp_Gpio_tst * const app_cfg_gpio_cpcst;
    BootApp_Uart_tst * const app_cfg_uart_cpcst;
    const BootApp_Prolog_tst * const app_cfg_prolog_cpcst;
    const BootApp_Epilog_tst * const app_cfg_epilog_cpcst;
}BootApp_App_Cfg_tst;

typedef enum
{
    BOOTAPP_GETAPP_NOT_INI,
    BOOTAPP_GETAPP_INI
}BootApp_GetApp_init_ten;



#endif

/*<BASDKey>
 ***********************************************************************************************************************
 * $History___:
 *
 * U1.0.0;      20.05.2019 new created for BootLoader he.huang@feedlitech.com
 *
 * $
 ***********************************************************************************************************************
</BASDKey>*/

