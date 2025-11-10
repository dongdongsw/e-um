package com.eum.seller.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.seller.vo.BoardVO;
import com.eum.seller.vo.SellerVO;

public class SellerDAO {

	private static SqlSessionFactory ssf;
	private static SellerVO vo;
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
	public static void sellerInsert(SellerVO vo) {
		
		try {
			SqlSession session=ssf.openSession(true);
			session.insert("sellerInsert",vo);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 셀러 정보 출력(셀러 페이지)
	public static SellerVO sellerInfo(int u_s_id) {

		SqlSession session=ssf.openSession();
		SellerVO vo=session.selectOne("sellerInfo",u_s_id);
		session.close();
		
		return vo;
	}
	
	// 셀러 정보 수정 (셀러 페이지) 
	public static void sellerInfoUpdate(SellerVO vo) {
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
}
