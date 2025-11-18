package com.eum.main.vo;

import java.util.*;
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
	private int u_s_id,review_count,root,depth,reply, depth_count,has_reply;
	private String b_review_id,b_id,u_id,b_review_content,b_review_createdat,group_id;
	private Double b_review_score, b_review_avg;
	private List<String> imgList;
	private Users_SellerVO usvo;
	// 관리자 동현 11월 16일 병합 유저쪽 리뷰 이미지 리스트 임시 
	private List<Review_ImageVO> imageList;
	private UsersVO uvo;
	private BoardVO bvo;
}