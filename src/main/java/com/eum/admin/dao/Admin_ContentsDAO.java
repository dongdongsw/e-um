package com.eum.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Board_ImageVO;
import com.eum.main.vo.Board_OptionVO;

public class Admin_ContentsDAO {

	private static SqlSessionFactory ssf;
	static {
		
		ssf = CreateSqlSessionFactory.getSsf();
	}

	private static final String NS = "com.eum.admin.mapper.contents-mapper.";
	private static final String DS = "com.eum.admin.mapper.delete-mapper.";
	// 컨텐츠 리스트 조회
	public static List<BoardVO> contentsListData(Map map){
		
		List<BoardVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList(NS + "contentsListData",map);
			session.close();
		} catch (Exception ex) {
			// TODO: handle exception
		}
		return list;
	}
	// 컨텐츠 페이징 조회
	public static int contentsTotalData() {
		int total = 0;
		try {
			SqlSession session = ssf.openSession();
			total = session.selectOne(NS + "contentsTotalData");
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return total;
	}
	// 컨텐츠 디테일 조회
	public static BoardVO contentsDetailboard(String b_id) {
		
		BoardVO vo = null;
		try {
			SqlSession session = ssf.openSession();
			vo = session.selectOne(NS + "contentsDetailboard", b_id);
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return vo;
	}
	
	// 컨텐츠 디테일 이미지 출력
	public static List<Board_ImageVO> contentsDetailboardImage(String b_id) {
		
		List<Board_ImageVO> list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList(NS + "contentsDetailboardImage", b_id);
			session.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	
	// 컨텐츠 디테일 리뷰 평균 조회
	public static BoardVO contentsDetailscore(String b_id)
    {
       BoardVO vo=null;
       try
       {
          SqlSession session=ssf.openSession();
          vo=session.selectOne(NS + "contentsDetailscore", b_id);
          session.close();
       }catch(Exception ex)
       {
          ex.printStackTrace();
       }
       return vo;
    }
	
	 // 컨텐츠 금액 옵션
    public static List<Board_OptionVO> contentsDetailprice(String b_id)
    {
       List<Board_OptionVO> list=null;
       try
       {
          SqlSession session=ssf.openSession();
          list=session.selectList(NS + "contentsDetailprice", b_id);
          session.close();
       }catch(Exception ex)
       {
          ex.printStackTrace();
       }
       return list;
    }
	// 컨텐츠 삭제
	public static void contentsDel(String b_id) {
		
		try
	       {
	          SqlSession session=ssf.openSession();
	          
		        //셀러가 받은 좋아요 삭제
	            session.delete(DS + "favoriteDel", b_id);
				//셀러가 받은 즐겨찾기 삭제
	            session.delete(DS + "likeDel", b_id);
				//셀러가 받은 리뷰 이미지 삭제
	            session.delete(DS + "reviewImageDel", b_id);
				//셀러 작성한 리뷰 삭제 & 셀러가 받은 리뷰 삭제
	            session.delete(DS + "reviewDel", b_id);
				//셀러가 만든 게시판 이미지 삭제
	            session.delete(DS + "detailImgDel", b_id);
				//셀러가 만든 게시판 옵션 삭제
	            session.delete(DS + "priceOpDel", b_id);
				//셀러가 만든 게시판 삭제
	            session.delete(DS + "boardDel", b_id);
	            
	            session.commit();
	            
	        	session.close();
	       }catch(Exception ex)
	       {
	          ex.printStackTrace();
	       }
		
	}
    
    
	// 컨텐츠 상태 수정
	public static void contentsStatusUpdate(Map map) {
		
		try {
			SqlSession session = ssf.openSession(true);
			session.update(NS + "contentsStatusUpdate",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}

	// 컨텐츠 검색 리스트
	public static List<BoardVO> contentSearchListData(Map map){
		
		List<BoardVO>  list = null;
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList(NS + "contentSearchListData",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	// 컨텐츠 검색 페이징
		public static int contentSearchTotalData(String keyword) {
			int total = 0;
			try {
				SqlSession session = ssf.openSession();
				total = session.selectOne(NS + "contentSearchTotalData", keyword);
				session.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return total;
		}
}
