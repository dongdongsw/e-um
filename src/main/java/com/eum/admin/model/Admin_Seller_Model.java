package com.eum.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.admin.dao.Admin_SellerDAO;
import com.eum.admin.dao.Admin_UsersDAO;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.ReviewVO;
import com.eum.main.vo.UsersVO;
import com.eum.main.vo.Users_SellerVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Seller_Model {

	// 관리자 셀러 리스트
	@RequestMapping("admin/admin_sellers_list.eum")
	public String admin_sellers_list(HttpServletRequest request, HttpServletResponse response) {
							
		String page = request.getParameter("page");
		if(page==null) page ="1";
		
		Map map = new HashMap();
		
		int rowSize=8;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", (start-1));
		map.put("rowSize", rowSize);
		
		List<UsersVO> sellers_list = Admin_SellerDAO.sellerListData(map);
		int totalpage = Admin_SellerDAO.sellerTotalData();
		
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("sellers_list", sellers_list);
		
		request.setAttribute("admin_main_jsp", "../sellers/admin_sellers_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
			
	// 관리자 셀러 상세 페이지
	@RequestMapping("admin/admin_seller_detail.eum")
	public String admin_seller_detail(HttpServletRequest request, HttpServletResponse response) {
								
		String u_s_id = request.getParameter("u_s_id");
		String page = request.getParameter("page");
		if(page==null) page ="1";
		
		Users_SellerVO seller_vo = Admin_SellerDAO.sellerDetailData(Integer.parseInt(u_s_id));
		
		int rowSize=4;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		Map map = new HashMap();
		map.put("u_s_id",u_s_id);
		map.put("start", (start-1));
		map.put("rowSize", rowSize);
		List<BoardVO> board_list = Admin_SellerDAO.sellerContentsListData(map); 
		int totalpage = Admin_SellerDAO.sellerContentsTotalData(Integer.parseInt(u_s_id));
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("board_list", board_list);
		request.setAttribute("seller_vo", seller_vo);
		request.setAttribute("admin_main_jsp", "../sellers/admin_seller_detail.jsp");
		return "../admin/common/admin_main.jsp";
	}
			
	// 관리자 셀러 수정 페이지
	@RequestMapping("admin/admin_seller_modify.eum")
	public String admin_seller_modify(HttpServletRequest request, HttpServletResponse response) {
									
		
		request.setAttribute("admin_main_jsp", "../sellers/admin_seller_modify.jsp");
		return "../admin/common/admin_main.jsp";
	}		
}
