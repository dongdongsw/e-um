package com.eum.list.vo;
import java.util.*;

import lombok.Data;
/*
 * 	U_S_ID             NOT NULL NUMBER        
	U_ID               NOT NULL VARCHAR2(30)  
	U_S_CARRER                  VARCHAR2(500) 
	U_S_ZONE                    VARCHAR2(200) 
	U_CREATEAT         NOT NULL DATE          
	U_UPDATEAT                  DATE          
	U_S_BIZ_NO                  VARCHAR2(500) 
	U_S_COM                     VARCHAR2(500) 
	U_S_PROFILEIMG_URL          VARCHAR2(300) 
	U_S_ROLE           NOT NULL VARCHAR2(15) 
 */
@Data
public class Users_SellerVO {
	private int u_s_id;
	private String u_id,u_s_carrer,u_s_zone,u_s_biz_no,u_s_com,u_s_profileimg_url,u_s_role;
	private Date u_createat,u_updateat;
}
