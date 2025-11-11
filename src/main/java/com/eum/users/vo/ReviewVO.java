package com.eum.users.vo;
import java.util.*;

import lombok.Data;

@Data
public class ReviewVO {
	    private String b_review_id, b_review_content, u_nickname, u_profileimg_url;
	    private double b_review_score;
	    private Date b_review_createdat;
	    private List<String> imgList;
	    
	    private BoardVO bvo=new BoardVO();
	    private UsersVO uvo=new UsersVO();
}
