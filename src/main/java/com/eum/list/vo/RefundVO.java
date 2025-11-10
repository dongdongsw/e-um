package com.eum.list.vo;
import java.util.*;

import lombok.Data;
/*
 * 	RF_ID          NOT NULL VARCHAR2(50)  
	PAY_ID         NOT NULL VARCHAR2(50)  
	RF_REASON      NOT NULL VARCHAR2(500) 
	RF_AMOUNT      NOT NULL NUMBER(12,2)  
	RF_STATUS      NOT NULL VARCHAR2(30)  
	RF_REQUESTEDAT NOT NULL DATE          
	RF_COMPLETEDAT          DATE 
 */
@Data
public class RefundVO {
	private int rf_amount;
	private String rf_id,pay_id,rf_reason,rf_status;
	private Date rf_requestedat,rf_completedat;
}
