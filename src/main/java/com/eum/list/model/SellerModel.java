package com.eum.list.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class SellerModel {
	@RequestMapping("seller/join.eum")
	public String seller_join(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../seller/join.jsp");
		return "../main/main.jsp";
	}
}
