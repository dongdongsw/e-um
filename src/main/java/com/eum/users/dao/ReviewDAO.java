package com.eum.users.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.*;
import com.eum.main.vo.*;

public class ReviewDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	/*
	      <select id="reviewListData" resultMap="reviewMap" parameterType="string">
		    SELECT r.b_review_id, r.u_s_id, r.b_id, r.u_id, b.b_type, b.b_title, us.u_s_com, 
		    	(SELECT TRUNC(AVG(b_review_score), 1)
		    	FROM review sub_r
		    	WHERE sub_r.b_id=r.b_id) AS b_review_avg, r.b_review_content,
		    	TO_CHAR(r.b_review_createdat, 'YYYY-MM-DD') AS dbday,
		        	(SELECT COUNT(*)
					FROM review sub_r2
					WHERE sub_r2.b_id = r.b_id
					AND sub_r2.depth=2) AS depth_count
			FROM review r
			JOIN board b ON r.b_id=b.b_id
			JOIN users_seller us ON b.u_s_id=us.u_s_id
			WHERE r.u_id=#{u_id}
		  </select>
	 */
	public static List<ReviewVO> reviewListData(String u_id) {
		List<ReviewVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("reviewListData", u_id);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
}
