package com.eum.seller.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Users_SellerVO;

public class SellerDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 셀러 이름 존재 여부
	public static int sellerNameCheck(String u_s_com) {
		
		int count=0;
		try {
			SqlSession session=ssf.openSession();
			count=session.selectOne("sellerNameCheck",u_s_com);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return count;
	}
	
	// 셀러 가입
	public static void sellerInsert(Users_SellerVO vo) {
		
		try {
			SqlSession session=ssf.openSession(true);
			session.insert("sellerInsert",vo);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 셀러 정보 출력(셀러 페이지)
	public static Users_SellerVO sellerInfo(int u_s_id) {

		SqlSession session=ssf.openSession();
		Users_SellerVO vo=session.selectOne("sellerInfo",u_s_id);
		session.close();
		
		return vo;
	}
	
	// 셀러 정보 수정 (셀러 페이지) 
	public static void sellerInfoUpdate(Users_SellerVO vo) {
		try {
			SqlSession session=ssf.openSession(true);
			session.update("sellerInfoUpdate",vo);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 내 컨텐츠 조회 (셀러 페이지)
	public static List<BoardVO> myContents(int u_s_id) {
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			SqlSession session=ssf.openSession();
			list=session.selectList("myContents", u_s_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 셀러 고유값 가져오기 (세션)
	public static int sellerGetSid(String u_id) {
		int sid=0;
		try {
			SqlSession session=ssf.openSession();
			sid=session.selectOne("sellerGetSid",u_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return sid;
	}
	
	// 셀러 리뷰 목록
	public static List<BoardVO> sellerReview(Map map) {
		
		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			SqlSession session=ssf.openSession();
			list=session.selectList("sellerReview", map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 셀러 토탈 리뷰
	public static int sReviewTotalPage(Map map) {
		   int count=0;
		   try {
			   SqlSession session=ssf.openSession();
			   count=session.selectOne("sReviewTotalPage",map);
			   session.close();
			
		   } catch (Exception ex) {
			   ex.printStackTrace();
		   }
		   return count;
	   }
		
	// 프로필 이미지 업로드
	public static void sellerProfile(Users_SellerVO vo) {
		try {
			SqlSession session = ssf.openSession(true);
			session.update("sellerProfile", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
		
		
}