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
	
	private int   r_count; // 리뷰 개수
	private int b_op_price_min; // 게시판 옵션 최저가
	private Double r_avg_score;

	// 판매자 테이블 
	private int u_s_id;
	private String u_s_com, u_s_zone, u_s_carrer, u_s_profileimg_url; 
	
	// 게시판 테이블 
	private int b_view_count;
	private String b_id, b_type, b_status, b_filter, b_title, 
		b_content, b_thumbnail, b_prod_on_off;
	private Date b_createdAt, b_updatedAt;
	
	// 게시판 이미지 테이블 
	private String b_img_url;
	
	// 게시판 리뷰 테이블 
	private String b_review_createdat, b_review_content;
	private Double b_review_score; 
	
	// 게시판 옵션 테이블
	
	
	// 유저 테이블
	private String u_nickname;
}
