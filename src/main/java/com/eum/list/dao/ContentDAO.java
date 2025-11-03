package com.eum.list.dao;

import java.util.List;
import java.util.*;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.ContentVO;

public class ContentDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static List<ContentVO> contentListData(Map<String, Object> params) {
	    SqlSession session = null;
	    List<ContentVO> list = null;
	    try {
	        session = ssf.openSession();
	        list = session.selectList("contentListData", params);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } 
	    session.close();
	    return list;
	}
}
