package com.eum.seller.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private String b_review_id, u_id, b_id, b_review_createdat, b_review_content;
	private int u_s_id,b_review_score;
}
