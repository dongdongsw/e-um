package com.eum.list.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.Board_ImageVO;
import com.eum.list.vo.Board_OptionVO;
import com.eum.list.vo.ContentVO;
import com.eum.list.vo.ReviewVO;
import com.eum.list.vo.Review_ImageVO;

public class ExerciseDAO {

private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	// 컨텐츠 리스트 목록
	public static List<ContentVO> exerciseListData(Map map){
		
		List<ContentVO> list = null;
		
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("exerciseListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
		
	}
	
	// 컨텐츠 리스트 페이징
	public static int exerciseTotalPage(){
		
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("exerciseTotalPage");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return total;
		
	}
	
	// 상세정보
	public static ContentVO exerciseDetailData(String b_id) {
		ContentVO vo = null;
		try {
			SqlSession session = ssf.openSession();
			
			vo = session.selectOne("exerciseDetailData",b_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		return vo;
		
	}
	
	// 컨텐츠 상세보기 이미지
	public static List<Board_ImageVO> exerciseImagaeDetailData(String b_id){
		List<Board_ImageVO> list = null;
		
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("exerciseImagaeDetailData",b_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
		
	}
	
	// 조회수 증가
	public static void exerciseHitIncrement(String b_id) {
		
		try {
			SqlSession session = ssf.openSession();

			session.update("exerciseHitIncrement",b_id);
			session.commit();
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	
		
	}
	
	// 상세정보 리뷰
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
	
	// 상세정보 가격 옵션
	public static List<Board_OptionVO> exerciseOptionDetailData(Map map) {
		
		List<Board_OptionVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("exerciseOptionDetailData",map);
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	
}
