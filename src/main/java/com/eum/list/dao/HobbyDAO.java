package com.eum.list.dao;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.*;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class HobbyDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static List<ContentVO> hobbyListData(Map map) {
		SqlSession session = ssf.openSession();
		List<ContentVO> list = session.selectList("hobbyListData", map);
		session.close();
		return list;
	}
	
	public static int hobbyTotalPage() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("hobbyTotalPage");
		session.close();
		return total;
	}
	
	/*
	 *   <select id="hobbyDetailData" resultType="ContentVO" parameterType="int">
		    SELECT b_id, u_s_id, b_thumbnail, b_title, b_type, b_op_price_min, u_s_com, r_count, b_review_score, u_s_carrer, u_s_zone, b_prod_on_off, b_content,
		    		b_review_content, b_review_createdat
			FROM (SELECT b.b_id, b.u_s_id, b.b_thumbnail, b.b_title, b.b_type, b.b_prod_on_off, b.b_content,
		        	MIN(b_o.b_op_price) AS b_op_price_min, u_s.u_s_com,
		        	COUNT(r.b_id) AS r_count, r.b_review_score AS b_review_score, u_s.u_s_carrer AS u_s_carrer, u_s.u_s_zone AS u_s_zone,
		        	r.b_review_content AS b_review_content, r.b_review_createdat AS b_review_createdat
		    FROM board b
		    LEFT JOIN users_seller u_s ON b.u_s_id = u_s.u_s_id
		    LEFT JOIN board_option b_o ON b.b_id = b_o.b_id
		    LEFT JOIN review r ON b.b_id = r.b_id
		    GROUP BY b.b_id, b.u_s_id, b.b_thumbnail, b.b_title, b.b_type, b.b_prod_on_off, b.b_content,
		    			u_s.u_s_com, r.b_review_score, u_s.u_s_carrer, u_s.u_s_zone, r.b_review_content,
		    			r.b_review_createdat)
		    WHERE b_id=#{b_id}
		  </select>
	 */
	public static ContentVO hobbyDetailData(String b_id) {
		SqlSession session = ssf.openSession();
		ContentVO hvo = session.selectOne("hobbyDetailData", b_id);
		session.close();
		return hvo;
	}
}