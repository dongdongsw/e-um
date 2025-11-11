package com.eum.users.model;

import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.eum.users.dao.*;
import com.eum.main.vo.UsersVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
public class UsersModel {
	
	// 회원가입 페이지
	@RequestMapping("users/join.eum")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../users/join.jsp");
		return "../main/main.jsp";
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

	// 닉네임 중복 체크
	@RequestMapping("users/nickcheck_ok.eum")
	public void users_nickcheck_ok(HttpServletRequest request, HttpServletResponse response) {
			
		String u_nickname=request.getParameter("u_nickname");
		int count=UsersDAO.usersNickCheck(u_nickname);
		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		} catch (Exception ex) {}
	}
	
	// 회원가입
	@RequestMapping("users/join_ok.eum")
	public String users_join_ok(HttpServletRequest request, HttpServletResponse response) {
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String nickname=request.getParameter("nickname");
		String phone=request.getParameter("phone");
		String gender=request.getParameter("gender");
		String birth=request.getParameter("birth");
		String email=request.getParameter("email");
		String loc=request.getParameter("loc");
		String loc_do=request.getParameter("loc_do");
		String push_noti=request.getParameter("push_noti");
		String email_noti=request.getParameter("email_noti");
		String sms_noti=request.getParameter("sms_noti");
		
		// 체크박스 기본값
		if (push_noti == null)  push_noti  = "N";
		if (email_noti == null) email_noti = "N";
		if (sms_noti == null)   sms_noti   = "N";
		
		// 이미 등록된 이메일인 경우
		if(UsersDAO.usersEmailCheck(email.trim().toLowerCase())==1) {
			
			request.setAttribute("msg", "이미 가입된 이메일입니다. 로그인 페이지로 이동합니다.");
			request.setAttribute("url", "../main/main.eum");
			
			return "../commons/alert.jsp";
		}
		// 이미 등록된 전화번호인 경우
		if(UsersDAO.usersPhoneCheck(phone.trim())==1) {
		   
			request.setAttribute("msg", "이미 가입된 전화번호입니다. 로그인 페이지로 이동합니다.");
			request.setAttribute("url", "../main/main.eum");
			
			return "../commons/alert.jsp";
		}
		
		UsersVO vo=new UsersVO();
		vo.setU_loginid(id);
		vo.setU_pwd(pwd);
		vo.setU_nickname(nickname);
		vo.setU_email(email);
		vo.setU_phone(phone);
		vo.setU_gender(gender);
		vo.setBirth(birth);
		vo.setU_loc(loc);
		vo.setU_push_noti(push_noti);
		vo.setU_email_noti(email_noti);
		vo.setU_sms_noti(sms_noti);
		
		UsersDAO.usersInsert(vo);
		
		return "redirect:../main/main.eum";
	}
	
	// 로그인 폼
	@RequestMapping("users/login.eum")
	public String loginForm(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../users/login.jsp");
		return "../main/main.jsp";
	}
	
	// 로그인 처리
	@RequestMapping("users/login_ok.eum")
	public void usersLogin(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		UsersVO vo = UsersDAO.usersLogin(id, pwd);
		
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
			session.setAttribute("createat", vo.getCreateat());
			session.setAttribute("profile", vo.getU_profileimg_url());
			session.setAttribute("sid", vo.getSid());
			
		}
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(vo.getMsg());
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 로그아웃
	@RequestMapping("users/logout.eum")
	public String usersLogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:../main/main.eum";
	}
	
	// 마이페이지
	@RequestMapping("users/info.eum")
	public String users_info(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../users/info.jsp");
		return "../main/main.jsp";
	}
}