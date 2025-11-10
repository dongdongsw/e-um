package com.eum.list.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.BoardVO;
import com.eum.list.vo.Board_OptionVO;

/*
 * <select id="lifeListData" resultMap="boardMap" parameterType="hashmap">
	SELECT * FROM ( SELECT ROWNUM AS num, A.*
	FROM ( SELECT 
		   board.b_id AS b_id,
		   b_title,
		   b_thumbnail AS b_thumbnail,
		   ROUND(AVG(b_review_score),1) AS b_review_score,
		   COUNT(DISTINCT b_review_id) AS review_count,
		   MIN(b_op_price) AS b_op_price,
		   u_s_com,
		   b_type
		   FROM board,board_option,users_seller,review
		   WHERE board.b_id = board_option.b_id
		   AND board.u_s_id = users_seller.u_s_id
		   AND board.b_id = review.b_id
		   AND b_type='생활라이프'
		   GROUP BY board.b_id,b_title,b_thumbnail,u_s_com,b_type
		   ORDER BY b_id DESC
	   ) A
	)
	WHERE num BETWEEN #{start} AND #{end}
  </select>
 */
	public class LifeDAO {
	   private static SqlSessionFactory ssf;
	   static
	   {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }
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
	   /*
	    *   <select id="lifeDetailboard" resultMap="boardMap" parameterType="string">
			SELECT 
			board.b_id AS b_id,
			b_title,
			b_thumbnail,
			b_view_count,
			b_prod_on_off,
			b_content,
			b_img_url,
			b_op_price,
			b_type,
			b_view_count,
			u_s_com,
			u_s_profileimg_url,
			u_s_carrer,
			u_s_zone
			FROM board,board_option,board_image,users_seller
			WHERE board.b_id = board_option.b_id
			AND board.b_id = board_image.b_id
			AND board.u_s_id = users_seller.u_s_id
		    AND board.b_id=#{b_id} AND ROWNUM=1
		  </select>
	    */
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
	   /*
	    *   <select id="lifeDetailreview" resultMap="boardMap" parameterType="string">
		    SELECT 
			board.b_id AS b_id,
			review.u_s_id AS u_s_id,
			review.b_review_id AS b_review_id,
			b_review_createdat,
			b_review_content,
			r_image_url,
		    u_nickname,
		    u_profileImg_url
			FROM review,board,review_image,users
			WHERE board.b_id = review.b_id
			AND review.b_review_id = review_image.b_review_id
		    AND review.u_id = users.u_id
			AND board.b_id=#{b_id}
		  </select>
	    */
	   public static List<BoardVO> lifeDetailreview(String b_id)
	   {
		   List<BoardVO> list=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   list=session.selectList("lifeDetailreview", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return list;
	   }
	   /*
	    *   <select id="lifeDetailscore" resultMap="boardMap" parameterType="string">
		    SELECT b_id,ROUND(AVG(b_review_score),1) AS b_review_score,
		    COUNT(b_review_id) AS review_count
			FROM review
			WHERE b_id=#{b_id}
			GROUP BY b_id
		  </select>
	    */
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
