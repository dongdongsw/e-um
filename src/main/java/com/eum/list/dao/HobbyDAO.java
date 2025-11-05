package com.eum.list.dao;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.*;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class HobbyDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static List<ContentVO> hobbyListData(Map map) {
		SqlSession session = ssf.openSession();
		List<ContentVO> list = session.selectList("hobbyListData", map);
		session.close();
		return list;
	}
	
	public static int hobbyTotalPage() {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("hobbyTotalPage");
		session.close();
		return total;
	}
}