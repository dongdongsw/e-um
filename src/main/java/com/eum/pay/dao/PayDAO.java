package com.eum.list.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.BoardVO;

public class PayDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 *     <select id="ordersData" resultMap="optionMap" parameterType="string">
		    SELECT 
			b.b_id,
			b_thumbnail,
			us.u_s_id,
			u_s_profileimg_url,
			u_s_com,
			b_op_id,
			b_op_title,
			b_op_price,
			b_op_detail
			FROM board b, users_seller us, board_option bo
			WHERE b.u_s_id = us.u_s_id
			AND b.b_id = bo.b_id
			AND bo.b_op_id = #{b_op_id}
		  </select>
	 */
	public static BoardVO ordersData(int b_op_id)
	{
		BoardVO vo=null;
		try
		{
			SqlSession session=ssf.openSession();
			vo=session.selectOne("ordersData", b_op_id);
			session.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return vo;
	}
}
