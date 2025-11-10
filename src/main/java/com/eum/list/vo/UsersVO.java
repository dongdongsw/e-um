package com.eum.list.vo;
import java.util.*;

import lombok.Data;
/*
 * 	U_ID             NOT NULL VARCHAR2(30)  
	U_LOGINID        NOT NULL VARCHAR2(30)  
	U_PWD            NOT NULL VARCHAR2(20)  
	U_PROFILEIMG_URL          VARCHAR2(300) 
	U_NICKNAME       NOT NULL VARCHAR2(20)  
	U_EMAIL          NOT NULL VARCHAR2(30)  
	U_PHONE                   VARCHAR2(20)  
	U_GENDER         NOT NULL CHAR(3)       
	U_BIRTH          NOT NULL DATE          
	U_LOC                     VARCHAR2(70)  
	U_CREATEAT       NOT NULL DATE          
	U_UPDATEAT                DATE          
	U_STATUS         NOT NULL VARCHAR2(10)  
	U_PUSH_NOTI               CHAR(1)       
	U_EMAIL_NOTI              CHAR(1)       
	U_SMS_NOTI                CHAR(1)       
	U_ROLE           NOT NULL VARCHAR2(15) 
 */
@Data
public class UsersVO {
	private String u_id,u_loginid,u_pwd,u_profileimg_url,u_nickname,u_email,u_phone,u_gender,u_loc,u_status,u_push_noti,u_email_noti,u_sms_noti,u_role;
	private Date u_birth,u_createat,u_updateat;
}
