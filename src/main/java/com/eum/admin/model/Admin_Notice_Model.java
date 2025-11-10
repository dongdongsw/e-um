package com.eum.admin.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Notice_Model {
	// 관리자 공지사항 리스트
	@RequestMapping("admin/admin_notice_list.eum")
	public String admin_notice_list(HttpServletRequest request, HttpServletResponse response) {
					
		request.setAttribute("admin_main_jsp", "admin_notice_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
	
	
}
