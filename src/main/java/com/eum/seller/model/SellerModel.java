package com.eum.seller.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import com.eum.seller.dao.SellerDAO;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Users_SellerVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class SellerModel {
	@RequestMapping("seller/join.eum")
	public String seller_join(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../seller/join.jsp");
		return "../main/main.jsp";
	}
	
	//셀러 이름 존재 여부
	@RequestMapping("seller/seller_name_ok.eum") 
	public void seller_name_ok(HttpServletRequest request, HttpServletResponse response) {
		
		String u_s_com=request.getParameter("u_s_com");

		int count=SellerDAO.sellerNameCheck(u_s_com);
		
		try {
			response.setContentType("text/plain;charset-UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		} catch (Exception ex) {}
	}
	
	// 셀러 가입
	@RequestMapping("seller/seller_join_ok.eum")
	public String seller_join_ok(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		String u_id=(String) session.getAttribute("id");
		
		String u_s_carrer=request.getParameter("carrer");
		String loc_do=request.getParameter("loc_do");
		String loc_si=request.getParameter("loc_si");
		String u_s_biz_no=request.getParameter("biz_no");
		String u_s_com=request.getParameter("seller_name");
		String u_s_profileimg_url=request.getParameter("profile_img");
		
		Users_SellerVO vo=new Users_SellerVO();
		
		vo.setU_id(u_id);
		vo.setU_s_carrer(u_s_carrer);
		vo.setU_s_zone(loc_do+" "+loc_si);
		vo.setU_s_biz_no(u_s_biz_no);
		vo.setU_s_com(u_s_com);
		vo.setU_s_profileimg_url(u_s_profileimg_url);
		
		SellerDAO.sellerInsert(vo);
		
		return "redirect:../main/main.eum";
	}
	
	// 셀러 정보 (셀러 페이지)
	@RequestMapping("seller/info.eum")
	public String seller_info(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		int u_s_id=(int) session.getAttribute("u_s_id");
		
		Users_SellerVO vo=SellerDAO.sellerInfo(u_s_id);
		
		request.setAttribute("vo", vo);
		
		request.setAttribute("main_jsp", "../seller/info.jsp");
		return "../main/main.jsp";
	}
	
	// 셀러 정보 수정 (셀러 페이지)
	@RequestMapping("seller/info_update.eum")
	public String seller_info_update(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		int u_s_id=(int) session.getAttribute("u_s_id");
		
		Users_SellerVO vo=SellerDAO.sellerInfo(u_s_id);
		
		request.setAttribute("vo", vo);
		
		String loc_do=null;
		String loc_si=null;
		
		try {
			StringTokenizer zone=new StringTokenizer(vo.getU_s_zone(), " ");
			loc_do=zone.nextToken();
			loc_si=zone.nextToken();
		} catch (Exception ex) {
			StringTokenizer zone=new StringTokenizer(vo.getU_s_zone(), "-");
			loc_do=zone.nextToken();
			loc_si=zone.nextToken();
		}
		
		request.setAttribute("loc_do", loc_do);
		request.setAttribute("loc_si", loc_si);
		
		request.setAttribute("main_jsp", "../seller/info_update.jsp");
		return "../main/main.jsp";
	}
	
	// 셀러 정보 수정 완료
	@RequestMapping("seller/info_update_ok.eum")
	public String seller_update_ok(HttpServletRequest request, HttpServletResponse response) {
		
		String u_s_carrer=request.getParameter("carrer");
		String loc_do=request.getParameter("loc_do");
		String loc_si=request.getParameter("loc_si");
		String u_s_biz_no=request.getParameter("biz_no");
		String u_s_com=request.getParameter("seller_name");
		String u_s_profileimg_url=request.getParameter("profile_img_url");
		
		Users_SellerVO vo=new Users_SellerVO();

		vo.setU_s_id(0);
		vo.setU_s_carrer(u_s_carrer);
		vo.setU_s_zone(loc_do+" "+loc_si);
		vo.setU_s_biz_no(u_s_biz_no);
		vo.setU_s_com(u_s_com);
		vo.setU_s_profileimg_url(u_s_profileimg_url);
		
		SellerDAO.sellerInfoUpdate(vo);
		 
		return "redirect:../seller/info.eum";
	}
	
	// 내 컨텐츠 목록 (셀러 페이지)
	@RequestMapping("seller/my_contents.eum")
	public String seller_my_contents(HttpServletRequest request, HttpServletResponse response) {
		
		List<BoardVO> list=new ArrayList<BoardVO>();
		
		HttpSession session=request.getSession();
		int u_s_id=(int) session.getAttribute("u_s_id");
		
		list=SellerDAO.myContents(u_s_id);
		
		request.setAttribute("list", list);
				
		request.setAttribute("main_jsp", "../seller/my_contents.jsp");
		return "../main/main.jsp";
	}
}
