package com.eum.main.model;

import java.io.PrintWriter;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Board_OptionVO;
import com.eum.main.vo.ReviewVO;
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
	   String page=request.getParameter("page");
	   
	   BoardVO detail_vo=TalentDAO.talentDetailData(b_id);
	   BoardVO board_vo=TalentDAO.talentDetailboard(b_id);
	   List<BoardVO> review_vo=TalentDAO.talentDetailreview(b_id);
	   BoardVO score_vo=TalentDAO.talentDetailscore(b_id);
	   List<Board_OptionVO> price_vo=TalentDAO.talentDetailprice(b_id);
	   
	   request.setAttribute("page", page);
	   request.setAttribute("detail_vo", detail_vo);
	   request.setAttribute("board_vo", board_vo);
	   request.setAttribute("review_vo", review_vo);
	   request.setAttribute("score_vo", score_vo);
	   request.setAttribute("price_vo", price_vo);
	   
	   request.setAttribute("main_jsp", "../talent/detail.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("talent/find_ajax.eum")
   public void talent_find_ajax(HttpServletRequest request, HttpServletResponse response)
   {
       try
       {
           String page=request.getParameter("page");
           if(page == null) page = "1";
           int curpage=Integer.parseInt(page);

           String keyword=request.getParameter("keyword");
           String b_type=request.getParameter("b_type");
           String fd=request.getParameter("fd");

           if(keyword == null) keyword = "";
           if(b_type == null) b_type = "";
           if(fd == null) fd = "";

           int rowSize = 12;
           int start = (curpage-1)*rowSize + 1;
           int end = curpage*rowSize;

           Map map=new HashMap();
           map.put("start", start);
           map.put("end", end);
           map.put("keyword", keyword);
           map.put("b_type", b_type);
           map.put("fd", fd);

           List<BoardVO> list = TalentDAO.talentFindData(map);
           int count = TalentDAO.talentFindCount(map);

           final int BLOCK = 10;
           int totalpage = (int)(Math.ceil(count/12.0));
           int startpage = ((curpage-1)/BLOCK * BLOCK) + 1;
           int endpage = startpage + BLOCK - 1;

           if(endpage > totalpage)
              endpage = totalpage;

           JSONArray arr = new JSONArray();
           int i = 0;

           for(BoardVO vo : list)
           {
               JSONObject obj = new JSONObject();
               obj.put("b_id", vo.getB_id());
               obj.put("b_title", vo.getB_title());
               obj.put("b_thumbnail", vo.getB_thumbnail());
               obj.put("b_review_score", vo.getRvo().getB_review_score());
               obj.put("review_count", vo.getRvo().getReview_count());
               obj.put("b_op_price", vo.getBovo().getB_op_price());
               obj.put("u_s_com", vo.getUsvo().getU_s_com());
               obj.put("b_type", vo.getB_type());
               obj.put("b_view_count", vo.getB_view_count());

               if(i == 0)
               {
                   obj.put("curpage", curpage);
                   obj.put("totalpage", totalpage);
                   obj.put("startpage", startpage);
                   obj.put("endpage", endpage);
                   obj.put("count", count);
               }
               arr.add(obj);
               i++;
           }

           // ❗ 여기서 응답을 단 한 번만 출력해야 함
           response.setContentType("text/plain;charset=UTF-8");
           PrintWriter out = response.getWriter();
           out.write(arr.toJSONString());

       } catch(Exception ex)
       {
           ex.printStackTrace();
       }
   }

}
