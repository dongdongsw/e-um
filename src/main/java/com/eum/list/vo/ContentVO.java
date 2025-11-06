package com.eum.list.vo;

import java.util.*;

import lombok.Data;
@Data
public class ContentVO {
	private int   r_count, u_s_id, b_op_price_min, b_view_count;
	private Double r_avg_score, b_review_score;
	private String u_s_com, u_s_zone, u_s_carrer, u_s_profileimg_url, b_id, b_type, 
					b_status, b_filter, b_title, b_content, b_thumbnail, b_prod_on_off, 
					b_img_url, b_review_createdat, b_review_content, u_nickname; 
	private Date b_createdAt, b_updatedAt;
}
