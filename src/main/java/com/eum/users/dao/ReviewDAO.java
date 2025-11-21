package com.eum.users.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.*;
import com.eum.main.vo.*;

public class ReviewDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 리뷰 리스트
	public static List<ReviewVO> reviewListData(String u_id) {
		List<ReviewVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("reviewListData", u_id);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
}
