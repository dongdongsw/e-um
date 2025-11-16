package com.eum.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.ReviewVO;
import com.eum.main.vo.Review_ImageVO;
import com.eum.main.vo.UsersVO;

public class Admin_UsersDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
		
	}
	
	private static final String NS = "com.eum.seller.mapper.contents-mapper.";

	// 유저 리스트 조회
	public static List<UsersVO> usersListData(Map map){
		
		List<UsersVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			
			list = session.selectList("usersListData",map);
			session.close();
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 유저 페이징 조회
	public static int usersListTotalData() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("usersListTotalData");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	// 유저 디테일 조회
	public static UsersVO usersDetailData(String u_id) {
		
		UsersVO vo = null;
		try {
			SqlSession session = ssf.openSession();
			vo = session.selectOne("usersDetailData",u_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	// 유저 삭제
	public static void userDel(String u_id) {
		
		
		try {
			SqlSession session = ssf.openSession();
			Integer u_s_id = session.selectOne("findUserSellerId",u_id);
			 
			
			if(u_s_id != null) {
				List<String> bList = session.selectList("findSellerBoardIds",u_s_id);
				for(String b_id : bList) {
					session.delete(NS + "reviewImageDel",b_id);
					session.delete(NS + "reviewDel",b_id);
					session.delete(NS + "priceOpDel",b_id);
					session.delete(NS + "favoriteDel",b_id);
					session.delete(NS + "likeDel",b_id);
					session.delete(NS + "detailImgDel",b_id);
					session.delete(NS + "boardDel",b_id);
				}
			 }
			session.delete(NS + "users_sellerDel",u_id);
			session.delete(NS + "userDel",u_id);		
			
			session.commit();
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	// 유저 상태 수정
	public static void usersStatusUpdate(Map map){
		
		try {
			SqlSession session = ssf.openSession(true);
			session.update("usersStatusUpdate",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	
	// 리뷰 리스트 & 이미지
	public static List<ReviewVO> usersReviewListData(Map map){
		List<ReviewVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("usersReviewListData",map);
			
			for(ReviewVO vo : list) {
			    Map<String, Object> param = new HashMap();
			    param.put("b_review_id", vo.getB_review_id());
			    param.put("start", map.get("start")); 
			    param.put("end", map.get("end"));     

			    List<Review_ImageVO> imglist = session.selectList("usersReviewImageData", param);
			    vo.setImageList(imglist);
			}

			
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 리뷰 리스트 페이징
	public static int usersReviewListTotalData(String u_id) {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne("usersReviewListTotalData",u_id);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	
	
	 // 유저 검색 + 페이지 목록
    public static List<UsersVO> usersListSearch(Map map) {
        SqlSession session = null;
        List<UsersVO> list = null;
        try {
            session = ssf.openSession();
            list = session.selectList("usersListSearch", map);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return list;
    }

    // 유저 검색 총 페이지 (페이징용)
    public static int usersListSearchTotal(String keyword) {
        SqlSession session = null;
        int total = 0;
        try {
            session = ssf.openSession();
            total = session.selectOne("usersListSearchTotal", keyword);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return total;
    }
	
}
