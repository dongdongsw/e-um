package com.eum.admin.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Main_Model {
	
	// 관리자 메인 대시보드
	@RequestMapping("admin/admin_main.eum")
	public String admin_main(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("admin_main_jsp", "admin_dashboard.jsp");
		return "../admin/common/admin_main.jsp";
	}
	
	
		
	
	
}
