package com.eum.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.admin.dao.Admin_ContentsDAO;
import com.eum.admin.dao.Admin_SellerDAO;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Board_ImageVO;
import com.eum.main.vo.Board_OptionVO;
import com.eum.main.vo.ContentVO;
import com.eum.main.vo.UsersVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Contents_Model {

	// 관리자 컨텐츠 리스트
	@RequestMapping("admin/admin_contents_list.eum")
	public String admin_contents_list(HttpServletRequest request, HttpServletResponse response) {
					
		String page = request.getParameter("page");
		String keyword = request.getParameter("keyword");
		if(page==null) page ="1";
		
		Map map = new HashMap();
		
		int rowSize=8;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", (start-1));
		map.put("rowSize", rowSize);
		List<BoardVO> contents_list = null;
		int totalpage = 0;
		
		if(keyword==null || keyword.trim().equals("") ) {
			contents_list = Admin_ContentsDAO.contentsListData(map);
			totalpage = Admin_ContentsDAO.contentsTotalData();
			
		}
		else {
			map.put("keyword", keyword);
			contents_list = Admin_ContentsDAO.contentSearchListData(map);
			totalpage = Admin_ContentsDAO.contentSearchTotalData(keyword);
		}
		
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("contents_list", contents_list);
		
		request.setAttribute("keyword", keyword);
		
		request.setAttribute("admin_main_jsp", "../contents/admin_contents_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
				
	// 관리자 컨텐츠 디테일
	@RequestMapping("admin/admin_contents_detail.eum")
	public String admin_contents_detail(HttpServletRequest request, HttpServletResponse response) {
							
		String b_id = request.getParameter("b_id");
		BoardVO board_vo = Admin_ContentsDAO.contentsDetailboard(b_id);
		List<Board_ImageVO> b_img_vo = Admin_ContentsDAO.contentsDetailboardImage(b_id);
		BoardVO board_avg = Admin_ContentsDAO.contentsDetailscore(b_id);
		List<Board_OptionVO> bo = Admin_ContentsDAO.contentsDetailprice(b_id);
		
		request.setAttribute("board_vo", board_vo);
		request.setAttribute("b_img_vo", b_img_vo);
		request.setAttribute("board_avg", board_avg);
		request.setAttribute("bo", bo);
		request.setAttribute("admin_main_jsp", "../contents/admin_contents_detail.jsp");
		return "../admin/common/admin_main.jsp";
	}
				
	// 관리자 컨텐츠 디테일 상태 수정
	@RequestMapping("admin/admin_contents_status.eum")
	public String admin_contents_status(HttpServletRequest request, HttpServletResponse response) {
	
		String b_id = request.getParameter("b_id");
		String b_status = request.getParameter("b_status");
		
		Map map = new HashMap();
		map.put("b_id", b_id);
		map.put("b_status", b_status);
		Admin_ContentsDAO.contentsStatusUpdate(map);
		
		
		
		return "redirect:../admin/admin_contents_detail.eum?b_id="+b_id;
	}
	
	// 관리자 컨텐츠 삭제 
	@RequestMapping("admin/admin_contents_delete.eum")
	public String admin_contents_delete(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String b_id = request.getParameter("b_id");
		String keyword = request.getParameter("keyword");
		
		Admin_ContentsDAO.contentsDel(b_id);
		
		return "redirect:../admin/admin_contents_list.eum?page="+page+"&keyword="+keyword;
	}
	
}
