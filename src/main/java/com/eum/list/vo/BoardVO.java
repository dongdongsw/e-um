package com.eum.list.vo;
import java.util.*;

import lombok.Data;
/*
 * 	B_ID          NOT NULL VARCHAR2(30)  
	U_S_ID                 NUMBER        
	B_FILTER               VARCHAR2(60)  
	B_TITLE                VARCHAR2(200) 
	B_CONTENT              CLOB          
	B_VIEW_COUNT           NUMBER        
	B_THUMBNAIL            VARCHAR2(200) 
	B_CREATEDAT            DATE          
	B_UPDATEDAT            DATE          
	B_PROD_ON_OFF          VARCHAR2(10)  
	B_STATUS               VARCHAR2(10)  
	B_TYPE                 VARCHAR2(20)  
 */
@Data
public class BoardVO {
	private int u_s_id,b_view_count;
	private String b_id,b_filter,b_title,b_content,b_thumbnail,b_prod_on_off,b_status,b_type;
	private Date b_createdat,b_updatedat;
	private Board_OptionVO bovo=new Board_OptionVO();
	private Users_SellerVO usvo=new Users_SellerVO();
	private ReviewVO rvo=new ReviewVO();
	private Review_imageVO rivo=new Review_imageVO();
	private Board_ImageVO bivo=new Board_ImageVO();
	private UsersVO uvo=new UsersVO();
}
