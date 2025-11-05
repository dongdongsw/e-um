package com.eum.main.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.list.dao.ExerciseDAO;
import com.eum.list.vo.Board_ImageVO;
import com.eum.list.vo.Board_OptionVO;
import com.eum.list.vo.ContentVO;
import com.eum.list.vo.ReviewVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ExerciseModel {
	@RequestMapping("main/exerciselist.eum")
	public String exerciselist(HttpServletRequest request, HttpServletResponse response) {

		// 사용자가 요청 (페이지를 보여달라)
		String page = request.getParameter("page");
		if(page==null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 12;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<ContentVO> list = ExerciseDAO.exerciseListData(map);
		
		
		int totalpage = ExerciseDAO.exerciseTotalPage();
		
		
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage > totalpage)
			endPage = totalpage;

		
		request.setAttribute("list",list);
		request.setAttribute("curpage",curpage);
		request.setAttribute("totalpage",totalpage);
		request.setAttribute("startPage",startPage);
		request.setAttribute("endPage",endPage);
		
		request.setAttribute("main_jsp", "../main/list/exerciselist.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("main/exercisedetail.eum")
	public String exercisedetail(HttpServletRequest request, HttpServletResponse response) {
		
		String b_id = request.getParameter("b_id");
		String page = request.getParameter("page");
		
		
		ContentVO vo = ExerciseDAO.exerciseDetailData(b_id);
		Map map = new HashMap();
		map.put("b_id", b_id);
		
		List<ReviewVO> list = ExerciseDAO.exerciseReviewDetailData(map);
		List<Board_OptionVO> list3 = ExerciseDAO.exerciseOptionDetailData(map);
		List<Board_ImageVO> list4 = ExerciseDAO.exerciseImagaeDetailData(b_id);
		request.setAttribute("page",page);
		request.setAttribute("vo",vo);
		request.setAttribute("list",list);
		request.setAttribute("list3",list3);
		request.setAttribute("list4",list4);
		
		request.setAttribute("main_jsp", "../main/list/exercisedetail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("main/exercisedetail_before.eum")
	public String exercisedetail_before(HttpServletRequest request, HttpServletResponse response) {
		
		String b_id = request.getParameter("b_id");
		String page = request.getParameter("page");
		
		ExerciseDAO.exerciseHitIncrement(b_id);
		
		return "redirect:../main/exercisedetail.eum?b_id="+b_id+"&page="+page;
	}
	
}
