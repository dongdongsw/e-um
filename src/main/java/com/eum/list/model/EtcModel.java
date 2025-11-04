package com.eum.list.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eum.list.dao.EtcDAO;
import com.eum.list.vo.ContentVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class EtcModel {
	
	@RequestMapping("etc/list.eum")
	public String main_list(HttpServletRequest request, HttpServletResponse response) {
		
		String page=request.getParameter("page");
		if(page==null)
		  page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		   
		map.put("start", start);
		map.put("end", end);
		   
		List<ContentVO> list=EtcDAO.etcListData(map);
		int totalpage=EtcDAO.etcTotalPage();

		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		 
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		if(endPage>totalpage)
			endPage=totalpage;
		   
		   
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
        request.setAttribute("main_jsp", "../etc/list.jsp");
        return "../main/main.jsp";
    }
	
	@RequestMapping("etc/detail.eum")
	public String main_detail(HttpServletRequest request, HttpServletResponse response) {
		
		String b_id=request.getParameter("b_id");
		
		ContentVO vo=EtcDAO.etcDetailData(b_id);
		List<String> list=EtcDAO.etcDetailImage(b_id);
		List<ContentVO> rList=EtcDAO.etcReview(b_id);
		List<ContentVO> oList=EtcDAO.etcPriceOption(b_id);
		
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("rList", rList);
		request.setAttribute("oList", oList);
		
		request.setAttribute("main_jsp", "../etc/detail.jsp");
		return "../main/main.jsp";
	}
	
}