package com.eum.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.UsersVO;

public class Admin_SellerDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 컨텐츠 리스트 조회
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
	// 컨텐츠 페이징 조회
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
	// 컨텐츠 디테일 조회
			
	// 컨텐츠 삭제
			
	// 컨텐츠 수정
}
