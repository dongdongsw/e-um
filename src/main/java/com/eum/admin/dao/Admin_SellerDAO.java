package com.eum.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.UsersVO;
import com.eum.main.vo.Users_SellerVO;

public class Admin_SellerDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 셀러 리스트 조회
	public static List<UsersVO> sellerListData(Map map){
		
		List<UsersVO> list = null;
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
	
	// 셀러 삭제
			
	// 셀러 수정
}
