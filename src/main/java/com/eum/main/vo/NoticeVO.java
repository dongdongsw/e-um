package com.eum.main.vo;
import java.util.*;

import lombok.Data;
@Data
public class NoticeVO {
	private String n_title,n_content,n_id,u_id;
	private Date n_createdAt,n_updatedAt;
}