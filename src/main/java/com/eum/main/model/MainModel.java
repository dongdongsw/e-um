package com.eum.main.model;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.list.dao.ContentDAO;
import com.eum.list.vo.ContentVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainModel {
	
	@RequestMapping("main/main.eum")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("main/list.eum")
	public String main_list(HttpServletRequest request, HttpServletResponse response) {
		String type=request.getParameter("type");
		String page=request.getParameter("page");
		
		if(page==null)
			page="1";
		if(type==null)
			type="전체";
		
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(curpage-1)*rowSize;
		
		map.put("start", start);
		map.put("type", type);
		
		List<ContentVO> list=ContentDAO.contentListData(map);
		int totalpage=ContentDAO.contentTotalPage(type);
		
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=startPage+BLOCK-1;
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("type", type);
        request.setAttribute("b_id", null);
		
		
		request.setAttribute("main_jsp", "../main/list.jsp");
		return "../main/main.jsp";
}
	
	@RequestMapping("main/detail.eum")
	public String main_detail(HttpServletRequest request, HttpServletResponse response) {
			request.setAttribute("main_jsp", "../main/detail.jsp");
			return "../main/main.jsp";
	}
	
}
