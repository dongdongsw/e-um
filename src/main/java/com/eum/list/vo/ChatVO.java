package com.eum.list.vo;

import java.util.Date;

import lombok.Data;

/*
 	C_ID            NOT NULL NUMBER       
	U_ID            NOT NULL VARCHAR2(30) 
	U_S_ID          NOT NULL NUMBER       
	C_ROOM_CREATEAT NOT NULL DATE
 */

@Data
public class ChatVO {

	private int c_id, u_s_id;
	private String u_id;
	private Date c_room_createAt;
}
