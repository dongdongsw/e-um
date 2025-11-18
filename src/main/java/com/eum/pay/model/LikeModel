package com.eum.pay.model;

import com.eum.main.vo.*;
import com.eum.pay.dao.LikeDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class LikeModel {

	// 좋아요 누름
	@RequestMapping("like/likeInsert.eum")
	public void like_insert(HttpServletRequest request, HttpServletResponse response) {

		int count = 0;
		HttpSession session=request.getSession();
		String u_id=(String)session.getAttribute("id");
		String b_id=request.getParameter("b_id");
		Board_LikeVO vo = new Board_LikeVO();

		vo.setB_id(b_id);               
		vo.setU_id(u_id);

		if(u_id != null && !"".equals(u_id)) {
			LikeDAO.boardLikeInsert(vo);
		}

	}

	// 좋아요 삭제
	@RequestMapping("like/likeDelete.eum")
	public void like_delete(HttpServletRequest request,
			HttpServletResponse response)	{

		HttpSession session=request.getSession();
		String u_id=(String)session.getAttribute("id");
		String b_id=request.getParameter("b_id");
		Board_LikeVO vo = new Board_LikeVO();

		vo.setB_id(b_id);  
		vo.setU_id(u_id);

		LikeDAO.boardLikeDelete(vo);
	}

}

