package com.eum.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	
	// 컨텐츠 상태 수정
	public static void contentsStatusUpdate(Map map) {
		
		try {
			SqlSession session = ssf.openSession(true);
			session.update("contentsStatusUpdate",map);
			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}

	
}
