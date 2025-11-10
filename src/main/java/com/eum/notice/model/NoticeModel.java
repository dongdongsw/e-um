package com.eum.notice.model;

import java.text.SimpleDateFormat;
import java.util.*;
import com.eum.notice.dao.*;
import com.eum.list.vo.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class NoticeModel {
	
	// ✅ 공지사항 목록
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


	
	// ✅ 공지사항 상세보기
	@RequestMapping("notice/detail.eum")
	public String notice_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String n_id=request.getParameter("n_id");
		NoticeVO vo=NoticeDAO.noticeDetailData(n_id);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp","../notice/detail.jsp");
		return "../main/main.jsp";
	}
	
	// ✅ 글쓰기 폼
	@RequestMapping("notice/insert.eum")
	public String notice_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../notice/insert.jsp");
		return "../main/main.jsp";
	}
	
	// ✅ 글쓰기 완료
	@RequestMapping("notice/insert_ok.eum")
	public String notice_insert_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch(Exception ex) {}
		
		/* String u_id=request.getParameter("u_id"); */
		String n_title=request.getParameter("n_title");
		String n_content=request.getParameter("n_content");
		
		NoticeVO vo=new NoticeVO();
		vo.setU_id("eaujmrkw");
		vo.setN_title(n_title);
		vo.setN_content(n_content);
		
		NoticeDAO.noticeInsert(vo);
		
		return "redirect:../notice/list.eum";
	}
	
	// ✅ 수정 폼
	@RequestMapping("notice/update.eum")
	public String notice_update(HttpServletRequest request,HttpServletResponse response)
	{
		String n_id=request.getParameter("n_id");
		NoticeVO vo=NoticeDAO.noticeDetailData(n_id);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../notice/update.jsp");
		return "../main/main.jsp";
	}
	
	// ✅ 수정 완료
	@RequestMapping("notice/update_ok.eum")
	public String notice_update_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch(Exception ex) {}
		
		String n_id=request.getParameter("n_id");
		String n_title=request.getParameter("n_title");
		String n_content=request.getParameter("n_content");
		
		NoticeVO vo=new NoticeVO();
		vo.setN_id(n_id);
		vo.setN_title(n_title);
		vo.setN_content(n_content);
		
		NoticeDAO.noticeUpdate(vo);
		
		// ✅ 수정 후 상세보기 이동
		return "redirect:../notice/detail.do?n_id=" + n_id;
		
	}
	
	// ✅ 삭제 확인 페이지
	@RequestMapping("notice/delete.eum")
	public String notice_delete(HttpServletRequest request,HttpServletResponse response)
	{
		String n_id=request.getParameter("n_id");
		NoticeVO vo=NoticeDAO.noticeDetailData(n_id);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../notice/delete.jsp");
		return "../main/main.jsp";
	}
	
	// ✅ 삭제 완료
	@RequestMapping("notice/delete_ok.eum")
	public String notice_delete_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String n_id=request.getParameter("n_id");
		NoticeDAO.noticeDelete(n_id);
		
		return "redirect:../notice/list.do";
	}
}