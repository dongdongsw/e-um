package com.eum.main.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminModel {
	@RequestMapping("main/admin_dashboard.eum")
	public String admin_dashboard(HttpServletRequest request, HttpServletResponse response) {
		
		
		request.setAttribute("main_jsp", "/admin/sneat/html/index.jsp");
		return "/main/main.jsp";
	}
}
