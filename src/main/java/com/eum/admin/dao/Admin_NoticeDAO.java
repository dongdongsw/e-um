package com.eum.admin.dao;
import java.util.*;
import com.eum.main.vo.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;

public class Admin_NoticeDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
		// 공지사항 리스트 조회
		public static List<NoticeVO> adminnoticeListData(Map<String, Object> map)
		{
			List<NoticeVO> list=null;
			try {
				
				SqlSession session=ssf.openSession();
			list=session.selectList("adminnoticeListData",map);
			session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		// 공지사항 페이징 조회
		public static int adminnoticeTotalPage()
		{
			int total=0;
			try(SqlSession session=ssf.openSession())
			{
				total=session.selectOne("adminnoticeTotalPage");
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			return total;
		}
		// 공지사항 디테일 조회
		public static NoticeVO adminnoticeDetailData(String n_id)
		{
			NoticeVO vo=null;
			try
			{
			SqlSession session=ssf.openSession();
			vo=session.selectOne("adminnoticeDetailData",n_id);
			session.close();
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			return vo;
		}
		// 공지사항 삭제
		public static NoticeVO adminnoticeDeleteData(String n_id)
		{
			
			SqlSession session=ssf.openSession();
			NoticeVO vo=session.selectOne("adminnoticeDeleteData",n_id);
			session.close();
			return vo;
		}
		public static void adminnoticeDelete(String n_id) 
 		{
 			try
 			{
 				SqlSession session=ssf.openSession(true);
 				session.delete("adminnoticeDelete",n_id);
 				session.close();
 			}catch(Exception ex)
 			{
 				ex.printStackTrace();
 			}
 		}
		// 공지사항 수정
		public static NoticeVO adminnoticeUpdateData(String n_id)
		{
			
			SqlSession session=ssf.openSession();
			NoticeVO vo=session.selectOne("adminnoticeUpdateData",n_id);
			session.close();
			
			return vo;
		}
		public static void adminnoticeUpdate(NoticeVO vo)
		{
			try
			{
				SqlSession session=ssf.openSession(true);
				session.update("adminnoticeUpdate",vo);
				session.close();
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		// 공지사항 작성
		public static void adminnoticeInsert(NoticeVO vo)
 		{
 			try
 			{
 				SqlSession session=ssf.openSession(true);
 				session.insert("adminnoticeInsert",vo);
 				session.close();
 			}catch(Exception ex)
 			{
 				ex.printStackTrace();
 			}
 		}
}
