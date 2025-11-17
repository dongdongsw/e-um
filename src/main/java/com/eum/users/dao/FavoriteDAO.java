package com.eum.users.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.*;
import com.eum.main.vo.*;

public class FavoriteDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	/*
	  <select id="favoriteCheckCount" resultType="int" parameterType="FavoriteVO">
	    SELECT COUNT(*)
	    FROM favorite
	    WHERE u_id=#{u_id} AND b_id=#{b_id}
	  </select>
		  
	  <insert id="favoriteInsert" parameterType="FavoriteVO">
	    INSERT INTO favorite
	    VALUES(fv_id_seq.nextval, #{u_id}, #{b_id}, SYSDATE)
	  </insert>
	 */
	public static int favoriteCheckCount(FavoriteVO vo) {
		int count = 0;
		try {
			SqlSession session = ssf.openSession();
			count = session.selectOne("favoriteCheckCount", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}
	
	public static void favoriteInsert(FavoriteVO vo) {
		try {
			SqlSession session = ssf.openSession(true);
			session.insert("favoriteInsert", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	/*
	  <select id="favoriteListData" resultMap="favoriteMap" parameterType="string">
	    SELECT f.fv_id, f.u_id, f.b_id, TO_CHAR(f.fv_pushat, 'YYYY-MM-DD') AS dbday,
	    		b.b_type, b.b_title, b.b_thumbnail, us.u_s_com, r.b_review_score,
	    		(SELECT COUNT(*)
	    		FROM review sub_r WHERE sub_r.b_id=f.b_id) AS review_count
	    FROM favorite f
	    JOIN board b ON f.b_id=b.b_id
	    JOIN users_seller us ON b.u_s_id=us.u_s_id
	    LEFT JOIN review r ON f.b_id=r.b_id
	    WHERE f.u_id=#{u_id}
	    GROUP BY f.fv_id, f.u_id, f.b_id, f.fv_pushat, b.b_type,
	    		b.b_title, b.b_thumbnail, us.u_s_com, r.b_review_score
	    ORDER BY f.fv_pushat DESC
	  </select>
	 */
	public static List<FavoriteVO> favoriteListData(String u_id) {
		List<FavoriteVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("favoriteListData", u_id);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	/*
	  <delete id="favoriteDelete" parameterType="int">
	    DELETE FROM favorite
	    WHERE fv_id=#{fv_id}
	  </delete>
	 */
	public static void favoriteDelete(int fv_id) {
		try {
			SqlSession session = ssf.openSession(true);
			session.delete("favoriteDelete", fv_id);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
