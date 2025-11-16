package com.eum.main.model;

import java.io.PrintWriter;
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
	    try {
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
	 	   
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	   
	   
	   request.setAttribute("main_jsp", "../talent/detail.jsp");
	   return "../main/main.jsp";
   }
   
   @RequestMapping("talent/review.eum")
   public String talent_review(HttpServletRequest request,
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

	   return "../talent/review.jsp";
   }
   // 리뷰 작성
   @RequestMapping("review/insert_ok.eum") 
   public String review_insert(HttpServletRequest request, HttpServletResponse response) {
	   String b_id=null;
	   try {
		   HttpSession session=request.getSession();
		   String u_id=(String)session.getAttribute("id");
		   
		   String u_s_id=request.getParameter("u_s_id");
		   b_id=request.getParameter("b_id");
		   String content=request.getParameter("content");
		   String score=request.getParameter("score");
		   
		   ReviewVO vo=new ReviewVO();
		   
		   vo.setU_id(u_id);
		   vo.setU_s_id(Integer.parseInt(u_s_id));
		   vo.setB_id(b_id);
		   vo.setB_review_content(content);
		   vo.setB_review_score(Double.parseDouble(score));
		   
		   TalentDAO.reviewInsert(vo);
		   
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   
	   return "redirect:../talent/detail.eum?b_id="+b_id;
   }
   
   // 답글 작성
   @RequestMapping("reply/insert_ok.eum") 
   public String reply_insert(HttpServletRequest request, HttpServletResponse response) {
	   String b_id=null;
	   try {
		   HttpSession session=request.getSession();
		   String u_id=(String)session.getAttribute("id");
		   
		   String u_s_id=request.getParameter("u_s_id");
		   b_id=request.getParameter("b_id");
		   String content=request.getParameter("content");
		   String group_id=request.getParameter("group_id");
		   
		   ReviewVO vo=new ReviewVO();
		   
		   vo.setU_id(u_id);
		   vo.setU_s_id(Integer.parseInt(u_s_id));
		   vo.setB_id(b_id);
		   vo.setB_review_content(content);
		   vo.setGroup_id(group_id);
		   
		   TalentDAO.replyInsert(vo);
		   
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   
	   return "redirect:../talent/detail.eum?b_id="+b_id;
   }
   
   // 리뷰 수정
   @RequestMapping("review/update_ok.eum")
   public void review_udpate_ok(HttpServletRequest request, HttpServletResponse response) {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String rid=request.getParameter("rid");
	   String score=request.getParameter("score");
	   String content=request.getParameter("content");
	   
	   ReviewVO vo=new ReviewVO();
	   
	   vo.setB_review_id(rid);
	   vo.setB_review_score(Double.parseDouble(score));
	   vo.setB_review_content(content);
	   
	   String res=TalentDAO.reviewUpdate(vo);
	   
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(res); 
	   }catch(Exception ex) {}
   }
   
   // 답변 수정
   @RequestMapping("reply/update_ok.eum")
   public void reply_udpate_ok(HttpServletRequest request, HttpServletResponse response) {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String rid=request.getParameter("rid");
	   String score=request.getParameter("score");
	   String content=request.getParameter("content");
	   
	   ReviewVO vo=new ReviewVO();
	   
	   vo.setB_review_id(rid);
	   vo.setB_review_content(content);
	   
	   String res=TalentDAO.replyUpdate(vo);
	   
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(res); 
	   }catch(Exception ex) {}
   }
   
   // 답변 삭제
   @RequestMapping("reply/delete_ok.eum")
   public void reply_delete_ok(HttpServletRequest request, HttpServletResponse response) {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String rid=request.getParameter("rid");
	   
	   String res=TalentDAO.replyDelete(Integer.parseInt(rid));
	   
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(res); 
	   }catch(Exception ex) {}
   }
   
   // 리뷰 삭제
   @RequestMapping("review/delete_ok.eum")
   public void rreview_delete_ok(HttpServletRequest request, HttpServletResponse response) {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String rid=request.getParameter("rid");
	   
	   String res=TalentDAO.reviewDelete(Integer.parseInt(rid));
	   
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(res); 
	   }catch(Exception ex) {}
   }
   
}

