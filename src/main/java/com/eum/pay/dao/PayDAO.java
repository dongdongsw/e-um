package com.eum.pay.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.OrdersVO;
import com.eum.main.vo.PaymentVO;
import com.eum.main.vo.RefundVO;

public class PayDAO {
   private static SqlSessionFactory ssf;
   static
   {
      ssf=CreateSqlSessionFactory.getSsf();
   }
   private static final String NS = "com.eum.pay.mapper.payment-mapper.";
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
   public static List<OrdersVO> mypagePayment(Map map)
   {
         List<OrdersVO> list=null;
        
         try
         {
            SqlSession session = ssf.openSession();
            list=session.selectList("mypagePayment",map);
            session.close();
         }catch(Exception ex)
         {
            ex.printStackTrace();
         }
        
         return list;
   }

   // 환불 인서트
   public static void refundInsert(RefundVO vo) {
        
       try {
          SqlSession session = ssf.openSession();
           session.insert("refundInsert", vo);
           session.commit();
           session.close();
       } catch (Exception ex) {
           ex.printStackTrace();
       }
   }

   // 셀러 -> 유저 결제 내역 리스트
   public static List<OrdersVO> usPayList(Map map)
   {
         List<OrdersVO> list=null;
        
         try
         {
            
            SqlSession session = ssf.openSession();
            session.clearCache();
            list=session.selectList(NS+"usPayList",map);
            session.close();
         }catch(Exception ex)
         {
            ex.printStackTrace();
         }
        
         return list;
   }
   
// 셀러 토탈 리뷰
	public static int usPayTotalPage(int sid) {
		   int count=0;
		   try {
			   SqlSession session=ssf.openSession();
			   count=session.selectOne("usPayTotalPage",sid);
			   session.close();
			
		   } catch (Exception ex) {
			   ex.printStackTrace();
		   }
		   return count;
	   }
}