package com.eum.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.admin.dao.Admin_ContentsDAO;
import com.eum.admin.dao.Admin_SellerDAO;
import com.eum.main.vo.ContentVO;
import com.eum.main.vo.UsersVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Contents_Model {

	// 관리자 컨텐츠 리스트
	@RequestMapping("admin/admin_contents_list.eum")
	public String admin_contents_list(HttpServletRequest request, HttpServletResponse response) {
					
		String page = request.getParameter("page");
		if(page==null) page ="1";
		
		Map map = new HashMap();
		
		int rowSize=8;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", (start-1));
		map.put("rowSize", rowSize);
		
		List<ContentVO> contents_list = Admin_ContentsDAO.contentsListData(map);
		int totalpage = Admin_ContentsDAO.contentsTotalData();
		
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("contents_list", contents_list);
		
		request.setAttribute("admin_main_jsp", "../contents/admin_contents_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
				
	// 관리자 컨텐츠 리스트
	@RequestMapping("admin/admin_contents_detail.eum")
	public String admin_contents_detail(HttpServletRequest request, HttpServletResponse response) {
									
		request.setAttribute("admin_main_jsp", "../contents/admin_contents_detail.jsp");
		return "../admin/common/admin_main.jsp";
	}
				
				
}
