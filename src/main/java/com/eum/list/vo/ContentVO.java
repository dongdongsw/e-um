package com.eum.list.vo;

import java.util.*;

import lombok.Data;
@Data
public class ContentVO {
   private int u_id, u_s_id, b_view_count, u_s_carrer,
               r_count, b_op_price, b_op_price_min, 
               l_count;
   private String b_id, b_type, b_filter, b_title, b_content, b_thumbnail, b_prod_on_off,
                  b_status,b_op_title, b_op_detail,b_review_content,b_review_img,b_op_id;
   private String u_s_zone, u_s_profileimg_url, u_s_com, b_img_url, u_nickname, u_profileimg_url,r_image_url;
   private Date b_createdAt, b_updatedAt, b_review_createdat;
   private Double r_avg_score;
}