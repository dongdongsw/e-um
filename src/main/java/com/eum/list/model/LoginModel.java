package com.eum.list.model;

import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.eum.users.dao.*;
import com.eum.list.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginModel {
	@RequestMapping("login/idcheck.eum")
	public String users_idcheck(HttpServletRequest request, HttpServletResponse response) {
		return "login/idcheck.jsp";
	}
	
	@RequestMapping("login/idcheck_ok.eum")
	public void users_idcheck_ok(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int count = LoginDAO.usersIdCheck(id);
		try {
			// Ajax로 값 전송
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(count));
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@RequestMapping("main/login.eum")
	public String loginForm(HttpServletRequest request, HttpServletResponse response) {
		return "login/login.jsp";
	}
	
	@RequestMapping("main/login/login.eum")
	public void usersLogin(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		UsersVO vo = LoginDAO.usersLogin(id, pwd);
		System.out.println(id+" "+pwd);
		if(vo.getMsg().equals("OK")) {
			HttpSession session = request.getSession();
			session.setAttribute("id", vo.getU_id());
			session.setAttribute("name", vo.getU_nickname());
			session.setAttribute("loginid", vo.getU_loginid());
			session.setAttribute("gender", vo.getU_gender());
			session.setAttribute("loc", vo.getU_loc());
			session.setAttribute("status", vo.getU_status());
			session.setAttribute("email", vo.getU_email());
			session.setAttribute("role", vo.getU_role());
			session.setAttribute("phone", vo.getU_phone());
		}
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(vo.getMsg());
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@RequestMapping("main/logout.eum")
	public String usersLogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:../main/main.eum";
	}
}
