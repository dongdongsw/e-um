package com.eum.main.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.*;

	public class TalentDAO {
	   private static SqlSessionFactory ssf;
	   static
	   {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }
	   
	// 리스트
	   public static List<BoardVO> talentListData(Map map)
	   {
		   List<BoardVO> list=null;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("talentListData",map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   
	// 총 페이지
	   public static int talentTotalPage()
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("talentTotalPage");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return total;
	   }
	   
	// 상세보기 페이지
	   public static BoardVO talentDetailData(String b_id)
	   {
		   BoardVO vo=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   vo=session.selectOne("talentDetailData", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return vo;
	   }

	   public static BoardVO talentDetailboard(String b_id)
	   {
		   BoardVO vo=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   session.update("talentHitIncrement",b_id);
			   session.commit();
			   vo=session.selectOne("talentDetailboard", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return vo;
	   }
	   
	   //게시판 이미지
	   public static List<BoardVO> talentDetailboardImage(String b_id)
	   {
		   List<BoardVO> list=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   list=session.selectList("talentDetailboardImage", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return list;
	   }
	   
	// 리뷰
	   public static List<BoardVO> talentDetailreview(String b_id)
	   {
		   List<BoardVO> list=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   list=session.selectList("talentDetailreview", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return list;
	   }
	// 별점 평균
	   public static BoardVO talentDetailscore(String b_id)
	   {
		   BoardVO vo=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   vo=session.selectOne("talentDetailscore", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return vo;
	   }
	// 금액 옵션
	   public static List<Board_OptionVO> talentDetailprice(String b_id)
	   {
		   List<Board_OptionVO> list=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   list=session.selectList("talentDetailprice", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return list;
	   }
	   
	}
