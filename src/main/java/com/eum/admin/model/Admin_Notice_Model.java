package com.eum.admin.model;
import java.text.SimpleDateFormat;
import java.util.*;
import com.eum.admin.dao.*;
import com.eum.notice.dao.*;
import com.eum.main.vo.*;
import com.eum.admin.dao.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Notice_Model {
	// 관리자 공지사항 리스트
	@RequestMapping("admin/admin_notice_list.eum")
 	public String notice_list(HttpServletRequest request, HttpServletResponse response)
 	{
 	    String page = request.getParameter("page");
 	    if (page == null) page = "1";
 	    int curpage = Integer.parseInt(page);
 
 	    int rowSize = 10;
 	    int start = (curpage - 1) * rowSize + 1;   
 	    int end   = curpage * rowSize;            
 
 	    Map<String, Object> map = new HashMap<>();
 	    map.put("start", start);
 	    map.put("end", end);
 
 	    List<NoticeVO> list = Admin_NoticeDAO.adminnoticeListData(map); 
 	    int totalpage = Admin_NoticeDAO.adminnoticeTotalPage();
 
 	    String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
 	    String n_id=request.getParameter("n_id");
 
 	    final int BLOCK = 10;
 	    int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
 	    int endPage   = Math.min(startPage + BLOCK - 1, totalpage);
 	    
 	    request.setAttribute("n_id", n_id);
 	    request.setAttribute("list", list);
 	    request.setAttribute("curpage", curpage);
 	    request.setAttribute("totalpage", totalpage);
 	    request.setAttribute("startPage", startPage);
 	    request.setAttribute("endPage", endPage);
 	    request.setAttribute("today", today);
 
 	    request.setAttribute("admin_main_jsp", "../notice/admin_notice_list.jsp");
 	    return "../admin/common/admin_main.jsp";
 	}
 
 
 	@RequestMapping("admin/admin_notice_detail.eum")
 	public String notice_detail(HttpServletRequest request,HttpServletResponse response)
 	{
 		System.out.println("~~~ ADMIN DETAIL CONTROLLER IS HERE ~~~");
 
 		String n_id=request.getParameter("n_id");
 		NoticeVO vo=Admin_NoticeDAO.adminnoticeDetailData(n_id);
 		
 		System.out.println("Received n_id: " + n_id);
 		if (vo == null) {
 	        System.out.println("No data found for n_id: " + n_id);    
 	    } else {
 	        System.out.println("Notice found: " + vo.getN_title());    
 	    }
 		
 		request.setAttribute("n_id", n_id);
 		request.setAttribute("vo", vo);
 		request.setAttribute("admin_main_jsp","../notice/admin_notice_detail.jsp");
 		return "../admin/common/admin_main.jsp";
 	}
 	
 	@RequestMapping("admin/admin_notice_insert.eum")
 	public String notice_insert(HttpServletRequest request,HttpServletResponse response)
 	{
 		request.setAttribute("admin_main_jsp", "../notice/admin_notice_insert.jsp");
 		return "../admin/common/admin_main.jsp";
 	}
 	
 	@RequestMapping("admin/admin_notice_insert_ok.eum")
 	public String notice_insert_ok(HttpServletRequest request,HttpServletResponse response)
 	{
 		try {
 			request.setCharacterEncoding("UTF-8");
 		} catch(Exception ex) {}
 		
 		String n_title=request.getParameter("n_title");
 		String n_content=request.getParameter("n_content");
 		String n_id=request.getParameter("n_id");
 		
 		
 		NoticeVO vo=new NoticeVO();
 		vo.setN_id(n_id);
 		vo.setN_title(n_title);
 		vo.setN_content(n_content);
 		
 		Admin_NoticeDAO.adminnoticeInsert(vo);
 		
 		return "redirect:../admin/admin_notice_list.eum";
 	}
 	
 	@RequestMapping("admin/admin_notice_update.eum")
 	public String notice_update(HttpServletRequest request,HttpServletResponse response)
 	{
 		String n_id=request.getParameter("n_id");
 		NoticeVO vo=Admin_NoticeDAO.adminnoticeDetailData(n_id);
 		
 		request.setAttribute("n_id", n_id);
 		request.setAttribute("vo", vo);
 		request.setAttribute("admin_main_jsp", "../notice/admin_notice_update.jsp");
 		return "../admin/common/admin_main.jsp";
 	}
 	
 	@RequestMapping("admin/admin_notice_update_ok.eum")
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
 		
 		Admin_NoticeDAO.adminnoticeUpdate(vo);
 		
 		return "redirect:../admin/admin_notice_detail.eum?n_id="+n_id;
 		
 	}
 	
 	/*@RequestMapping("admin/admin_notice_delete.eum")
 	public String notice_delete(HttpServletRequest request,HttpServletResponse response)
 	{
 		String n_id=request.getParameter("n_id");
 		NoticeVO vo=NoticeDAO.noticeDetailData(n_id);
 		
 		request.setAttribute("vo", vo);
 		request.setAttribute("main_jsp", "admin_notice_delete.jsp");
 		return "../admin/common/admin_notice_list.eum";
 	}*/
 	
 	@RequestMapping("admin/admin_notice_delete_ok.eum")
 	public String notice_delete_ok(HttpServletRequest request,HttpServletResponse response)
 	{
 		try
 		{
 		String n_id=request.getParameter("n_id");
 		Admin_NoticeDAO.adminnoticeDelete(n_id);
 		return "redirect:admin_notice_list.eum";
 		}catch(Exception ex)
 		{
 			ex.printStackTrace();
 			return "../admin/admin_notice_list.eum?error=delete";
 		}
 	}
	
	
}
