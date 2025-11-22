package com.eum.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.OrdersVO;
import com.eum.main.vo.ReviewVO;
import com.eum.main.vo.Users_SellerVO;

public class Admin_SellerDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	private static final String NS = "com.eum.admin.mapper.delete-mapper.";
	
	// 셀러 리스트 조회
	public static List<Users_SellerVO> sellerListData(Map map){
		
		List<Users_SellerVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			
			list = session.selectList("sellerListData",map);
			session.close();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	// 셀러 페이징 조회
	public static int sellerTotalData() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("sellerTotalData");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 셀러 디테일 조회
	public static Users_SellerVO sellerDetailData(int u_s_id) {
		Users_SellerVO vo = null;
		try {
			SqlSession session = ssf.openSession();
			vo = session.selectOne("sellerDetailData",u_s_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	// 셀러 컨텐츠 조회
	public static List<BoardVO> sellerContentsListData(Map map){
		
		List<BoardVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("sellerContentsListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	// 셀러 컨텐츠 페이징
	public static int sellerContentsTotalData(int u_s_id) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("sellerContentsTotalData",u_s_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 셀러 리뷰 리스트
	public static List<ReviewVO> sellerReviewListData(Map map){
		
		List<ReviewVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("sellerReviewListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	

	public static int sellerReviewTotalData(int u_s_id) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("sellerReviewTotalData",u_s_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 셀러 삭제
	public static void sellerDel(int u_s_id) {
		
		try {
			SqlSession session = ssf.openSession();
			List<String> bList = session.selectList(NS + "findSellerBoardIds", u_s_id);
			for(String b_id : bList) {
				//셀러가 받은 좋아요 삭제
	            session.delete(NS + "favoriteDel", b_id);
				//셀러가 받은 즐겨찾기 삭제
	            session.delete(NS + "likeDel", b_id);
				//셀러가 받은 리뷰 이미지 삭제
	            session.delete(NS + "reviewImageDel", b_id);
				//셀러 작성한 리뷰 삭제 & 셀러가 받은 리뷰 삭제
	            session.delete(NS + "reviewDel", b_id);
				//셀러가 만든 게시판 이미지 삭제
	            session.delete(NS + "detailImgDel", b_id);
				//셀러가 만든 게시판 옵션 삭제
	            session.delete(NS + "priceOpDel", b_id);
				//셀러가 만든 게시판 삭제
	            session.delete(NS + "boardDel", b_id);
	            
			}
            //마지막으로 셀러 삭제
            session.delete(NS + "sellerDelete", u_s_id);
			
			session.commit();
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	// 셀러 검색 + 페이지 목록
	public static List<Users_SellerVO> sellerSearchListData(Map map){
		
		List<Users_SellerVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			
			list = session.selectList("sellerSearchListData",map);
			session.close();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
		
	// 셀러 검색 총 페이지(페이징 용)
	public static int sellerSearchTotalPage(String keyword) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("sellerSearchTotalPage",keyword);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 각 판매자 주문 리스트 조회
 	public static List<OrdersVO> ordersSellersListData(Map map){
 		
 		List<OrdersVO> list = null;
 		try {
 			SqlSession session = ssf.openSession();
 			list = session.selectList("ordersSellersListData",map);
 			session.close();
 		} catch (Exception ex) {
 			ex.printStackTrace();
 		}
 		return list;
 	}
	 	
 	// 각 판매자 주문 페이징 조회
 	public static int ordersSellersTotalPage(int u_s_id) {
 		int total = 0;
 		try {
 			SqlSession session = ssf.openSession();
 			total = session.selectOne("ordersSellersTotalPage",u_s_id);
 			session.close();
 		} catch (Exception ex) {
 			ex.printStackTrace();
 		}
 		return total;
 	}
	
}
