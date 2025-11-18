package com.eum.notice.model;

import java.text.SimpleDateFormat;

import java.util.*;
import com.eum.notice.dao.*;
import com.eum.main.vo.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class NoticeModel {
	
	// 공지사항 리스트
	@RequestMapping("notice/list.eum")
	public String notice_list(HttpServletRequest request, HttpServletResponse response)
	{
	    String page = request.getParameter("page");
	    if (page == null) page = "1";
	    int curpage = Integer.parseInt(page);

	    int rowSize = 10;
	    int start = (curpage - 1) * rowSize + 1; // 1, 11, 21 ...
	    int end   = curpage * rowSize;          // 10, 20, 30 ...

	    Map<String, Object> map = new HashMap<>();
	    map.put("start", start);
	    map.put("end", end);

	    List<NoticeVO> list = NoticeDAO.noticeListData(map); // ✅ DAO와 일치
	    int totalpage = NoticeDAO.noticeTotalPage();

	    String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

	    final int BLOCK = 10;
	    int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
	    int endPage   = Math.min(startPage + BLOCK - 1, totalpage);

	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
	    request.setAttribute("today", today);

	    request.setAttribute("main_jsp", "../notice/list.jsp");
	    return "../main/main.jsp";
	}


	// 상세보기
	@RequestMapping("notice/detail.eum")
	public String notice_detail(HttpServletRequest request, HttpServletResponse response) {

	    String n_id = request.getParameter("n_id");
	    NoticeVO vo = NoticeDAO.noticeDetailData(n_id);


	    request.setAttribute("n_id", n_id);
	    request.setAttribute("vo", vo);
	    request.setAttribute("main_jsp", "../notice/detail.jsp");

	    return "../main/main.jsp";
	}
}