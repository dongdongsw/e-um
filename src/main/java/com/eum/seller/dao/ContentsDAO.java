package com.eum.seller.dao;

import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Board_ImageVO;
import com.eum.main.vo.Board_OptionVO;

/*
 *   <insert id="contentsBoardInsert" parameterType="BoardVO">
    INSERT INTO board 
    	( 
    	  b_id, u_s_id, b_type, b_title, b_content, 
    	  b_thumbnail, b_createdat, b_prod_on_off, b_status
    	)
    VALUES
    	(
    	  TO_CHAR(b_id_seq.nextval), #{u_s_id}, #{b_type}, #{b_title}, 
    	  #{b_content}, #{b_thumbnail}, SYSDATE, #{b_prod_on_off}, 'active'
    	)
  </insert>
  <insert id="contentsImageInsert" parameterType="com.eum.main.vo.Board_ImageVO">
    INSERT INTO board_image
        (b_img_id, b_id, b_img_url)
    VALUES
    	(
    	  b_img_id_seq.nextval, TO_CHAR(b_id_seq.currval), #{b_img_url}
    	)
  </insert>
  <insert id="contentsOptionInsert" parameterType="Board_OptionVO">
    INSERT INTO board_option
        (b_op_id, b_id, b_op_title, b_op_price, b_op_detail)
    VALUES
     	(
     	  op_id_seq.nextval, TO_CHAR(b_id_seq.currval), #{b_op_title}, #{b_op_price}, #{b_op_detail}
     	)
  </insert>
 */

public class ContentsDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	private static final String NS = "com.eum.seller.mapper.contents-mapper.";
	
	// 컨텐츠 작성
	public static String contentsInsert(BoardVO bvo, List<Board_ImageVO> imgList, List<Board_OptionVO> opList) {
		String b_id=null;
		try {
			SqlSession session=ssf.openSession();
			
			session.insert("contentsBoardInsert",bvo);
			
			if(imgList != null) {
				 for (Board_ImageVO ivo:imgList) {
					 session.insert("contentsImageInsert",ivo);
				 }
			}
			for(Board_OptionVO ovo:opList) {
				session.insert("contentsOptionInsert",ovo);
			}
			
			b_id=session.selectOne("getB_id");
			
			session.commit();
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return b_id;
	}
	
	 // 컨텐츠 기본 정보
    public static BoardVO contentsDetail(String b_id) {
    	
        BoardVO vo=null;
        SqlSession session=null;
        
        try {
            session=ssf.openSession();
            vo=session.selectOne("contentsDetail", b_id);
            session.close();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return vo;
    }

    // 옵션 목록 (있는 만큼)
    public static List<Board_OptionVO> contentsOptionList(String b_id) {
    	
        List<Board_OptionVO>list=null;
        SqlSession session=null;
        
        try {
            session=ssf.openSession();
            list=session.selectList("contentsOptionList", b_id);
            session.close();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        } 
        
        return list; 
        
    }
	
	// 컨텐츠 수정
	public static void contentsUpdate(BoardVO bvo, List<Board_OptionVO> opList) {
        try {
            SqlSession session=ssf.openSession();

            session.update("contentsBoardUpdate", bvo);

            if (opList != null) {
                for (Board_OptionVO ovo : opList) {
                    session.update("contentsOptionUpdate", ovo);
                }
            }

            session.commit();
            session.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
	}

	
/*
 *  <!-- 컨텐츠 삭제 -->

  <delete id="reviewImageDel" parameterType="int"> <!-- 리뷰 이미지 삭제 -->
	DELETE FROM review_image
	  WHERE b_review_id IN (
	    SELECT b_review_id
	    FROM review
	    WHERE b_id = #{b_id}
	  )
  </delete>
  
  <delete id="reviewDel" parameterType="string"> <!-- 리뷰 삭제 -->
    DELETE FROM review
  	WHERE b_id=#{b_id}
  </delete>
  
  <delete id="priceOpDel" parameterType="string"> <!-- 가격 옵션 삭제 -->
    DELETE FROM board_option
  	WHERE b_id=#{b_id}
  </delete>
  
  <delete id="detailImgDel" parameterType="string"> <!-- 상세이미지 삭제 -->
    DELETE FROM board_image
  	WHERE b_id=#{b_id}
  </delete>
  
  <delete id="boardDel" parameterType="string"> <!-- 컨텐츠 삭제 -->
    DELETE FROM board
  	WHERE b_id=#{b_id}
  </delete>
  
 */
	// 컨텐츠 삭제
	public static void contentsDelete(String b_id) {
		try {
			SqlSession session=ssf.openSession();
			
			session.delete(NS+"reviewImageDel",b_id);
			session.delete(NS+"reviewDel",b_id);
			session.delete(NS+"priceOpDel",b_id);
			session.delete(NS+"detailImgDel",b_id);
			session.delete(NS+"boardDel",b_id);
			
			session.commit();
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
		
}