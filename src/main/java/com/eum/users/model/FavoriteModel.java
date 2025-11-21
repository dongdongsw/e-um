package com.eum.users.model;

import com.eum.main.vo.*;
import com.eum.users.dao.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.*;

@Controller
public class FavoriteModel {
	// 즐겨찾기 추가
	@RequestMapping("users/favorite_insert.eum")
	public String favorite_insert(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("id");
		
		String b_id = request.getParameter("b_id");
		
		if(u_id!=null && b_id!=null) {
			FavoriteVO vo = new FavoriteVO();
			vo.setU_id(u_id);
			vo.setB_id(b_id);
			
			int count = FavoriteDAO.favoriteCheckCount(vo);
			if(count==0) {
				FavoriteDAO.favoriteInsert(vo);
			}
		}
		return "redirect:../talent/detail.eum?b_id="+b_id;
	}
	
	// 즐겨찾기 리스트
	@RequestMapping("users/favorite_list.eum")
	public String favorite_list(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("id");
		
		if(u_id!=null) {
			List<FavoriteVO> fList = FavoriteDAO.favoriteListData(u_id);
			request.setAttribute("fList", fList);
		}
		request.setAttribute("main_jsp", "../users/favorite_list.jsp");
		return "../main/main.jsp";
	}
	
	// 즐겨찾기 삭제
	@RequestMapping("users/favorite_delete.eum")
	public String favorite_delete(HttpServletRequest request, HttpServletResponse response) {
		String fv_id_str = request.getParameter("fv_id");
		
		if(fv_id_str!=null) {
			try {
				int fv_id = Integer.parseInt(fv_id_str);
				FavoriteDAO.favoriteDelete(fv_id);
			} catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		return "redirect:../users/favorite_list.eum";
	}
}