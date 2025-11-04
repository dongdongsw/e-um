package com.eum.main.model;

import java.net.http.HttpRequest;
import java.util.List;

import com.eum.list.dao.ContentDAO;
import com.eum.list.vo.ContentVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainModel {
	
	@RequestMapping("main/main.eum")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	

	
	@RequestMapping("main/detail.eum")
	public String main_detail(HttpServletRequest request, HttpServletResponse response) {
			request.setAttribute("main_jsp", "../main/detail.jsp");
			return "../main/main.jsp";
	}
	
}
