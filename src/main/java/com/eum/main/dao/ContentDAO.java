package com.eum.main.dao;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.*;

public class ContentDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	private static final String NS = "com.eum.main.mapper.review-mapper.";
		
	// 상세보기 페이지
	   public static BoardVO talentDetailData(String b_id)
	   {
		   BoardVO vo=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   vo=session.selectOne("talentDetailData", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return vo;
	   }

	   public static BoardVO talentDetailboard(String b_id)
	   {
		   BoardVO vo=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   session.update("talentHitIncrement",b_id);
			   session.commit();
			   vo=session.selectOne("talentDetailboard", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return vo;
	   }
	   
	   //게시판 이미지
	   public static List<BoardVO> talentDetailboardImage(String b_id)
	   {
		   List<BoardVO> list=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   list=session.selectList("talentDetailboardImage", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return list;
	   }
	   
	   // 리뷰 이미지
	   public static List<String> reviewImage(String b_review_id) {
		    SqlSession session = ssf.openSession();
		    List<String> list = session.selectList("reviewImage", b_review_id);
		    session.close();
		    return list;
		}
	   
	   // 리뷰
	   public static List<BoardVO> talentDetailreview(String b_id) {
		    List<BoardVO> list = null;
		    try {
		        SqlSession session = ssf.openSession();
		        list = session.selectList("talentDetailreview", b_id);

		        if (list != null) {
		            for (BoardVO r : list) {
		                String reviewId = r.getRvo().getB_review_id(); 
		                List<String> imgs = session.selectList("reviewImage", reviewId);
		                r.getRvo().setImgList(imgs);               
		            }
		        }
		        session.close();
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } 
		    return list;
		}
	   
	// 별점 평균
	   public static BoardVO talentDetailscore(String b_id)
	   {
		   BoardVO vo=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   vo=session.selectOne("talentDetailscore", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return vo;
	   }
	// 금액 옵션
	   public static List<Board_OptionVO> talentDetailprice(String b_id)
	   {
		   List<Board_OptionVO> list=null;
		   try
		   {
			   SqlSession session=ssf.openSession();
			   list=session.selectList("talentDetailprice", b_id);
			   session.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   return list;
	   }
	
	   // 리뷰 작성
	   public static void reviewInsert(ReviewVO vo) {
		   
		   try {
			   SqlSession session=ssf.openSession(true);
			   session.insert("reviewInsert",vo);
			   session.close();
		   } catch (Exception ex) {
			   ex.printStackTrace();
		   }
	   }
	   
	   // 답변 작성
	   public static void replyInsert(ReviewVO vo) {
		   
		   try {
			   SqlSession session=ssf.openSession(true);
			   session.insert("replyInsert",vo);
			   session.close();
		   } catch (Exception ex) {
			   ex.printStackTrace();
		   }
	   }
	   
	   // 리뷰 수정
	   public static String reviewUpdate(ReviewVO vo) {
		   String res=null;
		   try {
			   SqlSession session=ssf.openSession(true);
			   session.update("reviewUpdate",vo);
			   session.close();
			   res="YES";
		   } catch (Exception ex) {
			   res="NO";
			   ex.printStackTrace();
		   }
		   return res;
	   }
	   
	   // 답변 수정
	   public static String replyUpdate(ReviewVO vo) {
		   String res=null;
		   try {
			   SqlSession session=ssf.openSession(true);
			   session.update("replyUpdate",vo);
			   session.close();
			   res="YES";
		   } catch (Exception ex) {
			   res="NO";
			   ex.printStackTrace();
		   }
		   return res;
	   }
	   
	   // 답변 삭제
	   public static String replyDelete(int b_review_id) {
		   String res=null;
		   try {
			   SqlSession session=ssf.openSession(true);
			   session.delete(NS+"replyDelete",b_review_id);
			   session.close();
			   res="YES";
		   } catch (Exception ex) {
			   res="NO";
			   ex.printStackTrace();
		   }
		   return res;
	   }
	   
	   // 리뷰 삭제
	   public static String reviewDelete(int b_review_id) {
		   String res=null;
		   try {
			   SqlSession session=ssf.openSession();
			   session.delete(NS+"reviewImageDelete",b_review_id);
			   session.delete(NS+"reviewReplyDelete",b_review_id);
			   session.commit();
			   session.close();
			   res="YES";
		   } catch (Exception ex) {
			   res="NO";
			   ex.printStackTrace();
		   }
		   return res;
	   }
	   
	// 구매자 검사
	   public static int buyCheck(Map map) {
		   int buy=0;
		   try {
			   SqlSession session=ssf.openSession();
			   buy=session.selectOne("buyCheck",map);
			   session.close();
     	   } catch (Exception ex) {
     		   ex.printStackTrace();
     	   }
		   return buy;
	   }
	   
	   // 이미 리뷰 작성자인지
	   public static int reviewOk(ReviewVO rvo) {
		   int rcount=0;
		   try {
			   SqlSession session=ssf.openSession();
			   rcount=session.selectOne("reviewOk",rvo);
			   session.close();
		   } catch (Exception ex) {
			   ex.printStackTrace();
		   }
		   return rcount;
	   }
	
	   // 키워드 검색
	   public static List<BoardVO> talentSearchKeywordData(Map map) {
		    List<BoardVO> list = null;
		    try {
		    	
		        SqlSession session = ssf.openSession();
		        list = session.selectList("talentSearchKeywordData", map);
		        session.close();
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } 
		    return list;
		}
	    // 키워드 검색 페이지네이션
		public static int talentSearchKeywordTotalPage(Map map) {
		    int total = 0;
		    try {
		    	
		        SqlSession session = ssf.openSession();
		        total = session.selectOne("talentSearchKeywordTotalPage", map);
		        session.close();
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } 
		    return total;
		}
		
		// 타입 검색
		public static List<BoardVO> talentSearchTypeData(Map map) {
		    List<BoardVO> list = null;
		    try {
		        SqlSession session = ssf.openSession();
		        list = session.selectList("talentSearchTypeData", map);
		        session.close();
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } 
		    return list;
		}
		// 타입 검색 페이지네이션
		public static int talentSearchTypeTotalPage(Map map) {
		    int total = 0;
		    try {
		        SqlSession session = ssf.openSession();
		        total = session.selectOne("talentSearchTypeTotalPage", map);
		        session.close();
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } 
		    return total;
		}
		public static List<BoardVO> homeHotContents()
		{
			List<BoardVO> list=null;
			try
			{
				SqlSession session=ssf.openSession();
				list=session.selectList("homeHotContents");
				session.close();
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			return list;
		}
		
		 // 최근 올라온 게시물 
		   public static List<BoardVO> mainRecentContents() {
			   List<BoardVO> list=null;
			   try {
				   SqlSession session=ssf.openSession();
				   list=session.selectList("mainRecentContents");
				   session.close();
			   } catch (Exception ex) {
				   ex.printStackTrace();
			   }
			   return list;
		   }
		    // 리스트
		    public static List<BoardVO> contentList(Map map) {
		        List<BoardVO> list = null;
		        SqlSession session = null;
		        try {
		            session = ssf.openSession();
		            list = session.selectList("contentList", map);
		        } catch (Exception ex) {
		            ex.printStackTrace();
		        } finally {
		            if (session != null) session.close();
		        }
		        return list;
		    }

		    // 총페이지
		    public static int contentTotalPage(Map map) {
		        int total = 0;
		        SqlSession session = null;
		        try {
		            session = ssf.openSession();
		            total = session.selectOne("contentTotalPage", map);
		        } catch (Exception ex) {
		            ex.printStackTrace();
		        } finally {
		            if (session != null) session.close();
		        }
		        return total;
		    }
}