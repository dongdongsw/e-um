package com.eum.list.vo;
import java.util.*;

import lombok.Data;
@Data
public class NoticeVO {
	private int n_id,u_id;
	private String n_title,n_content;
	private Date n_createdAt,n_updatedAt;
}
