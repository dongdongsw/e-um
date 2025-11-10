package com.eum.main.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.list.dao.LifeDAO;
import com.eum.list.vo.BoardVO;
import com.eum.list.vo.Board_OptionVO;
import com.eum.list.vo.ReviewVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class LifeModel {
   @RequestMapping("main/life_list.eum")
   public String life_list(HttpServletRequest request,
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
      List<BoardVO> life_list=LifeDAO.lifeListData(map);
      int totalpage=LifeDAO.lifeTotalPage();
      
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
      request.setAttribute("main_jsp", "../main/pay/life_list.jsp");
      return "../main/main.jsp";
   }
   @RequestMapping("main/life_detail.eum")
   public String life_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String b_id=request.getParameter("b_id");
	   String page=request.getParameter("page");
	   
	   BoardVO detail_vo=LifeDAO.lifeDetailData(b_id);
	   BoardVO board_vo=LifeDAO.lifeDetailboard(b_id);
	   List<BoardVO> review_vo=LifeDAO.lifeDetailreview(b_id);
	   BoardVO score_vo=LifeDAO.lifeDetailscore(b_id);
	   List<Board_OptionVO> price_vo=LifeDAO.lifeDetailprice(b_id);
	   
	   request.setAttribute("page", page);
	   request.setAttribute("detail_vo", detail_vo);
	   request.setAttribute("board_vo", board_vo);
	   request.setAttribute("review_vo", review_vo);
	   request.setAttribute("score_vo", score_vo);
	   request.setAttribute("price_vo", price_vo);
	   
	   request.setAttribute("main_jsp", "../main/pay/life_detail.jsp");
	   return "../main/main.jsp";
   }
   
}
