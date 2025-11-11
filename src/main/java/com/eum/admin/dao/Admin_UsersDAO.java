package com.eum.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.UsersVO;

public class Admin_UsersDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
		
	}
	
	// 컨텐츠 리스트 조회
	public static List<UsersVO> adminUsersListData(Map map){
		
		List<UsersVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			
			list = session.selectList("adminUsersListData",map);
			session.close();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 컨텐츠 페이징 조회
	public static int adminUsersListTotalData() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("adminUsersListTotalData");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 컨텐츠 디테일 조회
	public static UsersVO adminUsersDetailData(String u_id) {
		
		UsersVO vo = null;
		try {
			SqlSession session = ssf.openSession();
			vo = session.selectOne("adminUsersDetailData",u_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	// 컨텐츠 삭제
			
	// 컨텐츠 수정
}
