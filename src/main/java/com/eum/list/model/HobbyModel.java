package com.eum.list.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.list.dao.*;
import com.eum.list.vo.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class HobbyModel {
	@RequestMapping("main/exerciselist.eum")
	public String hobbylist(HttpServletRequest request, HttpServletResponse response) {

		// 사용자가 요청 (페이지를 보여달라)
		String page = request.getParameter("page");
		if(page==null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 12;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<ContentVO> list = HobbyDAO.hobbyListData(map);
		
		
		int totalpage = HobbyDAO.hobbyTotalPage();
		
		
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage > totalpage)
			endPage = totalpage;

		
		request.setAttribute("list",list);
		request.setAttribute("curpage",curpage);
		request.setAttribute("totalpage",totalpage);
		request.setAttribute("startPage",startPage);
		request.setAttribute("endPage",endPage);
		
		request.setAttribute("main_jsp", "../main/list/hobbylist.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("main/hobbydetail.eum")
	public String hobbydetail(HttpServletRequest request, HttpServletResponse response) {
		
		String b_id = request.getParameter("b_id");
		String page = request.getParameter("page");
		
		
		ContentVO vo = HobbyDAO.hobbyDetailData(b_id);
		Map map = new HashMap();
		map.put("b_id", b_id);
		
		List<ReviewVO> list = HobbyDAO.hobbyReviewDetailData(map);
		List<Board_OptionVO> list3 = HobbyDAO.hobbyOptionDetailData(map);
		List<Board_ImageVO> list4 = HobbyDAO.hobbyImagaeDetailData(b_id);
		request.setAttribute("page",page);
		request.setAttribute("vo",vo);
		request.setAttribute("list",list);
		request.setAttribute("list3",list3);
		request.setAttribute("list4",list4);
		
		request.setAttribute("main_jsp", "../main/list/exercisedetail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("main/exercisedetail_before.eum")
	public String exercisedetail_before(HttpServletRequest request, HttpServletResponse response) {
		
		String b_id = request.getParameter("b_id");
		String page = request.getParameter("page");
		
		HobbyDAO.hobbyHitIncrement(b_id);
		
		return "redirect:../main/exercisedetail.eum?b_id="+b_id+"&page="+page;
	}
}