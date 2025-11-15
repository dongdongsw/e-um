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
	
	// 컨텐츠 작성
	public static void contentsInsert(BoardVO bvo, List<Board_ImageVO> imgList, List<Board_OptionVO> opList) {
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
			
			session.commit();
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
		
}
