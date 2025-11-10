package com.eum.admin.dao;

import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;

public class Admin_NoticeDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 컨텐츠 리스트 조회
	
	// 컨텐츠 페이징 조회
		
	// 컨텐츠 디테일 조회
		
	// 컨텐츠 삭제
		
	// 컨텐츠 수정
	
}
