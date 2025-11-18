package com.eum.pay.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.Board_LikeVO;

public class LikeDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }

   public static int boardLikeInsert(Board_LikeVO vo)
   {
	   int count=0;
	   SqlSession session=null;
	   try
	   {
		  
		   session=ssf.openSession(true);
		   session.insert("boardLikeInsert",vo);
		   session.commit();
		   count=session.selectOne("boardLikeCount",vo);
		   session.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   return count;
   }
   public static int boardLikeDelete(Board_LikeVO vo)
   {
	   int count=0;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   session.delete("boardLikeDelete", vo);
		   session.commit();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   return count;
   }
   
   public static int boardLikeUserChk(Board_LikeVO vo)
   {
	   System.out.println("boardLikeUserChk !!! ");
	   int count=0;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   count = session.selectOne("boardLikeUserChk", vo);
		   session.commit();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   return count;
   }
   
   
   public static int boardLikeCount(Board_LikeVO vo)
   {
	   int count=0;
	   try
	   {
		   SqlSession session=ssf.openSession();
		   count=session.selectOne("boardLikeCount", vo);
		   session.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   return count;
   }
   
   
}
