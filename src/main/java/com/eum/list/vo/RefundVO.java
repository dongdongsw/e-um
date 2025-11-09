package com.eum.list.vo;

import java.util.Date;

import lombok.Data;

/*
 	RF_ID          NOT NULL VARCHAR2(50)  
	PAY_ID         NOT NULL VARCHAR2(50)  
	RF_REASON      NOT NULL VARCHAR2(500) 
	RF_AMOUNT      NOT NULL NUMBER(12,2)  
	RF_STATUS      NOT NULL VARCHAR2(30)  
	RF_REQUESTEDAT NOT NULL DATE          
	RF_COMPLETEDAT          DATE   
 */

@Data
public class RefundVO {

	private String rf_id, pay_id, rf_reason, rf_amount, rf_status;
	private Date rf_requestdAt, rf_completedAt;
}
