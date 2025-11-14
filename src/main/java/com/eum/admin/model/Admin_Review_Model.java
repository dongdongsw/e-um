package com.eum.admin.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.eum.admin.dao.Admin_ContentsDAO;
import com.eum.admin.dao.Admin_ReviewDAO;
import com.eum.main.vo.ContentVO;
import com.eum.main.vo.ReviewVO;
import com.eum.main.vo.Review_ImageVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class Admin_Review_Model {

	// 리뷰 리스트
	@RequestMapping("admin/admin_review_list.eum")
	public String admin_review_list(HttpServletRequest request, HttpServletResponse response) {
		
		
		String page = request.getParameter("page");
		if(page==null) page ="1";
		
		Map map = new HashMap();
		
		int rowSize=10;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", (start-1));
		map.put("rowSize", rowSize);
		
		List<ReviewVO> review_list = Admin_ReviewDAO.reviewListData(map);
		int totalpage = Admin_ReviewDAO.reviewTotalData();
		
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("review_list", review_list);
		
		request.setAttribute("admin_main_jsp", "../review/admin_review_list.jsp");
		return "../admin/common/admin_main.jsp";
	}
	
	@RequestMapping("admin/review_image_list.eum")
	public void review_image_list(HttpServletRequest request, HttpServletResponse response) {
	    String id = request.getParameter("id");
	    List<Review_ImageVO> list = Admin_ReviewDAO.selectReviewImages(id);

	    JSONArray arr = new JSONArray();
	    for(Review_ImageVO vo : list){
	        JSONObject obj = new JSONObject();
	        obj.put("url", vo.getR_image_url());
	        arr.add(obj);
	    }

	    try {
	    	response.setContentType("text/plain;charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.print(arr.toJSONString());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	    
	}

	
	
	
}
