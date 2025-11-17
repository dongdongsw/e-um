package com.eum.main.vo;
import java.util.*;

import lombok.Data;
/*
 * 	FV_ID     NOT NULL NUMBER       
	U_ID      NOT NULL VARCHAR2(30) 
	B_ID      NOT NULL VARCHAR2(30) 
	FV_PUSHAT          DATE  
 */
@Data
public class FavoriteVO {
	private int fv_id;
	private String u_id,b_id,dbday;
	private Date fv_pushat;
	private UsersVO uvo;
	private BoardVO bvo;
	private Users_SellerVO usvo;
	private ReviewVO rvo;
}
