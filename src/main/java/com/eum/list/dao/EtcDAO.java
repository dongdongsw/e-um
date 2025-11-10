package com.eum.list.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.eum.commons.CreateSqlSessionFactory;
import com.eum.list.vo.ContentVO;
import com.eum.list.vo.ReviewVO;

public class EtcDAO {
	private static SqlSessionFactory ssf;
	   static {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }
	   
	   public static List<ContentVO> etcListData(Map map) {
		   SqlSession session=ssf.openSession();
		   List<ContentVO> list=session.selectList("etcListData",map);
		   session.close();
		   return list;
	   }
	   
	   public static int etcTotalPage() {
		   SqlSession session=ssf.openSession();
		   int total=session.selectOne("etcTotalPage");
		   session.close();
		   return total;
	   }
	   
	   public static ContentVO etcDetailData(String b_id) {
		   SqlSession session=ssf.openSession();
		   ContentVO vo=session.selectOne("etcDetailData",b_id);
		   session.close();
		   return vo;
	   }
	   
	   public static List<String> etcDetailImage(String b_id) {
		   SqlSession session=ssf.openSession();
		   List<String> list=session.selectList("etcDetailImage",b_id);
		   session.close();
		   return list;
	   }
	   
	   // 리뷰
	   public static List<ReviewVO> etcReview(String b_id) {
		   SqlSession session=ssf.openSession();
		   List<ReviewVO> list=session.selectList("etcReview", b_id);
		   for (ReviewVO r:list) {
			   List<String> imgs=session.selectList("etcReviewImage",r.getB_review_id());
			   r.setImgList(imgs);
		   }
		   session.close();
		   return list;
	   }
	   
	   // 옵션
	   public static List<ContentVO> etcPriceOption(String b_id) {
		   SqlSession session=ssf.openSession();
		   List<ContentVO> list=session.selectList("etcPriceOption",b_id);
		   session.close();
		   return list;
	   }
}