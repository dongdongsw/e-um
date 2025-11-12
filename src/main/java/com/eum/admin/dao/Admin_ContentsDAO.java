package com.eum.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.ContentVO;

public class Admin_ContentsDAO {

	private static SqlSessionFactory ssf;
	static {
		
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 컨텐츠 리스트 조회
	public static List<ContentVO> contentsListData(Map map){
		
		List<ContentVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("contentsListData",map);
			session.close();
		} catch (Exception ex) {
			// TODO: handle exception
		}
		return list;
	}
	// 컨텐츠 페이징 조회
	public static int contentsTotalData() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("contentsTotalData");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	// 컨텐츠 디테일 조회
	
	// 컨텐츠 상세 사진 조회
	
	// 컨텐츠 삭제
	
	// 컨텐츠 수정
	

	
}
