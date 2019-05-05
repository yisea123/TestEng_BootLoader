/**
  ******************************************************************************
  * @file    check_error.c  burn in system
  * @author  h&h
  * @version 
  * @date    
* @brief   digital monitor & dignose
  ******************************************************************************
**/ 

#include "include.h"




/******************************************************************************
  * @brief   check_error
  * @param   
  * @retval  
  * @Description:	
        
  */
 uint8_t check_error(uint16_t * data_buf,
                    uint8_t error_type,
                    uint8_t datanum, 
                    uint16_t max_safe_value, 
                    uint16_t min_safe_value)
{
    for(uint8_t i=0;i<datanum;i++)
    {
	if( (*(data_buf+i) > max_safe_value) || (*(data_buf+i) < min_safe_value))
	{
	    
            if(error_type==DFB_CURRENT_ERROR || error_type==DFB_MPD_ERROR)
            {
            }
            
            if(error_type==DFB_VOLTAGE_ERROR)
            {
                //Disable_vout_output_all();
            }
                
	    //set_module_state(RESET_STATE);
	    return ERROR;
	}
    }
    return SUCCESS;
}

/******************* (C) COPYRIGHT 2018 *****END OF FILE****/