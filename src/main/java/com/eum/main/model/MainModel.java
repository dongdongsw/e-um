package com.eum.main.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.main.dao.TalentDAO;
import com.eum.main.vo.BoardVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainModel {
	
	@RequestMapping("main/main.eum")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> hotList=TalentDAO.homeHotContents();
		request.setAttribute("hotList", hotList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}

}
