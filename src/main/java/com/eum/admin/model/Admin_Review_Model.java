package com.eum.admin.model;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.eum.admin.dao.Admin_ReviewDAO;
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
		String keyword = request.getParameter("keyword");
		if(page==null) page ="1";
		
		Map map = new HashMap();
		
		int rowSize=10;
		int curpage = Integer.parseInt(page);
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		map.put("start", (start-1));
		map.put("rowSize", rowSize);
		
		List<ReviewVO> review_list = null;
		int totalpage = 0;
		if(keyword==null || keyword.trim().equals("")  ) {
			
			review_list = Admin_ReviewDAO.reviewListsData(map);
			totalpage = Admin_ReviewDAO.reviewTotalData();
			
		}else {
			map.put("keyword", keyword);
			review_list = Admin_ReviewDAO.reviewSearchListData(map);
			totalpage = Admin_ReviewDAO.reviewSearchTotalData(keyword);
		}
		final int BLOCK = 10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(totalpage < endPage) endPage=totalpage;
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("review_list", review_list);
		
		request.setAttribute("keyword", keyword);
		
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

	// 리뷰 전체 삭제
	@RequestMapping("admin/admin_review_delete.eum")
	public String admin_review_delete(HttpServletRequest request, HttpServletResponse response) {

		String page = request.getParameter("page");
		String keyword = request.getParameter("keyword");
		String b_review_id = request.getParameter("b_review_id");
		String redirect = request.getParameter("redirect"); 
	    String u_id = request.getParameter("u_id"); 
	    String u_s_id = request.getParameter("u_s_id"); 
	    String page_r = request.getParameter("page_r");
		if(page == null) page = "1";
	    if(keyword == null) keyword = "";
	    
	    try {
		    keyword = URLEncoder.encode(keyword, "UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	    
		Admin_ReviewDAO.reviewDel(Integer.parseInt(b_review_id));
	
		if("user_detail".equals(redirect)) {
	        return "redirect:../admin/admin_users_detail.eum?u_id=" + u_id + "#home";
	    }
		
		if("seller_detail".equals(redirect)) {
	        return "redirect:../admin/admin_seller_detail.eum?page_r="+page_r +"&u_s_id=" + u_s_id + "#home";
	    }
		
		return "redirect:../admin/admin_review_list.eum?page="+page+"&keyword="+keyword;
	}
	
	// 리뷰 답글 삭제
	@RequestMapping("admin/admin_review_replydelete.eum")
	public String admin_review_replydelete(HttpServletRequest request, HttpServletResponse response) {

		String page = request.getParameter("page");
		String keyword = request.getParameter("keyword");
		String b_review_id = request.getParameter("b_review_id");

		if(page == null) page = "1";
	    if(keyword == null) keyword = "";
	    
	    try {
		    keyword = URLEncoder.encode(keyword, "UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	    
		Admin_ReviewDAO.reviewDelete(Integer.parseInt(b_review_id));
	
		return "redirect:../admin/admin_review_list.eum?page="+page+"&keyword="+keyword;
	}	
}
