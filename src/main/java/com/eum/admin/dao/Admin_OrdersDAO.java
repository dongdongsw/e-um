package com.eum.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.OrdersVO;

public class Admin_OrdersDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 주문 리스트 조회
	public static List<OrdersVO> ordersListData(Map map){
		
		List<OrdersVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("ordersListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	// 주문 페이징 조회
	public static int ordersTotalPage() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("ordersTotalPage");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 주문 검색 리스트 조회
		public static List<OrdersVO> ordersSearchListData(Map map){
			
			List<OrdersVO> list = null;
			try {
				SqlSession session = ssf.openSession();
				list = session.selectList("ordersSearchListData",map);
				session.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return list;
		}
	// 주문 검색 페이징 조회
	public static int ordersSearchTotalPage(String keyword) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("ordersSearchTotalPage",keyword);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
			
	// 주문 삭제
			
	// 주문 상태 수정
	public static void ordersStatusUpdate(Map map) {
		
		try {
			SqlSession session = ssf.openSession(true);
			session.update("ordersStatusUpdate",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	// 결제 상태 수정
	public static void paymentStatusUpdate(Map map) {
		
		try {
			SqlSession session = ssf.openSession(true);
			session.update("paymentStatusUpdate",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 환불 상태 수정
	public static void refundStatusUpdate(Map map) {
		
		try {
			SqlSession session = ssf.openSession(true);
			session.update("refundStatusUpdate",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
