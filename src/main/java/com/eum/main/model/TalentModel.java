package com.eum.main.model;

import java.io.PrintWriter;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Board_OptionVO;
import com.eum.main.vo.ReviewVO;
import com.eum.main.dao.TalentDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class TalentModel {
	
	    // 키워드 검색 
	    @RequestMapping("talent/keyword_list.eum")
	    public String talent_search(HttpServletRequest request, HttpServletResponse response) {
	        
	        String keyword = request.getParameter("keyword");
	        if (keyword == null) keyword = "";

	        String page = request.getParameter("page");
	        int curpage = (page == null) ? 1 : Integer.parseInt(page);

	        int rowSize = 12;
	        int start = (curpage - 1) * rowSize + 1;
	        int end = curpage * rowSize;

	        Map<String, Object> map = new HashMap<>();
	        map.put("keyword", keyword);
	        map.put("start", start);
	        map.put("end", end);

	        // DAO 호출
	        List<BoardVO> list = TalentDAO.talentSearchKeywordData(map);
	        int totalpage = TalentDAO.talentSearchKeywordTotalPage(map);
	        
	        final int BLOCK = 10;
		    int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		    int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		    if(endPage > totalpage)
		    {
		        endPage = totalpage;
		    }

		    request.setAttribute("startPage", startPage);
		    request.setAttribute("endPage", endPage);
	        request.setAttribute("list", list);
	        request.setAttribute("curpage", curpage);
	        request.setAttribute("totalpage", totalpage);

	        request.setAttribute("keyword", keyword);

	        // 검색 전용 JSP 파일 연결
	        request.setAttribute("main_jsp", "../talent/keyword_list.jsp");

	        return "../main/main.jsp";
	    }
	    // 타입 검색
	    @RequestMapping("talent/b_type_list.eum")
	    public String talent_category(HttpServletRequest request, HttpServletResponse response) {
	        
	        String b_type = request.getParameter("b_type");
	        if (b_type == null) b_type = "";

	        String page = request.getParameter("page");
	        int curpage = (page == null) ? 1 : Integer.parseInt(page);

	        int rowSize = 12;
	        int start = (curpage - 1) * rowSize + 1;
	        int end = curpage * rowSize;

	        Map<String, Object> map = new HashMap<>();
	        map.put("b_type", b_type);
	        map.put("start", start);
	        map.put("end", end);

	        List<BoardVO> list = TalentDAO.talentSearchTypeData(map);
	        int totalpage = TalentDAO.talentSearchTypeTotalPage(map);

	        final int BLOCK = 10;
		    int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		    int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		    if(endPage > totalpage)
		    {
		        endPage = totalpage;
		    }

		    request.setAttribute("startPage", startPage);
		    request.setAttribute("endPage", endPage);
	        request.setAttribute("list", list);
	        request.setAttribute("curpage", curpage);
	        request.setAttribute("totalpage", totalpage);
	        
	        request.setAttribute("b_type", b_type);

	        // 카테고리 전용 JSP 파일 연결
	        request.setAttribute("main_jsp", "../talent/b_type_list.jsp");

	        return "../main/main.jsp";
	    }

   @RequestMapping("talent/detail.eum")
   public String talent_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String b_id=request.getParameter("b_id");
	   String page=request.getParameter("page");
	   
	   BoardVO detail_vo=TalentDAO.talentDetailData(b_id);
	   BoardVO board_vo=TalentDAO.talentDetailboard(b_id);
	   List<BoardVO> review_vo=TalentDAO.talentDetailreview(b_id);
	   BoardVO score_vo=TalentDAO.talentDetailscore(b_id);
	   List<Board_OptionVO> price_vo=TalentDAO.talentDetailprice(b_id);
	   
	   request.setAttribute("page", page);
	   request.setAttribute("detail_vo", detail_vo);
	   request.setAttribute("board_vo", board_vo);
	   request.setAttribute("review_vo", review_vo);
	   request.setAttribute("score_vo", score_vo);
	   request.setAttribute("price_vo", price_vo);
	   
	   request.setAttribute("main_jsp", "../talent/detail.jsp");
	   return "../main/main.jsp";
   }
   // 키워드
   @RequestMapping("talent/keyword_ajax.eum")
   public void talent_search_ajax(HttpServletRequest request, HttpServletResponse response) {

       try {
           String keyword = request.getParameter("keyword");
           String fd = request.getParameter("fd");
           String page = request.getParameter("page");

           int curpage = (page == null) ? 1 : Integer.parseInt(page);

           Map map = new HashMap();
           map.put("keyword", keyword);
           map.put("fd", fd);
           map.put("start", (curpage - 1) * 12 + 1);
           map.put("end", curpage * 12);

           List<BoardVO> list = TalentDAO.talentSearchKeywordData(map);
           int totalpage = TalentDAO.talentSearchKeywordTotalPage(map);

           int BLOCK = 10;
           int startpage = ((curpage - 1) / BLOCK * BLOCK) + 1;
           int endpage = startpage + BLOCK - 1;
           if (endpage > totalpage) endpage = totalpage;

           JSONObject root = new JSONObject();
           JSONArray arr = new JSONArray();

        // TalentModel.java (keyword_ajax.eum 및 b_type_ajax.eum)

           if (list == null || list.isEmpty()) {
               root.put("list", new JSONArray()); // 빈 리스트를 보내도록 수정
               root.put("curpage", curpage);
               root.put("totalpage", totalpage);
               root.put("startpage", startpage);
               root.put("endpage", endpage);
           } else {
               // 데이터가 있을 경우 처리
               for (BoardVO vo : list) {
                   JSONObject obj = new JSONObject();
                   obj.put("b_id", vo.getB_id());
                   obj.put("b_title", vo.getB_title());
                   obj.put("b_thumbnail", vo.getB_thumbnail());

                   // null 체크 추가
                   obj.put("b_review_score", (vo.getRvo() != null) ? vo.getRvo().getB_review_score() : 0.0);
                   obj.put("review_count", (vo.getRvo() != null) ? vo.getRvo().getReview_count() : 0);
                   obj.put("b_op_price", (vo.getBovo() != null) ? vo.getBovo().getB_op_price() : 0);
                   obj.put("u_s_com", (vo.getUsvo() != null) ? vo.getUsvo().getU_s_com() : "");

                   obj.put("b_type", vo.getB_type());
                   obj.put("b_view_count", vo.getB_view_count());
                   arr.add(obj);
               }

               root.put("list", arr);
               root.put("curpage", curpage);
               root.put("totalpage", totalpage);
               root.put("startpage", startpage);
               root.put("endpage", endpage);
           }

           // JSON 데이터 응답
           response.setContentType("application/json;charset=UTF-8");
           PrintWriter out = response.getWriter();
           out.print(root.toJSONString());
           out.close();

       } catch (Exception ex) {
           ex.printStackTrace();
       }
   }



   // 타입
   @RequestMapping("talent/b_type_ajax.eum")
   public void talent_category_ajax(HttpServletRequest request, HttpServletResponse response) {

       try {
           String b_type = request.getParameter("b_type");
           String fd = request.getParameter("fd");
           String page = request.getParameter("page");

           int curpage = (page == null) ? 1 : Integer.parseInt(page);

           Map<String, Object> map = new HashMap<>();
           map.put("b_type", b_type);
           map.put("fd", fd);
           map.put("start", (curpage - 1) * 12 + 1);
           map.put("end", curpage * 12);

           List<BoardVO> list = TalentDAO.talentSearchTypeData(map);
           int totalpage = TalentDAO.talentSearchTypeTotalPage(map);

           int BLOCK = 10;
           int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
           int endPage = startPage + BLOCK - 1;
           if (endPage > totalpage) endPage = totalpage;

           JSONArray arr = new JSONArray();
        // TalentModel.java (keyword_ajax.eum 및 b_type_ajax.eum)

           for (BoardVO vo : list) {
               JSONObject obj = new JSONObject();
               obj.put("b_id", vo.getB_id());
               obj.put("b_title", vo.getB_title());
               obj.put("b_thumbnail", vo.getB_thumbnail());

               // ★ null 체크 추가: ReviewVO (Rvo)가 null일 경우 0 또는 기본값 설정
               obj.put("b_review_score", (vo.getRvo() != null) ? vo.getRvo().getB_review_score() : 0.0);
               obj.put("review_count", (vo.getRvo() != null) ? vo.getRvo().getReview_count() : 0);

               // ★ null 체크 추가: Board_OptionVO (Bovo)가 null일 경우 0 또는 기본값 설정
               obj.put("b_op_price", (vo.getBovo() != null) ? vo.getBovo().getB_op_price() : 0);

               // ★ null 체크 추가: Users_SellerVO (Usvo)가 null일 경우 빈 문자열 설정
               obj.put("u_s_com", (vo.getUsvo() != null) ? vo.getUsvo().getU_s_com() : "");

               obj.put("b_type", vo.getB_type());
               obj.put("b_view_count", vo.getB_view_count());
               arr.add(obj);
           }

           JSONObject root = new JSONObject();
           root.put("list", arr);
           root.put("curpage", curpage);
           root.put("totalpage", totalpage);
           root.put("startpage", startPage);
           root.put("endpage", endPage);

           response.reset();
           response.setContentType("application/json;charset=UTF-8");
           PrintWriter out = response.getWriter();
           out.print(root.toJSONString());
           out.close();

       } catch (Exception ex) {
           ex.printStackTrace();
       }
   }




}