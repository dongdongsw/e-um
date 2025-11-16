package com.eum.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.ReviewVO;
import com.eum.main.vo.Review_ImageVO;
import com.eum.main.vo.UsersVO;
import com.eum.main.vo.Users_SellerVO;

public class Admin_SellerDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 셀러 리스트 조회
	public static List<Users_SellerVO> sellerListData(Map map){
		
		List<Users_SellerVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			
			list = session.selectList("sellerListData",map);
			session.close();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	// 셀러 페이징 조회
	public static int sellerTotalData() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("sellerTotalData");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 셀러 디테일 조회
	public static Users_SellerVO sellerDetailData(int u_s_id) {
		Users_SellerVO vo = null;
		try {
			SqlSession session = ssf.openSession();
			vo = session.selectOne("sellerDetailData",u_s_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	// 셀러 컨텐츠 조회
	public static List<BoardVO> sellerContentsListData(Map map){
		
		List<BoardVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("sellerContentsListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	// 셀러 컨텐츠 페이징
	public static int sellerContentsTotalData(int u_s_id) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("sellerContentsTotalData",u_s_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 셀러 리뷰 리스트
	public static List<ReviewVO> sellerReviewListData(Map map){
		
		List<ReviewVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("sellerReviewListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	

	public static int sellerReviewTotalData(int u_s_id) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("sellerReviewTotalData",u_s_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 셀러 삭제
			
	// 셀러 수정
	
	// 셀러 검색 + 페이지 목록
	public static List<Users_SellerVO> sellerSearchListData(Map map){
		
		List<Users_SellerVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			
			list = session.selectList("sellerSearchListData",map);
			session.close();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
		
	// 셀러 검색 총 페이지(페이징 용)
	public static int sellerSearchTotalPage(String keyword) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("sellerSearchTotalPage",keyword);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
}
