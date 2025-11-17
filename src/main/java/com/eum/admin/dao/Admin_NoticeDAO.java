 package com.eum.admin.dao;
 
 import java.util.*;
 
 import org.apache.ibatis.session.*;
 import org.apache.ibatis.session.SqlSessionFactory;
 
 import com.eum.commons.CreateSqlSessionFactory;
 import com.eum.main.vo.NoticeVO;
 
 public class Admin_NoticeDAO {
 
 		private static SqlSessionFactory ssf;
 		static
 		{
 			ssf=CreateSqlSessionFactory.getSsf();
 		}
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
 		public static NoticeVO adminnoticeDeleteData(String n_id)
 		{
 			
 			SqlSession session=ssf.openSession();
 			NoticeVO vo=session.selectOne("adminnoticeDeleteData",n_id);
 			session.close();
 			return vo;
 		}
 	}
 
