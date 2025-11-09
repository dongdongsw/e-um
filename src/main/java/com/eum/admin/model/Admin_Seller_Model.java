package com.eum.admin.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Seller_Model {

	// 관리자 셀러 리스트
	@RequestMapping("admin/admin_sellers_list.eum")
	public String admin_sellers_list(HttpServletRequest request, HttpServletResponse response) {
							
				
		request.setAttribute("admin_main_jsp", "admin_sellers_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
			
	// 관리자 셀러 상세 페이지
	@RequestMapping("admin/admin_seller_detail.eum")
	public String admin_seller_detail(HttpServletRequest request, HttpServletResponse response) {
								
	
		request.setAttribute("admin_main_jsp", "admin_seller_detail.jsp");
		return "../admin/common/admin_main.jsp";
	}
			
			
}
