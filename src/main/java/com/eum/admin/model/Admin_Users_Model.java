package com.eum.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.admin.dao.Admin_UsersDAO;
import com.eum.main.vo.ReviewVO;
import com.eum.main.vo.UsersVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Users_Model {

	// 관리자 사용자 리스트
	@RequestMapping("admin/admin_users_list.eum")
	public String admin_users_list(HttpServletRequest request, HttpServletResponse response) {
		
		String page = request.getParameter("page");
		if(page==null) page ="1";
		Map map = new HashMap();
		int rowSize=8;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		List<UsersVO> users_list = Admin_UsersDAO.usersListData(map);
		int totalpage = Admin_UsersDAO.usersListTotalData();
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("users_list", users_list);
		
		request.setAttribute("admin_main_jsp", "../users/admin_users_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
		
	// 관리자 사용자 상세 페이지&리뷰 리스트
	@RequestMapping("admin/admin_users_detail.eum")
	public String admin_users_detail(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");	
		String u_id = request.getParameter("u_id");
		Map map = new HashMap();
		if(page==null) {
			page="1";
		}
		int rowSize=9;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		map.put("u_id", u_id);
		UsersVO users_vo = Admin_UsersDAO.usersDetailData(u_id);
		List<ReviewVO> review_list = Admin_UsersDAO.usersReviewListData(map);
		int totalpage = Admin_UsersDAO.usersReviewListTotalData(u_id);
		final int BLOCK = 10; 
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("review_list", review_list);
		request.setAttribute("users_vo", users_vo);
		request.setAttribute("admin_main_jsp", "../users/admin_users_detail.jsp");
		return "../admin/common/admin_main.jsp";
	}
			
	// 관리자 사용자 상세 페이지 수정
	@RequestMapping("admin/admin_users_status.eum")
	public String admin_users_status(HttpServletRequest request, HttpServletResponse response) {

		String u_id = request.getParameter("u_id");
		String u_status = request.getParameter("status");
		
		
		Map map = new HashMap();
		map.put("u_id", u_id);
		map.put("u_status", u_status);	
	
		Admin_UsersDAO.usersStatusUpdate(map);
		
		
		return "redirect:../admin/admin_users_detail.eum?u_id="+u_id;
	}	
	
	
}
