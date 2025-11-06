package com.eum.list.vo;

import java.util.*;

import lombok.Data;

@Data
public class ReviewVO {
	private String b_id, u_nickname, b_review_id, b_review_createdat, b_review_content, u_profileimg_url;
	private Double b_review_score, r_avg_score; 
	 private List<Review_ImageVO> imageList;
}
