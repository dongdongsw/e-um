package com.eum.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;

public class Admin_MainDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	// 총 사용자 수
	public static int userTotalCount() {
		
		int usercount = 0;
		try {
			SqlSession session = ssf.openSession();
			usercount = session.selectOne("userTotalCount");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return usercount;
	}
	
	// 총 판매자 수
	public static int sellerTotalCount() {
		
		int usercount = 0;
		try {
			SqlSession session = ssf.openSession();
			usercount = session.selectOne("sellerTotalCount");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return usercount;
	}
	
	// 총 컨텐츠 수
	public static int contentsTotalCount() {
		
		int usercount = 0;
		try {
			SqlSession session = ssf.openSession();
			usercount = session.selectOne("contentsTotalCount");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return usercount;
	}
	
	// 총 리뷰 수
	public static int reviewTotalCount() {
		
		int reviewTotal = 0;
		try {
			SqlSession session = ssf.openSession();
			reviewTotal = session.selectOne("reviewTotalCount");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return reviewTotal;
	}
	
	// 현재 셀러 등록 현황
	public static Double sellerRegistPercentage() {
		
		Double sellerRegist = 0.0;
		try {
			SqlSession session = ssf.openSession();
			sellerRegist = session.selectOne("sellerRegistPercentage");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return sellerRegist;
	}
	
	// 신규 셀러 범위 : 1주
	public static int sellerNewRegist() {
		
		int sellerNew = 0;
		try {
			SqlSession session = ssf.openSession();
			sellerNew = session.selectOne("sellerNewRegist");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return sellerNew;
	}
	
	// 신규 셀러 비율 1주 전과 비교
	public static Double sellerNewRegistGrowth() {
		
		Double sellerGrowth = 0.0;
		try {
			SqlSession session = ssf.openSession();
			Double result = session.selectOne("sellerNewRegistGrowth");
			if (result != null) sellerGrowth = result;
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return sellerGrowth;
	}
	
	// 총 환불 금액
	public static int refundTotalAmount() {
		
		int refundAmount = 0;
		try {
			SqlSession session = ssf.openSession();
			Integer result = session.selectOne("refundTotalAmount");
			 if (result != null) {
		            refundAmount = result;
		        }
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return refundAmount;
	}
	
	// 신규 환불 신청 수
	public static int refundNewApply() {
		
		int refundNew = 0;
		try {
			SqlSession session = ssf.openSession();
			refundNew = session.selectOne("refundNewApply");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return refundNew;
	}
	
	// 총 환불 접수 수
	public static int refundReceiveTotalApply() {
		
		int refundReceiveTotal = 0;
		try {
			SqlSession session = ssf.openSession();
			refundReceiveTotal = session.selectOne("refundReceiveTotalApply");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return refundReceiveTotal;
	}
	
	// 총 환불 수
	public static int refundTotalCount() {
		
		int refundCount = 0;
		try {
			SqlSession session = ssf.openSession();
			refundCount = session.selectOne("refundTotalCount");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return refundCount;
	}
	
	// 총 환불 처리 완료된 수
	public static int refundCompleteTotalCount() {
		
		int refuntTotalcount = 0;
		try {
			SqlSession session = ssf.openSession();
			refuntTotalcount = session.selectOne("refundCompleteTotalCount");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return refuntTotalcount;
	}
	
	// 유저 가입 통계 월별
	public static List<Map<String,Object>> usersGraphMonth(){
		
		List<Map<String,Object>> usersGraph = null; 
		try {
			SqlSession session = ssf.openSession();
			usersGraph = session.selectList("usersGraphMonth");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return usersGraph;
	}
	
	// 카테고리 별 개수
	public static Map<String, Object> categoryTotalCount() {
		
		Map<String, Object> categoryMap = null;
		try {
			SqlSession session = ssf.openSession();
			categoryMap = session.selectOne("categoryTotalCount");
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return categoryMap;
	}
	
	
	
}
