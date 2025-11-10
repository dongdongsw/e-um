package com.eum.list.vo;
import java.util.*;

import lombok.Data;
/*
 * 	O_ID          NOT NULL VARCHAR2(50) 
	B_OP_ID       NOT NULL NUMBER(5)    
	O_STATUS      NOT NULL VARCHAR2(30) 
	O_TOTAL_PRICE NOT NULL NUMBER(12,2) 
	O_CREATEDAT   NOT NULL DATE         
	O_UPDATEDAT   NOT NULL DATE    
 */
@Data
public class OrdersVO {
	private int b_op_id,o_total_price;
	private String o_id,o_status;
	private Date o_createdat,o_updatedat;
}
