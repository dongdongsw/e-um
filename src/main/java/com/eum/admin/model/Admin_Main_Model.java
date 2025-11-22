package com.eum.admin.model;

import java.util.List;
import java.util.Map;

import com.eum.admin.dao.Admin_MainDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Main_Model {
	
	// 관리자 메인 대시보드
	@RequestMapping("admin/admin_main.eum")
	public String admin_main(HttpServletRequest request, HttpServletResponse response) {
		
		int userTotal = Admin_MainDAO.userTotalCount();
		int sellerTotal = Admin_MainDAO.sellerTotalCount();
		int contentsTotal = Admin_MainDAO.contentsTotalCount();
		int reviewTotal = Admin_MainDAO.reviewTotalCount();
		Double sellerRegTotal = Admin_MainDAO.sellerRegistPercentage();
		int sellerNew = Admin_MainDAO.sellerNewRegist();
		Double sellerGrowth = Admin_MainDAO.sellerNewRegistGrowth();
		int refundAmount = Admin_MainDAO.refundTotalAmount();
		int refundNew = Admin_MainDAO.refundNewApply();
		int refundReceiveTotal = Admin_MainDAO.refundReceiveTotalApply();
		int refundTotal = Admin_MainDAO.refundTotalCount();
		int refundCompleteTotal = Admin_MainDAO.refundCompleteTotalCount();
		List<Map<String,Object>> usersGraph = Admin_MainDAO.usersGraphMonth();
		Map<String, Object> categoryCount = Admin_MainDAO.categoryTotalCount();
		
		request.setAttribute("userTotal", userTotal);
		request.setAttribute("sellerTotal", sellerTotal);
		request.setAttribute("contentsTotal", contentsTotal);
		request.setAttribute("reviewTotal", reviewTotal);
		request.setAttribute("sellerRegTotal", sellerRegTotal);
		request.setAttribute("sellerNew", sellerNew);
		request.setAttribute("sellerGrowth", sellerGrowth);
		request.setAttribute("refundAmount", refundAmount);
		request.setAttribute("refundNew", refundNew);
		request.setAttribute("refundReceiveTotal", refundReceiveTotal);
		request.setAttribute("refundTotal", refundTotal);
		request.setAttribute("refundCompleteTotal", refundCompleteTotal);
		request.setAttribute("usersGraph", usersGraph);
		request.setAttribute("categoryCount", categoryCount);
		
		request.setAttribute("admin_main_jsp", "admin_dashboard.jsp");
		return "../admin/common/admin_main.jsp";
	}
}
