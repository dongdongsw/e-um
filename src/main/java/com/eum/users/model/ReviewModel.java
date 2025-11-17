package com.eum.users.model;

import java.util.List;

import com.eum.main.vo.ReviewVO;
import com.eum.users.dao.ReviewDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewModel {
	@RequestMapping("users/review_list.eum")
	public String review_list(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("id");
		
		if(u_id!=null) {
			List<ReviewVO> reList = ReviewDAO.reviewListData(u_id);
			request.setAttribute("reList", reList);
		}
		request.setAttribute("main_jsp", "../users/review_list.jsp");
		return "../main/main.jsp";
	}
	
}
