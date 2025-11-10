package com.eum.seller.vo;
import java.util.*;


import lombok.Data;

@Data
public class SellerVO {
	private int u_s_id;
	private String u_id, u_s_carrer, u_s_zone, u_s_biz_no,
			u_s_com, u_s_profileimg_url, u_s_role;
	private Date u_createat, u_updateat;

}
