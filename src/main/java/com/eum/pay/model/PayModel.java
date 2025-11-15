package com.eum.pay.model;

import com.eum.main.vo.BoardVO;
import com.eum.main.vo.OrdersVO;
import com.eum.pay.dao.PayDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PayModel {
	// 주문 상세페이지 데이터 조회
	@RequestMapping("pay/orders.eum")
   public String ordersData(HttpServletRequest request,
		   HttpServletResponse response)
   {
		String b_op_id=request.getParameter("b_op_id");
		HttpSession session = request.getSession();
		
		BoardVO orders_vo=PayDAO.ordersData(Integer.parseInt(b_op_id));
		
		request.setAttribute("orders_vo", orders_vo);
		request.setAttribute("o_u_id", session.getAttribute("id"));
		
		request.setAttribute("main_jsp", "../pay/order_payment.jsp");
		return "../main/main.jsp";
   }
	// orders table insert
	@RequestMapping("pay/orders_insert.eum")
	public void orders_insert(HttpServletRequest request,
			HttpServletResponse response)
	{
		int b_op_id = Integer.parseInt(request.getParameter("b_op_id"));
		String price = request.getParameter("o_total_price");
		String o_u_id = request.getParameter("o_u_id");

		OrdersVO vo = new OrdersVO();
		vo.setB_op_id(b_op_id);
		vo.setO_total_price(Integer.parseInt(price));
		vo.setO_u_id(o_u_id);

		PayDAO.ordersInsert(vo);
		try
		{
			response.setContentType("text/plain;charset=UTF-8");
	        response.getWriter().print("OK");
		}catch(Exception ex){}
	}
}
