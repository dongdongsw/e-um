package com.eum.list.vo;
import java.util.*;

import lombok.Data;
/*
 * 	MSG_ID          NOT NULL NUMBER         
	C_ID            NOT NULL NUMBER         
	MSG_SENDER_U_ID          VARCHAR2(30)   
	MSG_SENDER_S_ID          NUMBER         
	MSG_SENDER_A_ID          VARCHAR2(30)   
	MSG_CONT        NOT NULL VARCHAR2(1000) 
	MSG_READ        NOT NULL CHAR(1)        
	MSG_IMG_URL              VARCHAR2(300)  
	MSG_SENDAT      NOT NULL TIMESTAMP(6) 
 */
@Data
public class Chat_MessageVO {
	private int msg_id,c_id,msg_sender_s_id;
	private String msg_sender_u_id,msg_sender_a_id,msg_cont,msg_read,msg_img_url;
	private Date msg_sendat;
}
