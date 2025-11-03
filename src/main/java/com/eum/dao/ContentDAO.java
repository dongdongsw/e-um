package com.eum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.vo.ContentVO;

public class ContentDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static List<ContentVO> contentListData(Map<String, Object> params) {
	    SqlSession session = ssf.openSession();
	    List<ContentVO> list = session.selectList("contentListData", params);
	    session.close();
	    return list;
	}
}
