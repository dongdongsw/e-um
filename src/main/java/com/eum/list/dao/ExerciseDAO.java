package com.eum.list.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.ContentVO;
import com.eum.list.vo.ReviewVO;
import com.eum.list.vo.Review_ImageVO;

public class ExerciseDAO {

private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	
	public static List<ContentVO> exerciseListData(Map map){
		SqlSession session = ssf.openSession();
		List<ContentVO> list = session.selectList("exerciseListData",map);
		session.close();
		return list;
		
	}
	public static int exerciseTotalPage(){
		SqlSession session = ssf.openSession();
		int total = session.selectOne("exerciseTotalPage");
		session.close();
		return total;
		
	}
	public static ContentVO exerciseDetailData(String b_id) {
		
		SqlSession session = ssf.openSession();
		ContentVO vo = session.selectOne("exerciseDetailData",b_id);
		session.close();
		
		return vo;
		
	}
	
	/*
		 <select id="exerciseReviewImageDetailData" resultType="Review_ImageVO" parameterType="string">
			SELECT r.b_review_id, r_i.r_image_url
			FROM review r
			LEFT JOIN review_image r_i ON r.b_review_id = r_i.b_review_id
			WHERE r.b_review_id = #{b_review_id}
		</select>
	 */
	public static List<ReviewVO> exerciseReviewDetailData(Map map) {
		
		List<ReviewVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("exerciseReviewDetailData",map);
			for(ReviewVO vo : list) {

				List<Review_ImageVO> imglist = session.selectList("exerciseReviewImageDetailData",vo.getB_review_id());
				vo.setImageList(imglist);
			}
			
			
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
}
