package com.eum.main.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.eum.main.vo.*;
import java.util.*;
import com.eum.main.dao.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainModel {
	
	@RequestMapping("main/main.eum")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		List<BoardVO> hotList=ContentDAO.homeHotContents();
		request.setAttribute("hotList", hotList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
