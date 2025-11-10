package com.eum.list.vo;

import lombok.Data;

/*
 * 	R_IMAGE_ID       NOT NULL NUMBER       
	B_REVIEW_ID               VARCHAR2(30) 
	R_IMAGE_URL               CLOB         
	R_IMAGE_UPLOADAT          VARCHAR2(30) 
 */
@Data
public class Review_imageVO {
	private int r_image_id;
	private String b_review_id,r_image_url,r_image_uploadat;
}
