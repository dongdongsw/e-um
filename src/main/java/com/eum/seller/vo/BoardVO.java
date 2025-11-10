package com.eum.seller.vo;
import java.util.*;

import lombok.Data;

@Data
public class BoardVO {
	private String b_id, b_filter, b_title, b_content, b_thumbnail, b_prod_on_off, b_status, b_type;
	private int u_s_id, b_view_count;
	private Date b_createdat, b_updatedat;
}
