package com.eum.main.model;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Board_OptionVO;
import com.eum.main.vo.FavoriteVO;
import com.eum.main.vo.ReviewVO;
import com.eum.users.dao.FavoriteDAO;
import com.eum.main.dao.TalentDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class TalentModel {
   @RequestMapping("talent/list.eum")
   public String talent_list(HttpServletRequest request,
         HttpServletResponse response)
   {
      String page=request.getParameter("page");
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      Map map=new HashMap();
      int rowSize=12;
      int start=(rowSize*curpage)-(rowSize-1);
      int end=rowSize*curpage;
      map.put("start", start);
      map.put("end", end);
      List<BoardVO> life_list=TalentDAO.talentListData(map);
      int totalpage=TalentDAO.talentTotalPage();
      
      final int BLOCK=10;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
      
      if(endPage>totalpage)
      {
    	  endPage=totalpage;
      }
      request.setAttribute("life_list", life_list);
      request.setAttribute("curpage", curpage);
      request.setAttribute("totalpage", totalpage);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("main_jsp", "../talent/list.jsp");
      return "../main/main.jsp";
   }
   @RequestMapping("talent/detail.eum")
   public String talent_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   HttpSession session = request.getSession();
	   String u_id = (String)session.getAttribute("id"); // 세션에 저장된 유저 키값 가져오기
	   
	   String b_id=request.getParameter("b_id");
	   String page=request.getParameter("page");
	   
	   BoardVO detail_vo=TalentDAO.talentDetailData(b_id);
	   BoardVO board_vo=TalentDAO.talentDetailboard(b_id);
	   List<BoardVO> review_vo=TalentDAO.talentDetailreview(b_id);
	   BoardVO score_vo=TalentDAO.talentDetailscore(b_id);
	   List<Board_OptionVO> price_vo=TalentDAO.talentDetailprice(b_id);
	   
	   int fCount = 0; // 즐겨찾기 카운트 초기화
	    if(u_id != null && b_id != null) {
	        FavoriteVO vo = new FavoriteVO();
	        vo.setU_id(u_id);
	        vo.setB_id(b_id);
	        
	        fCount = FavoriteDAO.favoriteCheckCount(vo); // 즐겨찾기 카운트 조회
	    }
	   request.setAttribute("page", page);
	   request.setAttribute("detail_vo", detail_vo);
	   request.setAttribute("board_vo", board_vo);
	   request.setAttribute("review_vo", review_vo);
	   request.setAttribute("score_vo", score_vo);
	   request.setAttribute("price_vo", price_vo);
	   request.setAttribute("fCount", fCount); // 즐겨찾기 카운트 값 넘기기
	   
	   request.setAttribute("main_jsp", "../talent/detail.jsp");
	   return "../main/main.jsp";
   }
   
}
