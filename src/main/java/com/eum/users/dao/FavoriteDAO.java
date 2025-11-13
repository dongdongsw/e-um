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
		    WHERE fv_id=#{fv_id}
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
		  <resultMap type="FavoriteVO" id="favoriteMap">
		    <result property="uvo.u_id" column="u_id"/>
		    <result property="bvo.b_id" column="b_id"/>
		  </resultMap>
		  
		  <select id="favoriteListData" resultMap="favoriteMap" parameterType="int">
		    SELECT fv_id, f.u_id, f.b_id, fv_pushat
		    FROM favorite f, users u, board b
		    WHERE f.u_id=u.u_id
		    AND f.b_id=b.b_id
		    ORDER BY fv_id DESC
		  </select>
	 */
	public static List<FavoriteVO> favoriteListData(int fv_id) {
		List<FavoriteVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("favoriteListData", fv_id);
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
