package com.eum.list.vo;
import java.util.*;

import lombok.Data;
/*
 * 	B_LIKE_ID     NOT NULL NUMBER       
	B_ID          NOT NULL VARCHAR2(30) 
	U_ID          NOT NULL VARCHAR2(30) 
	B_LIKE_PUSHAT NOT NULL DATE  
 */
@Data
public class Board_LikeVO {
	private int b_like_id;
	private String b_id,u_id;
	private Date b_like_pushat;
}
