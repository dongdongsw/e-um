package com.eum.users.model;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.eum.users.dao.*;
import com.eum.main.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@Controller
@jakarta.servlet.annotation.MultipartConfig(
		fileSizeThreshold = 1024*1024,
		maxFileSize = 5*1024*1024L,
		maxRequestSize = 20*1024*1024L
)
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
			session.setAttribute("push_noti", vo.getU_push_noti());
			session.setAttribute("email_noti", vo.getU_email_noti());
			session.setAttribute("sms_noti", vo.getU_sms_noti());
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
	
	// 정보수정 폼
	@RequestMapping("users/info_update.eum")
	public String users_info_updateForm(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../users/info_update.jsp");
		return "../main/main.jsp";
	}
		
	// 정보수정 처리
	@RequestMapping("users/update_ok.eum")
	public String users_info_update(HttpServletRequest request, HttpServletResponse response) {
		String pwd=request.getParameter("pwd");
		String nickname=request.getParameter("nickname");
		String phone=request.getParameter("phone");
		String loc=request.getParameter("loc");
		String push_noti=request.getParameter("push_noti");
		String email_noti=request.getParameter("email_noti");
		String sms_noti=request.getParameter("sms_noti");
		
		HttpSession session = request.getSession();
		String loginid = (String)session.getAttribute("loginid");
		if (loginid == null) {
	        request.setAttribute("msg", "로그인을 다시 진행해주세요.");
	        request.setAttribute("url", "../users/login.eum");
	        return "../commons/alert.jsp"; 
	    }
		
		UsersVO uvo = UsersDAO.usersInfoUpdateData(loginid);
		String cPhone = uvo.getU_phone();
		String cPwd = uvo.getU_pwd();
		
		if (!phone.equals(cPhone) && UsersDAO.usersPhoneCheck(phone.trim())==1) {
	        request.setAttribute("msg", "이미 가입된 전화번호입니다.");
			return "redirect:../users/info_update.eum";
		}
		
		UsersVO uvo2=new UsersVO();
		uvo2.setU_loginid(loginid);
		
		if (pwd != null && !pwd.trim().isEmpty()) {
			uvo2.setU_pwd(pwd); 
	    } else {
	    	uvo2.setU_pwd(cPwd); 
	    }
		
		uvo2.setU_nickname(nickname);
		uvo2.setU_phone(phone);
		uvo2.setU_loc(loc);
	    
		uvo2.setU_push_noti(push_noti==null ? "N" : "Y");
		uvo2.setU_email_noti(email_noti==null ? "N" : "Y");
		uvo2.setU_sms_noti(sms_noti==null ? "N" : "Y");
	    
		UsersDAO.usersInfoUpdate(uvo2);
		
		session.setAttribute("name", nickname);
	    session.setAttribute("phone", phone);
	    session.setAttribute("loc", loc);
	    session.setAttribute("push_noti", uvo2.getU_push_noti());
		session.setAttribute("email_noti", uvo2.getU_email_noti());
		session.setAttribute("sms_noti", uvo2.getU_sms_noti());
	    
		return "redirect:../users/info.eum";
    }
	
	// 프로필 이미지 업로드
	@RequestMapping("users/profile_upload.eum")
	public String users_profile_upload(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String loginid = (String)session.getAttribute("loginid");
		
		if(loginid==null) {
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "../users/login.eum");
			return "../commons/alert.jsp";
		}
		
		String uploadDir = "/upload/profile";
		String path = request.getServletContext().getRealPath(uploadDir);
		
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String newFilePath = null;
		
		try {
			Part filePart = request.getPart("profile_img");
			String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			
			if(filePart.getSize() > 0 && originalFileName != null && !originalFileName.isEmpty()) {
				String oldProFileUrl = (String)session.getAttribute("profile");
				
				String uniqueFileName = System.currentTimeMillis() + "-" + originalFileName;
				Path filePath = Paths.get(path, uniqueFileName);
				try(InputStream input = filePart.getInputStream()) {
					Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
				}
				newFilePath = request.getContextPath() + uploadDir + "/" + uniqueFileName;
				
				UsersVO vo = new UsersVO();
				vo.setU_loginid(loginid);
				vo.setU_profileimg_url(newFilePath);
				UsersDAO.profileImgUpload(vo);
				
				if(oldProFileUrl != null && !oldProFileUrl.contains("profile.jpg")) {
					try {
						String oldFileName = oldProFileUrl.substring(oldProFileUrl.lastIndexOf("/")+1);
						File oldFile = new File(path + File.separator + oldFileName);
						if(oldFile.exists()) {
							oldFile.delete();
						}
					} catch(Exception ignore) {
					}
				}
				session.setAttribute("profile", newFilePath);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			request.setAttribute("msg", "파일 업로드 처리 중 오류가 발생했습니다.");
			request.setAttribute("url", "../users/info.eum");
			return "../commons/alert.jsp";
		}
		return "redirect:../users/info.eum";
	}
	
	// 아이디 / 비밀번호 찾기 폼 이동
	@RequestMapping("users/fine_me.eum")
	public String users_fine_me(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../users/find_me.jsp");
		return "../main/main.jsp";
	}
	
	// 아이디 찾기
	@RequestMapping("users/find_id.eum")
	public void users_find_id(HttpServletRequest request, HttpServletResponse response) {
		String iEmail = request.getParameter("iEmail");
		String iPhone = request.getParameter("iPhone");
		
		String fLoginId = null;
		
		UsersVO vo = new UsersVO();
		vo.setU_email(iEmail);
		vo.setU_phone(iPhone);
		
		fLoginId = UsersDAO.findMyId(vo);
		
		if(fLoginId!=null) {
			vo.setMsg("OK");
			vo.setU_loginid(fLoginId);
		} else {
			vo.setMsg("NOID");
		}
		
		String responseMsg;
		
		if(vo.getMsg().equals("OK")) {
			responseMsg = vo.getMsg()+":"+vo.getU_loginid();
		} else {
			responseMsg = vo.getMsg();
		}
		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(responseMsg);
			out.flush();
			out.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 비밀번호 찾기
	@RequestMapping("users/find_pwd.eum")
	public void users_find_pwd(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain;charset=UTF-8");
			
			String iLoginId = request.getParameter("iLoginId");
			String iEmail = request.getParameter("iEmail");

			UsersVO vo = new UsersVO();
			vo.setU_loginid(iLoginId);
			vo.setU_email(iEmail);
			
			String fU_id = UsersDAO.findMyPwd(vo);
			
			if(fU_id!=null) {
				response.getWriter().write("OK:"+fU_id);
			} else {
				response.getWriter().write("NOID");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 비밀번호 재설정 처리
	@RequestMapping("users/pwd_change.eum")
	public void pwdChange(HttpServletRequest request, HttpServletResponse response) {
		String newPwd = request.getParameter("pwd");
		String uid = request.getParameter("u_id");
		
		UsersVO vo = new UsersVO();
		vo.setU_id(uid);
		vo.setU_pwd(newPwd);
		
		UsersDAO.pwdChange(vo);
		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write("OK");
			out.flush();
			out.close();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// 회원탈퇴
	@RequestMapping("users/delete_ok.eum")
	public String users_info_delete(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("id");

		if(u_id!=null) {
			UsersDAO.users_delete(u_id);
			session.invalidate();
		}
		
		return "redirect:../main/main.eum";
	}
}