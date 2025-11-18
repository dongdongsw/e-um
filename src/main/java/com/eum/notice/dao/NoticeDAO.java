package com.eum.notice.dao;

import java.util.*;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.NoticeVO;
public class NoticeDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<NoticeVO> noticeListData(Map<String, Object> map)
	{
		List<NoticeVO> list=null;
		try {
			
			SqlSession session=ssf.openSession();
		list=session.selectList("noticeListData",map);
		session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	public static NoticeVO noticeDetailData(String n_id)
	{
		SqlSession session=ssf.openSession();
		NoticeVO vo=session.selectOne("noticeDetailData",n_id);
		session.close();
		return vo;
	}
	
	public static int noticeTotalPage()
	{
		int total=0;
		try(SqlSession session=ssf.openSession())
		{
			total=session.selectOne("noticeTotalPage");
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return total;
	}
	
}