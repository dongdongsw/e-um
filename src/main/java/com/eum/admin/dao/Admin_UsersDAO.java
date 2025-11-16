package com.eum.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.ReviewVO;
import com.eum.main.vo.Review_ImageVO;
import com.eum.main.vo.UsersVO;

public class Admin_UsersDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
		
	}
	
	// 컨텐츠 리스트 조회
	public static List<UsersVO> usersListData(Map map){
		
		List<UsersVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			
			list = session.selectList("usersListData",map);
			session.close();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 컨텐츠 페이징 조회
	public static int usersListTotalData() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("usersListTotalData");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 컨텐츠 디테일 조회
	public static UsersVO usersDetailData(String u_id) {
		
		UsersVO vo = null;
		try {
			SqlSession session = ssf.openSession();
			vo = session.selectOne("usersDetailData",u_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	// 컨텐츠 삭제
			
	// 컨텐츠 수정
	public static void usersStatusUpdate(Map map){
		
		try {
			SqlSession session = ssf.openSession(true);
			session.update("usersStatusUpdate",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	
	// 리뷰 리스트 & 이미지
	public static List<ReviewVO> usersReviewListData(Map map){
		List<ReviewVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("usersReviewListData",map);
			
			for(ReviewVO vo : list) {
			    Map<String, Object> param = new HashMap();
			    param.put("b_review_id", vo.getB_review_id());
			    param.put("start", map.get("start")); // 필요 시
			    param.put("end", map.get("end"));     // 필요 시

			    List<Review_ImageVO> imglist = session.selectList("usersReviewImageData", param);
			    vo.setImageList(imglist);
			}

			
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 리뷰 리스트 페이징
	public static int usersReviewListTotalData(String u_id) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("usersReviewListTotalData",u_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	
}
