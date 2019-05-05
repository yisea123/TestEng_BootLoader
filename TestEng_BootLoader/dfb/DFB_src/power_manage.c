/**
  ******************************************************************************
  * @file    power_manage.c  burn in system
  * @author  h&h
  * @version 
  * @date    
  * @brief  manage power system

  ******************************************************************************
**/ 

#include "include.h"

volatile uint16_t globle_flag_power_status=0;
volatile uint16_t globle_flag_dfb_current_status=0;
volatile uint16_t globle_flag_dfb_voltage_status=0;


/******************************************************************************
  * @brief   all_sys_power_on()
  * @param  None
  * @retval None
  * @Description  power on +-5v  3.3v for current source  4 voltage source
                  set gloable flags for power status
                  
*/
void all_sys_power_on(void)
{
    set_power_status(P_N_5V_ON | CURRENT_SOURCE_3V3_ON | ALL_2974_CH_ON);

}


/******************************************************************************
  * @brief   all_sys_power_off()
  * @param  None
  * @retval None
  * @Description  power off +-5v  3.3v for current source  4 voltage source
                  clear gloable flags for power status
                  
**/
void all_sys_power_off(void)
{
  clear_power_status(P_N_5V_ON | CURRENT_SOURCE_3V3_ON | ALL_2974_CH_ON);
}


/******************************************************************************
  * @brief   check_power_status()
  * @param  None
  * @retval None
  * @Description  check if the power is on
                  
**/
__ramfunc uint8_t check_power_status(uint16_t power_kind)
{
    if(globle_flag_power_status & power_kind)
        return SUCCESS;
    else
        return ERROR;
}
/******************************************************************************
  * @brief   set_power_status()
  * @param  None
  * @retval None
  * @Description  set power status
                  
**/
__ramfunc void set_power_status(uint16_t power_kind)
{
    globle_flag_power_status |=power_kind;
}

/******************************************************************************
  * @brief   clear_power_status()
  * @param  None
  * @retval None
  * @Description  set power status
                  
**/
__ramfunc void clear_power_status(uint16_t power_kind)
{
    globle_flag_power_status &=(~power_kind);
}



/******************************************************************************
  * @brief   check_current_source_status()
  * @param  None
  * @retval None
  * @Description 
                  
**/
__ramfunc uint8_t check_current_source_status(uint16_t dfb_current_ch)
{
  if(globle_flag_dfb_current_status & dfb_current_ch)
    return SUCCESS;
  else
    return ERROR;
}
/******************************************************************************
  * @brief   set_current_source_status()
  * @param  None
  * @retval None
  * @Description  set power status
                  
**/
__ramfunc void set_current_source_status(uint16_t dfb_current_ch)
{
  globle_flag_dfb_current_status |=dfb_current_ch;
}
/******************************************************************************
  * @brief   clear_current_source_status()
  * @param  None
  * @retval None
  * @Description  
                  
**/
__ramfunc void clear_current_source_status(uint16_t dfb_current_ch)
{
  globle_flag_dfb_current_status &= (~dfb_current_ch);
}

/******************************************************************************
  * @brief   check_voltage_source_status()
  * @param  None
  * @retval None
  * @Description 
                  
**/
__ramfunc uint8_t check_voltage_source_status(uint16_t dfb_voltage_ch)
{
  if(globle_flag_dfb_voltage_status & dfb_voltage_ch)
    return SUCCESS;
  else
    return ERROR;
}
/******************************************************************************
  * @brief   set_voltage_source_status()
  * @param  None
  * @retval None
  * @Description  set power status
                  
**/
__ramfunc void set_voltage_source_status(uint16_t dfb_voltage_ch)
{
  globle_flag_dfb_voltage_status |=dfb_voltage_ch;
}
/******************************************************************************
  * @brief   clear_voltage_source_status()
  * @param  None
  * @retval None
  * @Description  
                  
**/
__ramfunc void clear_voltage_source_status(uint16_t dfb_voltage_ch)
{
  globle_flag_dfb_voltage_status &=(~dfb_voltage_ch);
}

/******************* (C) COPYRIGHT 2018 *****END OF FILE****/