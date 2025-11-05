package com.eum.list.vo;

import java.util.List;

import lombok.Data;

@Data
public class ReviewVO {
	
	private String b_id, u_nickname;
	
	private String b_review_id, b_review_createdat, b_review_content, u_profileimg_url;
	private Double b_review_score, r_avg_score; 
	
	
	// 리뷰 이미지
	
	 private List<Review_ImageVO> imageList;
}
