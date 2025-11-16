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

	// mypage payment
	public static BoardVO mypagePayment(String o_id)
	{
		BoardVO vo=null;
		try
		{
			SqlSession session=ssf.openSession();
			vo=session.selectOne("mypagePayment",o_id);
			session.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return vo;
	}

	// 환불 인서트
	public static void refundInsert(RefundVO vo) {
	    SqlSession session = null;
	    try {
	        session = ssf.openSession();
	        session.insert("refundInsert", vo);
	        session.commit();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        if (session != null) session.close();
	    }
	}
	
	// 환불
	public static void refundPay(String impUid) {
	    try {
	        String apiKey = "2122580685181476";
	        String apiSecret = "VXiW5teIusfvbULYuKmt5WXnKzRoN5vwS1QF005rPpipokjvNEHCRldJ8SZ17vdidJAdDmiCCMU3zEio";

	        // 1. 엑세스 토큰 발급
	        URL url = new URL("https://api.iamport.kr/users/getToken");
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setDoOutput(true);

	        String tokenJson = "{ \"imp_key\": \""+apiKey+"\", \"imp_secret\": \""+apiSecret+"\" }";
	        conn.getOutputStream().write(tokenJson.getBytes());

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        JSONObject tokenResponse = new JSONObject(br.readLine());
	        String accessToken = tokenResponse.getJSONObject("response").getString("access_token");

	        // 2. 환불 요청
	        url = new URL("https://api.iamport.kr/payments/cancel");
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", accessToken);
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setDoOutput(true);

	        String cancelJson = "{ \"imp_uid\": \""+impUid+"\" }";
	        conn.getOutputStream().write(cancelJson.getBytes());

	        BufferedReader br2 = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        System.out.println("환불 결과: " + br2.readLine());

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
