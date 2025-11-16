package com.eum.pay.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.OrdersVO;
import com.eum.main.vo.PaymentVO;
import com.sist.controller.RequestMapping;

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
	// 주문 상세페이지 데이터 조회
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
	/*
	 * <insert id="ordersInsert" parameterType="OrdersVO">
	    INSERT INTO orders(o_id,b_op_id,o_status,o_total_price,o_createdat,o_updatedat)
	     VALUES(orders_id_seq.nextval,
	            '#{b_op_id}',
	            '#{o_status}',
	            '#{o_total_price}',
	            SYSDATE,
	            SYSDATE)
	  </insert>
	 */
	// orders table insert
	public static int ordersInsert(OrdersVO vo)
	{	
		int o_id = 0;
		try
		{
			SqlSession session=ssf.openSession();
			session.insert("ordersInsert",vo);
			session.commit();
			session.close();
			
			o_id = vo.getO_id();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return o_id;
	}
	
	// orders 결제대기 -> 결제취소
	public static void ordersCancel(String o_id) {
	    try {
	        SqlSession session = ssf.openSession();
	        session.update("ordersCancel", o_id);
	        session.commit();
	        session.close();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	}
	/*
	 *   <insert id="paymentInsert" parameterType="paymentVO">
		   INSERT INTO payment(pay_id,o_id,o_u_id,imp_uid,merchant_uid,amount,status,pay_method,
		   					   pg_provider,receipt_url,paid_at,canceled_at,o_method,p_u_id)
		     VALUES(payment_id_seq.nextval,
		            #{o_id},
		            #{o_u_id},
		            #{imp_uid},
		            #{merchant_uid},
		            #{amount},
		            '결제완료',
		            #{pay_method},
		            #{pg_provider},
		            #{receipt_url},
		            SYSDATE,
		            NULL,
		            #{o_method},
		            #{p_u_id}
		            );
		  </insert>
	 */
	// paymant table insert
	public static void paymentInsert (PaymentVO vo)
	{
		try
		{
			SqlSession session=ssf.openSession();
			session.insert("paymentInsert",vo);
			session.commit();
			session.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	// 결제대기 -> 결제완료 변경
	public static void updateOrderStatus(String o_id) {
	    try {
	        SqlSession session = ssf.openSession();
	        session.update("updateOrderStatus", o_id);
	        session.commit();
	        session.close();
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    }
	}
	/*
	 *    <select id="mypagePayment" resultMap="optionMap" parameterType="string">
		    SELECT * FROM ( SELECT ROWNUM AS num, A.*
			FROM ( SELECT
		    o.o_u_id AS o_u_id,
			o.o_id AS o_id,
			o.b_op_id AS b_op_id,
			o.o_createdat AS o_createdat,
			o.o_total_price AS o_total_price,
			bo.b_op_title AS b_op_title,
			bo.b_op_detail AS b_op_detail,
			b.b_thumbnail AS b_thumbnail,
			us.u_s_com AS u_s_com
			FROM orders o
			JOIN board_option bo ON o.b_op_id = bo.b_op_id
			JOIN board b ON b.b_id = bo.b_id
			JOIN users_seller us ON b.u_s_id = us.u_s_id
		    WHERE o.o_u_id = #{o_u_id}
		    ORDER BY o_id DESC
			) A )
			WHERE num BETWEEN #{start} AND #{end}
		   </select>
	 */
	// mypage payment
	public static List<BoardVO> mypagePayment(Map map)
	{
		   List<BoardVO> list=null;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("mypagePayment",map);
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
