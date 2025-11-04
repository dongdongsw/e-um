package com.eum.list.vo;

import java.util.*;

import lombok.Data;
@Data
public class ContentVO {
   private int u_id, u_s_id, b_view_count, r_count, b_op_price, b_op_price_min, u_s_carrer, l_count;
   private String b_id, b_type, b_filter, b_title, b_content, b_thumbnail, b_prod_on_off, u_s_zone, u_s_profileimg_url, 
      b_status, u_s_com, b_img_url;
   private Date b_createdAt, b_updatedAt, b_review_createdat;
}