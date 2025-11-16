package com.eum.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.ReviewVO;
import com.eum.main.vo.Review_ImageVO;

public class Admin_ReviewDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 리뷰 리스트 조회
	public static List<ReviewVO> reviewListData(Map map){
		List<ReviewVO> list = null;
		
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("reviewListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 리뷰 페이징 조회
	public static int reviewTotalData() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("reviewTotalData");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	public static List<Review_ImageVO> selectReviewImages(String b_review_id) {
	    List<Review_ImageVO> list = null;
	    try {
	        SqlSession session = ssf.openSession();
	        list = session.selectList("selectReviewImages", b_review_id);
	        session.close();
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    }
	    return list;
	}

}
