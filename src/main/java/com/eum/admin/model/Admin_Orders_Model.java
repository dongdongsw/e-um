package com.eum.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.admin.dao.Admin_ContentsDAO;
import com.eum.admin.dao.Admin_OrdersDAO;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.OrdersVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Orders_Model {
	
	// 관리자 주문 리스트
	@RequestMapping("admin/admin_orders_list.eum")
	public String admin_orders_list(HttpServletRequest request, HttpServletResponse response) {
						
		String page = request.getParameter("page");
		
		String keyword = request.getParameter("keyword");
		if(page==null) page ="1";
		
		Map map = new HashMap();
		
		int rowSize=11;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", (start-1));
		map.put("rowSize", rowSize);
		List<OrdersVO> orders_list = null;
		int totalpage = 0;
		
		if(keyword==null || keyword.trim().equals("") ) {
			orders_list = Admin_OrdersDAO.ordersListData(map);
			totalpage = Admin_OrdersDAO.ordersTotalPage();
			
		}
		else {
			map.put("keyword", keyword);
			orders_list = Admin_OrdersDAO.ordersSearchListData(map);
			totalpage = Admin_OrdersDAO.ordersSearchTotalPage(keyword);
		}
		
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("orders_list", orders_list);
		
		request.setAttribute("keyword", keyword);
		
		request.setAttribute("admin_main_jsp", "../orders/admin_orders_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
	
	// 주문 상태 수정
	@RequestMapping("admin/admin_orders_status.eum")
	public String admin_orders_status(HttpServletRequest request, HttpServletResponse response) {
		
		String page = request.getParameter("page");
		String o_status = request.getParameter("o_status");
		String o_id = request.getParameter("o_id");
		
		Map map = new HashMap();
		map.put("o_id", o_id);
		map.put("o_status", o_status);
		
		Admin_OrdersDAO.ordersStatusUpdate(map);
		
		return "redirect:../admin/admin_orders_list.eum?page="+page;
	}
	
	// 결제 상태 수정
	@RequestMapping("admin/admin_payment_status.eum")
	public String admin_orders_payment(HttpServletRequest request, HttpServletResponse response) {
		
		String page = request.getParameter("page");
		String status = request.getParameter("status");
		String pay_id = request.getParameter("pay_id");
		
		Map map = new HashMap();
		map.put("pay_id", pay_id);
		map.put("status", status);
		
		Admin_OrdersDAO.ordersStatusUpdate(map);
		return "redirect:../admin/admin_orders_list.eum?page="+page;
	}
	
	// 환불 상태 수정
	@RequestMapping("admin/admin_refund_status.eum")
	public String admin_refund_status(HttpServletRequest request, HttpServletResponse response) {
		
		String page = request.getParameter("page");
		String rf_status = request.getParameter("rf_status");
		String rf_id = request.getParameter("rf_id");
		
		Map map = new HashMap();
		map.put("rf_id", rf_id);
		map.put("rf_status", rf_status);
		
		Admin_OrdersDAO.refundStatusUpdate(map);
		return "redirect:../admin/admin_orders_list.eum?page="+page;
	}
	
	// 환불 유저 상태 수정
	@RequestMapping("admin/admin_refund_users_status.eum")
	public String admin_refund_users_status(HttpServletRequest request, HttpServletResponse response) {
		
		String Opage = request.getParameter("Opage");
		String u_id = request.getParameter("u_id");
		String rf_status = request.getParameter("rf_status");
		String rf_id = request.getParameter("rf_id");
		
		Map map = new HashMap();
		map.put("rf_id", rf_id);
		map.put("rf_status", rf_status);
		
		Admin_OrdersDAO.refundStatusUpdate(map);
		return "redirect:../admin/admin_users_detail.eum?Opage="+Opage+"&u_id="+u_id+"#contact";
	}
	
	// 환불 판매자 상태 수정
	@RequestMapping("admin/admin_refund_sellers_status.eum")
	public String admin_refund_sellers_status(HttpServletRequest request, HttpServletResponse response) {
		
		String Opage = request.getParameter("Opage");
		String u_s_id = request.getParameter("u_s_id");
		String rf_status = request.getParameter("rf_status");
		String rf_id = request.getParameter("rf_id");
		
		Map map = new HashMap();
		map.put("rf_id", rf_id);
		map.put("rf_status", rf_status);
		
		Admin_OrdersDAO.refundStatusUpdate(map);
		return "redirect:../admin/admin_seller_detail.eum?Opage="+Opage+"&u_s_id="+u_s_id+"#contact";
	}
	
}
