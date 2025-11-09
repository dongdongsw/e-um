package com.eum.list.vo;

import java.util.List;

import lombok.Data;
/*
 	B_REVIEW_ID        NOT NULL VARCHAR2(30)  
	U_S_ID                      NUMBER        
	B_ID                        VARCHAR2(30)  
	U_ID                        VARCHAR2(30)  
	B_REVIEW_CREATEDAT NOT NULL VARCHAR2(100) 
	B_REVIEW_CONTENT            CLOB          
	B_REVIEW_SCORE     NOT NULL NUMBER(2,1)   
 */
@Data
public class ReviewVO {
	// 나중에 삭제 예정
	private String  u_nickname, u_profileimg_url ;
	
	// 계산 하는 것
	private Double r_avg_score;
	
	private String b_review_id, u_s_id,  b_id, u_id, b_review_createdat, b_review_content;
	private Double b_review_score; 
	
	
	// 리뷰 이미지
	
	 private List<Review_ImageVO> imageList;
}
