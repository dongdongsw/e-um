package com.eum.main.model;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import com.eum.main.vo.*;
import com.eum.main.dao.TalentDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
	   String b_id=request.getParameter("b_id");
	   
	   BoardVO detail_vo=TalentDAO.talentDetailData(b_id);
	   BoardVO board_vo=TalentDAO.talentDetailboard(b_id);
	   List<BoardVO> image_vo=TalentDAO.talentDetailboardImage(b_id);
	   List<BoardVO> review_vo=TalentDAO.talentDetailreview(b_id);
	   BoardVO score_vo=TalentDAO.talentDetailscore(b_id);
	   List<Board_OptionVO> price_vo=TalentDAO.talentDetailprice(b_id);
	   
	   request.setAttribute("detail_vo", detail_vo);
	   request.setAttribute("board_vo", board_vo);
	   request.setAttribute("image_vo", image_vo);
	   request.setAttribute("review_vo", review_vo);
	   request.setAttribute("score_vo", score_vo);
	   request.setAttribute("price_vo", price_vo);
	   
	   request.setAttribute("main_jsp", "../talent/detail.jsp");
	   return "../main/main.jsp";
   }
   
}
