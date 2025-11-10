package com.eum.admin.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Contents_Model {

	// 관리자 컨텐츠 리스트
	@RequestMapping("admin/admin_contents_list.eum")
	public String admin_contents_list(HttpServletRequest request, HttpServletResponse response) {
								
		request.setAttribute("admin_main_jsp", "admin_contents_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
				
	// 관리자 컨텐츠 리스트
	@RequestMapping("admin/admin_contents_detail.eum")
	public String admin_contents_detail(HttpServletRequest request, HttpServletResponse response) {
									
		request.setAttribute("admin_main_jsp", "admin_contents_detail.jsp");
		return "../admin/common/admin_main.jsp";
	}
				
				
}
