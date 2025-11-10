package com.eum.admin.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Users_Model {

	// 관리자 사용자 리스트
	@RequestMapping("admin/admin_users_list.eum")
	public String admin_users_list(HttpServletRequest request, HttpServletResponse response) {
				
		request.setAttribute("admin_main_jsp", "admin_users_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
		
	// 관리자 사용자 상세 페이지
	@RequestMapping("admin/admin_users_detail.eum")
	public String admin_users_detail(HttpServletRequest request, HttpServletResponse response) {
			
		request.setAttribute("admin_main_jsp", "admin_users_detail.jsp");
		return "../admin/common/admin_main.jsp";
	}
			
	// 관리자 사용자 상세 페이지 수정
		@RequestMapping("admin/admin_users_modify.eum")
		public String admin_users_modify(HttpServletRequest request, HttpServletResponse response) {
				
			request.setAttribute("admin_main_jsp", "admin_users_modify.jsp");
			return "../admin/common/admin_main.jsp";
		}	
	
}
