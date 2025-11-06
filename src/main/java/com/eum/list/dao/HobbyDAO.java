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
		List<ContentVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("hobbyListData", map);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public static int hobbyTotalPage() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("hobbyTotalPage");
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	public static ContentVO hobbyDetailData(String b_id) {
		ContentVO vo = null;
		try {
			SqlSession session = ssf.openSession();
			vo = session.selectOne("hobbyDetailData", b_id);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	public static List<Board_ImageVO> hobbyImagaeDetailData(String b_id){
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
	
	public static void hobbyHitIncrement(String b_id) {
		try {
			SqlSession session = ssf.openSession(true);
			session.update("hobbyHitIncrement",b_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static List<ReviewVO> hobbyReviewDetailData(Map map) {
		List<ReviewVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("hobbyReviewDetailData",map);
			for(ReviewVO vo : list) {
				List<Review_ImageVO> imgList = session.selectList("hobbyReviewImageDetailData", vo.getB_review_id());
				vo.setImageList(imgList);
			}
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public static List<Board_OptionVO> hobbyOptionDetailData(Map map) {
		
		List<Board_OptionVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("hobbyOptionDetailData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
}