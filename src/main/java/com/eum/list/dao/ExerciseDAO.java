package com.eum.list.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.ContentVO;

public class ExerciseDAO {

private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	
	public static List<ContentVO> exerciseListData(Map map){
		SqlSession session = ssf.openSession();
		List<ContentVO> list = session.selectList("exerciseListData",map);
		session.close();
		return list;
		
	}
	public static int exerciseTotalPage(){
		SqlSession session = ssf.openSession();
		int total = session.selectOne("exerciseTotalPage");
		session.close();
		return total;
		
	}
	public static ContentVO exerciseDetailData(String b_id) {
		
		SqlSession session = ssf.openSession();
		ContentVO vo = session.selectOne("exerciseDetailData",b_id);
		session.close();
		
		return vo;
		
	}
}
