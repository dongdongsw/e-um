package com.eum.list.vo;
<<<<<<< HEAD

import lombok.Data;

/*
 * 	B_REVIEW_ID        NOT NULL VARCHAR2(30)  
	U_S_ID                      NUMBER        
	B_ID                        VARCHAR2(30)  
	U_ID                        VARCHAR2(30)  
	B_REVIEW_CREATEDAT NOT NULL VARCHAR2(100) 
	B_REVIEW_CONTENT            CLOB          
	B_REVIEW_SCORE     NOT NULL NUMBER(2,1)  
 */
@Data
public class ReviewVO {
	private int u_s_id,review_count;
	private String b_review_id,b_id,u_id,b_review_createdat,b_review_content,b_review_score;
=======
import java.util.*;

import lombok.Data;

@Data
public class ReviewVO {
	    private String b_review_id, b_review_content, u_nickname, u_profileimg_url;
	    private double b_review_score;
	    private Date b_review_createdat;
	    private List<String> imgList;
>>>>>>> origin/test_backup
}
