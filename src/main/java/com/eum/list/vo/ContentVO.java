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
	private int u_s_id, b_view_count, review_count;
	private String b_id, b_type, b_filter, b_title, b_content, b_thumbnail, b_prod_on_off, b_status;
	private Date b_createdAt, b_updatedAt;
}
