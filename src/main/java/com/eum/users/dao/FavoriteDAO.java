package com.eum.users.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.*;
import com.eum.main.vo.*;

public class FavoriteDAO {
	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 즐겨찾기 여부
	public static int favoriteCheckCount(FavoriteVO vo) {
		int count = 0;
		try {
			SqlSession session = ssf.openSession();
			count = session.selectOne("favoriteCheckCount", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}
	
	// 즐겨찾기 추가
	public static void favoriteInsert(FavoriteVO vo) {
		try {
			SqlSession session = ssf.openSession(true);
			session.insert("favoriteInsert", vo);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 즐겨찾기 리스트
	public static List<FavoriteVO> favoriteListData(String u_id) {
		List<FavoriteVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("favoriteListData", u_id);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 즐겨찾기 삭제
	public static void favoriteDelete(int fv_id) {
		try {
			SqlSession session = ssf.openSession(true);
			session.delete("favoriteDelete", fv_id);
			session.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
