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
	
	private static final String NS = "com.eum.admin.mapper.delete-mapper.";
	
	// 리뷰 리스트 조회
	public static List<ReviewVO> reviewListsData(Map map){
		List<ReviewVO> list = null;
		
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("reviewListsData",map);
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
	
	// 리뷰 이미지
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
	
	// 리뷰 리스트 조회
	public static List<ReviewVO> reviewSearchListData(Map map){
		List<ReviewVO> list = null;
		
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("reviewSearchListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
		
	// 리뷰 페이징 조회
	public static int reviewSearchTotalData(String keyword) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("reviewSearchTotalData", keyword);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}

	// 리뷰 전체 삭제
	public static void reviewDel(int b_review_id) {
		
		try {
			SqlSession session = ssf.openSession();
			// 리뷰 이미지 삭제
			session.delete(NS + "reviewImageDelete",b_review_id);
			// 리뷰와 리뷰의 대한 답변 삭제
			session.delete(NS + "reviewReplyDelete",b_review_id);
			
			session.commit();
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	// 리뷰 답글 삭제
	public static void reviewDelete(int b_review_id) {
		
		try {
			SqlSession session = ssf.openSession();
			session.delete(NS + "reviewDelete",b_review_id);
			session.commit();
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
}
