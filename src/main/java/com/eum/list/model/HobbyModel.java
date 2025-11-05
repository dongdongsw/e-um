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
	@RequestMapping("main/hobbylist.eum")
	public String hobbylist(HttpServletRequest request, HttpServletResponse response) {
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
		   
		List<ContentVO> list = HobbyDAO.hobbyListData(map);
		int totalpage = HobbyDAO.hobbyTotalPage();
		 
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  
		if(endPage>totalpage)
			endPage=totalpage;

		request.setAttribute("list", list);
		   
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		  
		// 보여주는 화면 
		request.setAttribute("main_jsp", "../main/list/hobbylist.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("main/hobbydetail.eum")
	public String hobbydetail(HttpServletRequest request, HttpServletResponse response) {
		String b_id = request.getParameter("b_id");
		String page = request.getParameter("page");
		
		ContentVO hvo = HobbyDAO.hobbyDetailData(b_id);
		
		request.setAttribute("hvo", hvo);
		request.setAttribute("page", page);
		
		request.setAttribute("main_jsp", "../main/detail/hobbydetail.jsp");
		return "../main/main.jsp";
	}
}