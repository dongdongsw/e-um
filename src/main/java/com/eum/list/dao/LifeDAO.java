package com.eum.list.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Board_OptionVO;

   public class LifeDAO {
      private static SqlSessionFactory ssf;
      static
      {
         ssf=CreateSqlSessionFactory.getSsf();
      }
      // 리스트
      public static List<BoardVO> lifeListData(Map map)
      {
         List<BoardVO> list=null;
         SqlSession session=null;
         try
         {
            session=ssf.openSession();
            list=session.selectList("lifeListData",map);
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
      public static int lifeTotalPage()
      {
         int total=0;
         SqlSession session=null;
         try
         {
            session=ssf.openSession();
            total=session.selectOne("lifeTotalPage");
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
      public static BoardVO lifeDetailData(String b_id)
      {
         BoardVO vo=null;
         try
         {
            SqlSession session=ssf.openSession();
            vo=session.selectOne("lifeDetailData", b_id);
            session.close();
         }catch(Exception ex)
         {
            ex.printStackTrace();
         }
         return vo;
      }

      public static BoardVO lifeDetailboard(String b_id)
      {
         BoardVO vo=null;
         try
         {
            SqlSession session=ssf.openSession();
            session.update("lifeHitIncrement",b_id);
            session.commit();
            vo=session.selectOne("lifeDetailboard", b_id);
            session.close();
         }catch(Exception ex)
         {
            ex.printStackTrace();
         }
         return vo;
      }
      
      public static List<BoardVO> lifeDetailboardImage(String b_id)
      {
         List<BoardVO> list=null;
         try
         {
            SqlSession session=ssf.openSession();
            list=session.selectList("lifeDetailboardImage", b_id);
            session.close();
         }catch(Exception ex)
         {
            ex.printStackTrace();
         }
         return list;
      }

		/*
		 * // 리뷰 public static List<BoardVO> lifeDetailreview(String b_id) {
		 * List<BoardVO> list=null; try { SqlSession session=ssf.openSession();
		 * list=session.selectList("lifeDetailreview", b_id); for (BoardVO r:list) {
		 * List<String>
		 * imgs=session.selectList("lifeDetailReviewImage",r.getRvo().getB_review_id());
		 * r.getRvo().setImgList(imgs); } session.close(); }catch(Exception ex) {
		 * ex.printStackTrace(); } return list; }
		 */

      // 별점 평균 및 리뷰 갯수
      public static BoardVO lifeDetailscore(String b_id)
      {
         BoardVO vo=null;
         try
         {
            SqlSession session=ssf.openSession();
            vo=session.selectOne("lifeDetailscore", b_id);
            session.close();
         }catch(Exception ex)
         {
            ex.printStackTrace();
         }
         return vo;
      }
      
      // 금액 옵션
      public static List<Board_OptionVO> lifeDetailprice(String b_id)
      {
         List<Board_OptionVO> list=null;
         try
         {
            SqlSession session=ssf.openSession();
            list=session.selectList("lifeDetailprice", b_id);
            session.close();
         }catch(Exception ex)
         {
            ex.printStackTrace();
         }
         return list;
      }
      
   }
