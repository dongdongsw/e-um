package com.eum.pay.model;

import com.eum.main.vo.BoardVO;
import com.eum.pay.dao.PayDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class PayModel {
	@RequestMapping("pay/orders.eum")
   public String ordersData(HttpServletRequest request,
		   HttpServletResponse response)
   {
		String b_op_id=request.getParameter("b_op_id");
		
		BoardVO orders_vo=PayDAO.ordersData(Integer.parseInt(b_op_id));
		
		request.setAttribute("orders_vo", orders_vo);
		
		request.setAttribute("main_jsp", "../pay/order_payment.jsp");
		return "../main/main.jsp";
   }
}
