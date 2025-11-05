package com.eum.list.vo;
/*
    B_ID          NOT NULL VARCHAR2(30)  
	U_S_ID                 NUMBER        
	B_TYPE                 VARCHAR2(20)  
	B_FILTER               VARCHAR2(60)  
	B_TITLE                VARCHAR2(200) 
	B_CONTENT              CLOB          
	B_VIEW_COUNT           NUMBER        
	B_THUMBNAIL            VARCHAR2(200) 
	B_CREATEDAT            DATE          
	B_UPDATEDAT            DATE          
	B_PROD_ON_OFF          VARCHAR2(10)  
	B_STATUS               VARCHAR2(10)
 */
import java.util.*;

import lombok.Data; 

@Data
public class ContentVO {
	private int u_id, u_s_id, b_view_count, r_count, b_op_price, b_op_price_min, u_s_carrer, l_count;
	   private String b_id, b_type, b_filter, b_title, b_content, b_thumbnail, b_prod_on_off, u_s_zone, u_s_profileimg_url, 
	      b_status, u_s_com, b_img_url;
	   private Date b_createdAt, b_updatedAt, b_review_createdat;
	   private Double b_review_score;
}
