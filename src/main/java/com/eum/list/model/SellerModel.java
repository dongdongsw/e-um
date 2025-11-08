package com.eum.list.model;

import java.io.PrintWriter;

import com.eum.seller.dao.SellerDAO;
import com.eum.seller.vo.SellerVO;
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
		
		String u_s_carrer=request.getParameter("carrer");
		String loc_do=request.getParameter("loc_do");
		String loc_si=request.getParameter("loc_si");
		String u_s_biz_no=request.getParameter("biz_no");
		String u_s_com=request.getParameter("seller_name");
		String u_s_profileimg_url=request.getParameter("profile_img");
		
		String u_id="16";
		int u_s_id=4063; 
		
		SellerVO vo=new SellerVO();
		
		vo.setU_s_id(u_s_id);
		vo.setU_id(u_id);
		vo.setU_s_carrer(u_s_carrer);
		vo.setU_s_zone(loc_do+" "+loc_si);
		vo.setU_s_biz_no(u_s_biz_no);
		vo.setU_s_com(u_s_com);
		vo.setU_s_profileimg_url(u_s_profileimg_url);
		
		SellerDAO.sellerInsert(vo);
		
		return "redirect:../main/main.eum";
	}
}
