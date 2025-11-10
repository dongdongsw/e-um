package com.eum.notice.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.NoticeVO;
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
	public static void noticeInsert(NoticeVO vo)
	{
		try
		{
			SqlSession session=ssf.openSession(true);
			session.insert("noticeInsert",vo);
			session.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	public static NoticeVO noticeUpdateData(String n_id)
	{
		
		SqlSession session=ssf.openSession();
		NoticeVO vo=session.selectOne("noticeUpdateData",n_id);
		session.close();
		
		return vo;
	}
	public static void noticeUpdate(NoticeVO vo)
	{
		try
		{
			SqlSession session=ssf.openSession(true);
			session.update("noticeUpdate",vo);
			session.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	public static void noticeDelete(String n_id) 
	{
		try
		{
			SqlSession session=ssf.openSession(true);
			session.delete("noticeDelete",n_id);
			session.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	public static NoticeVO noticeDeleteData(String n_id)
	{
		
		SqlSession session=ssf.openSession();
		NoticeVO vo=session.selectOne("noticeDeleteData",n_id);
		session.close();
		return vo;
	}
}