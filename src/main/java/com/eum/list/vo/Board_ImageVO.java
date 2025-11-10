package com.eum.list.vo;

import lombok.Data;

/*
 * 	B_IMG_ID  NOT NULL NUMBER       
	B_ID               VARCHAR2(30) 
	B_IMG_URL          CLOB  
 */
@Data
public class Board_ImageVO {
	private int b_img_id;
	private String b_id,b_img_url;
}
