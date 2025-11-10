package com.eum.list.vo;
import java.util.*;

import lombok.Data;
/*
 * 	PAY_ID       NOT NULL VARCHAR2(50)  
	O_ID         NOT NULL VARCHAR2(50)  
	IMP_UID      NOT NULL VARCHAR2(50)  
	MERCHANT_UID NOT NULL VARCHAR2(50)  
	AMOUNT       NOT NULL NUMBER(12,2)  
	STATUS       NOT NULL VARCHAR2(30)  
	PAY_METHOD   NOT NULL VARCHAR2(30)  
	PG_PROVIDER  NOT NULL VARCHAR2(30)  
	RECEIPT_URL  NOT NULL VARCHAR2(500) 
	PAID_AT               DATE          
	CANCELED_AT           DATE          
	O_METHOD     NOT NULL VARCHAR2(30)  
 */
@Data
public class PaymentVO {
	private int amount;
	private String pay_id,o_id,imp_uid,merchant_uid,status,pay_method,pg_provider,receipt_url,o_method;
	private Date paid_at,canceled_at;
}
