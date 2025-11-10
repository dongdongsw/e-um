package com.eum.list.vo;

import lombok.Data;

/*
 * 	B_OP_ID     NOT NULL NUMBER        
	B_ID        NOT NULL VARCHAR2(30)  
	B_OP_TITLE  NOT NULL VARCHAR2(200) 
	B_OP_PRICE  NOT NULL NUMBER(9)     
	B_OP_DETAIL          CLOB   
 */
@Data
public class Board_OptionVO {
	private int b_op_id,b_op_price;
	private String b_id,b_op_title,b_op_detail;
}
