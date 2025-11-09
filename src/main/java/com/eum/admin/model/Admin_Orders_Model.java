package com.eum.admin.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Orders_Model {
	// 관리자 주문 리스트
	@RequestMapping("admin/admin_orders_list.eum")
	public String admin_orders_list(HttpServletRequest request, HttpServletResponse response) {
						
		request.setAttribute("admin_main_jsp", "admin_orders_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
		
	// 관리자 파일 관리
	@RequestMapping("admin/admin_file_manager.eum")
	public String admin_file_manager(HttpServletRequest request, HttpServletResponse response) {
						
		request.setAttribute("admin_main_jsp", "admin_file_manager.jsp");
		return "../admin/common/admin_main.jsp";
	}
}
