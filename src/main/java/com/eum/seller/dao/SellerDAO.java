package com.eum.seller.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.seller.vo.SellerVO;

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
	public static void sellerInsert(SellerVO vo) {
		try {
			SqlSession session=ssf.openSession(true);
			session.insert("sellerInsert",vo);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
