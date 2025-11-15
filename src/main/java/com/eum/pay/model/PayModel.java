package com.eum.pay.model;

import java.io.PrintWriter;

import com.eum.main.vo.BoardVO;
import com.eum.main.vo.OrdersVO;
import com.eum.main.vo.PaymentVO;
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
			String o_id = PayDAO.ordersInsert(vo);   

			response.getWriter().print(o_id);
		}catch(Exception ex){}
	}
	
	// payment table insert
	@RequestMapping("pay/payment_insert.eum")
	public void payment_insert(HttpServletRequest request,
			HttpServletResponse response)
	{
		try {
	        request.setCharacterEncoding("UTF-8");
	        response.setContentType("text/plain;charset=UTF-8");

	        PrintWriter out = response.getWriter();

	        String b_op_id = request.getParameter("b_op_id");
	        String o_total_price = request.getParameter("o_total_price");

	        String o_id = request.getParameter("o_id");
	        String imp_uid = request.getParameter("imp_uid");
	        String merchant_uid = request.getParameter("merchant_uid");
	        String amount = request.getParameter("amount");
	        String pay_method = request.getParameter("pay_method");
	        String pg_provider = request.getParameter("pg_provider");
	        String receipt_url = request.getParameter("receipt_url");
	        String o_method = request.getParameter("o_method");
	        String status = request.getParameter("status");

	        HttpSession session = request.getSession();
	        String u_id = (String) session.getAttribute("id");

	        if(u_id == null) {
	            out.write("LOGIN_REQUIRED");
	            return;
	        }

	        PaymentVO vo = new PaymentVO();

	        vo.setO_id(o_id);       
	        vo.setO_u_id(u_id);                       
	        vo.setImp_uid(imp_uid);
	        vo.setMerchant_uid(merchant_uid);
	        vo.setAmount(Integer.parseInt(amount));
	        vo.setStatus(status);
	        vo.setPay_method(pay_method);
	        vo.setPg_provider(pg_provider);
	        vo.setReceipt_url(receipt_url);
	        vo.setCanceled_at(null);                  
	        vo.setO_method(o_method);

	        PayDAO.paymentInsert(vo);

	        out.write("OK");

	    } catch(Exception ex) {
	        ex.printStackTrace();
	    }
	}
	@RequestMapping("pay/payment_complete.eum")
	public String pay_complete(HttpServletRequest request,
	          HttpServletResponse response)
	{
	    String o_id = request.getParameter("o_id");
	    String price = request.getParameter("price");
	    
	    PayDAO.updateOrderStatus(o_id);

	    request.setAttribute("o_id", o_id);
	    request.setAttribute("price", price);

	    request.setAttribute("main_jsp", "../pay/payment_complete.jsp");
	    return "../main/main.jsp";
	}
	@RequestMapping("pay/mypage_payment.eum")
	public String mypage_payment(HttpServletRequest request,
			HttpServletResponse response)
	{
		String o_id=request.getParameter("o_id");
		
		BoardVO orders_vo=PayDAO.mypagePayment(o_id);
		
		request.setAttribute("orders_vo", orders_vo);
		
		request.setAttribute("main_jsp", "../pay/my_order.jsp");
		return "../main/main.jsp";
	}
}
