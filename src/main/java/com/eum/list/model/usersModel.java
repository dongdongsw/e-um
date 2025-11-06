package com.eum.list.model;

import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.eum.users.dao.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class usersModel {
	
	// 회원가입 페이지
	@RequestMapping("users/join.eum")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../users/join.jsp");
		return "../main/main.jsp";
	}
	
	// 아이디 체크 모달창
	@RequestMapping("users/idcheck.eum")
	public String user_idcheck(HttpServletRequest request, HttpServletResponse response) {
  	   
 	   return "../users/idcheck.jsp";
	}
	
	// 아이디 중복 테크
	@RequestMapping("users/idcheck_ok.eum")
	public void users_idcheck_ok(HttpServletRequest request, HttpServletResponse response) {
		
		String u_loginid=request.getParameter("u_loginid");
		int count=UsersDAO.usersIdCheck(u_loginid);
		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		} catch (Exception ex) {}
	}
	
	// 회원가입
	@RequestMapping("users/join_ok.eum")
	public String users_join_ok(HttpServletRequest request, HttpServletResponse response) {
		
		return "redirect:../main/main.eum";
	}
}
