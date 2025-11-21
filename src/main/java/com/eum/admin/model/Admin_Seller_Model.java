package com.eum.admin.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.eum.admin.dao.Admin_ReviewDAO;
import com.eum.admin.dao.Admin_SellerDAO;
import com.eum.admin.dao.Admin_UsersDAO;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.OrdersVO;
import com.eum.main.vo.ReviewVO;
import com.eum.main.vo.Review_ImageVO;
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
		String keyword = request.getParameter("keyword");
		if(page==null) page ="1";
		
		Map map = new HashMap();
		
		int rowSize=8;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", (start-1));
		map.put("rowSize", rowSize);
		
		List<Users_SellerVO> sellers_list = null;
		int totalpage = 0;
		
		if(keyword == null || keyword.trim().equals("")) {
			sellers_list = Admin_SellerDAO.sellerListData(map);
			totalpage = Admin_SellerDAO.sellerTotalData();
		}
		else {
			map.put("keyword", keyword);  
			sellers_list = Admin_SellerDAO.sellerSearchListData(map);
			totalpage = Admin_SellerDAO.sellerSearchTotalPage(keyword);
		}
		
		
		
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("sellers_list", sellers_list);
		
		request.setAttribute("keyword", keyword);
		
		request.setAttribute("admin_main_jsp", "../sellers/admin_sellers_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
			
	// 관리자 셀러 상세 페이지
	@RequestMapping("admin/admin_seller_detail.eum")
	public String admin_seller_detail(HttpServletRequest request, HttpServletResponse response) {
								
		String u_s_id = request.getParameter("u_s_id");
		// 컨텐츠 리스트 출력
		String page = request.getParameter("page");
		String Opage = request.getParameter("Opage");
		if(page==null) page ="1";
		if(Opage==null) Opage ="1";
		Users_SellerVO seller_vo = Admin_SellerDAO.sellerDetailData(Integer.parseInt(u_s_id));
		
		int rowSize=3;
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
		
		// 리뷰 리스트 출력
		String page_r = request.getParameter("page_r");
		if(page_r==null) page_r ="1";
				
		int rowSize_r=8;
		int OrowSize=12;
		int curpage_r = Integer.parseInt(page_r);
		int Ocurpage = Integer.parseInt(Opage);
		int start_r = (rowSize_r*curpage_r)-(rowSize_r-1);
		int Ostart = (Ocurpage-1)*OrowSize;
		int end_r = rowSize_r*curpage_r;
		
		Map map_r = new HashMap();
		map_r.put("u_s_id",u_s_id);
		map_r.put("start_r", (start_r-1));
		map_r.put("rowSize_r", rowSize_r);
		
		Map Omap = new HashMap();
		Omap.put("start", Ostart);
		Omap.put("rowSize", OrowSize);
		Omap.put("u_s_id", u_s_id);
		
		List<ReviewVO> review_list = Admin_SellerDAO.sellerReviewListData(map_r); 
		int totalpage_r = Admin_SellerDAO.sellerReviewTotalData(Integer.parseInt(u_s_id));
		
		List<OrdersVO> orders_list = Admin_SellerDAO.ordersSellersListData(Omap);
		int Ototalpage = Admin_SellerDAO.ordersSellersTotalPage(Integer.parseInt(u_s_id));
		
		final int BLOCK_r = 10;
		int startPage_r=((curpage_r-1)/BLOCK_r*BLOCK_r)+1;
		int endPage_r=((curpage_r-1)/BLOCK_r*BLOCK_r)+BLOCK_r;
		if(totalpage_r < endPage_r) endPage_r=totalpage_r;
		
		int OstartPage = ((Ocurpage-1)/BLOCK*BLOCK)+1;
		int OendPage=((Ocurpage-1)/BLOCK*BLOCK)+BLOCK;
		if(Ototalpage < OendPage) OendPage=Ototalpage;
		
		request.setAttribute("startPage_r", startPage_r);
		request.setAttribute("endPage_r", endPage_r);
		request.setAttribute("curpage_r", curpage_r);
		request.setAttribute("totalpage_r", totalpage_r);
		request.setAttribute("review_list", review_list);
		
		
		
		request.setAttribute("orders_list", orders_list);
		request.setAttribute("OstartPage", OstartPage);
		request.setAttribute("OendPage", OendPage);
		request.setAttribute("Ocurpage", Ocurpage);
		request.setAttribute("Ototalpage", Ototalpage);
		
		request.setAttribute("admin_main_jsp", "../sellers/admin_seller_detail.jsp");
		return "../admin/common/admin_main.jsp";
	}
	
	
	// 관리자 셀러 삭제 
	@RequestMapping("admin/admin_seller_delete.eum")
	public String admin_seller_delete(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String u_s_id = request.getParameter("u_s_id");
		String  keyword = request.getParameter("keyword");
		
		Admin_SellerDAO.sellerDel(Integer.parseInt(u_s_id));
		

		return "redirect:admin_sellers_list.eum?page="+page+"&keyword="+keyword;
	}		
}
