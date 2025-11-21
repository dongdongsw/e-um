package com.eum.main.model;

import java.io.PrintWriter;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.eum.main.vo.*;
import com.eum.pay.dao.LikeDAO;
import com.eum.users.dao.FavoriteDAO;
import com.eum.main.dao.ContentDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ContentModel {
	 @RequestMapping("talent/keyword_list.eum")
	    public String talent_search(HttpServletRequest request, HttpServletResponse response) {
	        
	        String keyword = request.getParameter("keyword");
	        keyword = (keyword == null) ? "" : keyword.trim();

	        String page = request.getParameter("page");
	        int curpage = (page == null) ? 1 : Integer.parseInt(page);

	        int rowSize = 12;
	        int start = (curpage - 1) * rowSize + 1;
	        int end = curpage * rowSize;

	        Map<String, Object> map = new HashMap<>();
	        map.put("keyword", keyword);
	        map.put("start", start);
	        map.put("end", end);

	        List<BoardVO> list = ContentDAO.talentSearchKeywordData(map);
	        int totalpage = ContentDAO.talentSearchKeywordTotalPage(map);
	        
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

	        request.setAttribute("main_jsp", "../talent/keyword_list.jsp");

	        return "../main/main.jsp";
	    }
	    // 타입 검색
	    @RequestMapping("talent/b_type_list.eum")
	    public String talent_category(HttpServletRequest request, HttpServletResponse response) {
	        
	        String b_type = request.getParameter("b_type");
	        b_type = (b_type == null) ? "" : b_type.trim();

	        String page = request.getParameter("page");
	        int curpage = (page == null) ? 1 : Integer.parseInt(page);

	        int rowSize = 12;
	        int start = (curpage - 1) * rowSize + 1;
	        int end = curpage * rowSize;

	        Map<String, Object> map = new HashMap<>();
	        map.put("b_type", b_type);
	        map.put("start", start);
	        map.put("end", end);

	        List<BoardVO> list = ContentDAO.talentSearchTypeData(map);
	        int totalpage = ContentDAO.talentSearchTypeTotalPage(map);

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

	        request.setAttribute("main_jsp", "../talent/b_type_list.jsp");

	        return "../main/main.jsp";
	    }
	    @RequestMapping("talent/keyword_ajax.eum")
	    public void talent_search_ajax(HttpServletRequest request, HttpServletResponse response) {

	        try {
	            String keyword = request.getParameter("keyword");
	            String fd = request.getParameter("fd");
	            String page = request.getParameter("page");

	            int curpage = (page == null) ? 1 : Integer.parseInt(page);

	            Map map = new HashMap();
	            map.put("keyword", keyword == null ? "" : keyword.trim());
	            map.put("fd", fd);
	            map.put("start", (curpage - 1) * 12 + 1);
	            map.put("end", curpage * 12);

	            List<BoardVO> list = ContentDAO.talentSearchKeywordData(map);
	            int totalpage = ContentDAO.talentSearchKeywordTotalPage(map);

	            int BLOCK = 10;
	            int startpage = ((curpage - 1) / BLOCK * BLOCK) + 1;
	            int endpage = startpage + BLOCK - 1;
	            if (endpage > totalpage) endpage = totalpage;

	            JSONObject root = new JSONObject();
	            JSONArray arr = new JSONArray();

	            if (list != null) {
	                for (BoardVO vo : list) {

	                    JSONObject obj = new JSONObject();
	                    obj.put("b_id", vo.getB_id());
	                    obj.put("b_title", vo.getB_title());
	                    obj.put("b_thumbnail", vo.getB_thumbnail());
	                    obj.put("b_type", vo.getB_type());
	                    obj.put("b_view_count", vo.getB_view_count());

	                    JSONObject rvo = new JSONObject();
	                    rvo.put("b_review_score",
	                            vo.getRvo() != null ? vo.getRvo().getB_review_score() : 0);
	                    rvo.put("review_count",
	                            vo.getRvo() != null ? vo.getRvo().getReview_count() : 0);
	                    obj.put("rvo", rvo);

	                    JSONObject bovo = new JSONObject();
	                    bovo.put("b_op_price",
	                            vo.getBovo() != null ? vo.getBovo().getB_op_price() : 0);
	                    obj.put("bovo", bovo);

	                    JSONObject usvo = new JSONObject();
	                    usvo.put("u_s_com",
	                            vo.getUsvo() != null ? vo.getUsvo().getU_s_com() : "");
	                    obj.put("usvo", usvo);

	                    arr.add(obj);
	                }
	            }

	            // JSON 최종 세팅(통일된 구조)
	            root.put("list", arr);
	            root.put("curpage", curpage);
	            root.put("totalpage", totalpage);
	            root.put("startpage", startpage);
	            root.put("endpage", endpage);

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
	            map.put("b_type", b_type == null ? "" : b_type.trim());
	            map.put("fd", fd);
	            map.put("start", (curpage - 1) * 12 + 1);
	            map.put("end", curpage * 12);

	            List<BoardVO> list = ContentDAO.talentSearchTypeData(map);
	            int totalpage = ContentDAO.talentSearchTypeTotalPage(map);

	            int BLOCK = 10;
	            int startpage = ((curpage - 1) / BLOCK * BLOCK) + 1;
	            int endpage = startpage + BLOCK - 1;
	            if (endpage > totalpage) endpage = totalpage;

	            JSONArray arr = new JSONArray();

	            if (list != null) {
	                for (BoardVO vo : list) {

	                    JSONObject obj = new JSONObject();
	                    obj.put("b_id", vo.getB_id());
	                    obj.put("b_title", vo.getB_title());
	                    obj.put("b_thumbnail", vo.getB_thumbnail());
	                    obj.put("b_type", vo.getB_type());
	                    obj.put("b_view_count", vo.getB_view_count());

	                    JSONObject rvo = new JSONObject();
	                    rvo.put("b_review_score",
	                            vo.getRvo() != null ? vo.getRvo().getB_review_score() : 0);
	                    rvo.put("review_count",
	                            vo.getRvo() != null ? vo.getRvo().getReview_count() : 0);
	                    obj.put("rvo", rvo);

	                    JSONObject bovo = new JSONObject();
	                    bovo.put("b_op_price",
	                            vo.getBovo() != null ? vo.getBovo().getB_op_price() : 0);
	                    obj.put("bovo", bovo);

	                    JSONObject usvo = new JSONObject();
	                    usvo.put("u_s_com",
	                            vo.getUsvo() != null ? vo.getUsvo().getU_s_com() : "");
	                    obj.put("usvo", usvo);

	                    arr.add(obj);
	                }
	            }

	            JSONObject root = new JSONObject();
	            root.put("list", arr);
	            root.put("curpage", curpage);
	            root.put("totalpage", totalpage);
	            root.put("startpage", startpage);
	            root.put("endpage", endpage);

	            response.setContentType("application/json;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.print(root.toJSONString());
	            out.close();

	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
   @RequestMapping("talent/detail.eum")
   public String talent_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   HttpSession session = request.getSession();
	   String u_id = (String)session.getAttribute("id");
	   try {
		   String b_id=request.getParameter("b_id");
	 	   
	 	   BoardVO detail_vo=ContentDAO.talentDetailData(b_id);
	 	   BoardVO board_vo=ContentDAO.talentDetailboard(b_id);
	 	   List<BoardVO> image_vo=ContentDAO.talentDetailboardImage(b_id);
	 	   List<BoardVO> review_vo=ContentDAO.talentDetailreview(b_id);
	 	   BoardVO score_vo=ContentDAO.talentDetailscore(b_id);
	 	   List<Board_OptionVO> price_vo=ContentDAO.talentDetailprice(b_id);
		   Board_LikeVO board_like_vo = new Board_LikeVO();

		   board_like_vo.setB_id(b_id);               
		   board_like_vo.setU_id(u_id);
			
		   int chk = LikeDAO.boardLikeUserChk(board_like_vo);
		   int likeCount = LikeDAO.boardLikeCount(board_like_vo);
	 	   
	 	   // 즐겨찾기 카운트 초기화
	 	   int fCount = 0; 
	 	   if(u_id != null && b_id != null) {
 	  	        FavoriteVO vo = new FavoriteVO();
 	  	        vo.setU_id(u_id);
 	  	        vo.setB_id(b_id);
 	  	        
 	  	        fCount = FavoriteDAO.favoriteCheckCount(vo);
	 	   }
	 	   request.setAttribute("detail_vo", detail_vo);
	 	   request.setAttribute("board_vo", board_vo);
	 	   request.setAttribute("image_vo", image_vo);
	 	   request.setAttribute("review_vo", review_vo);
	 	   request.setAttribute("score_vo", score_vo);
	 	   request.setAttribute("price_vo", price_vo);
		   request.setAttribute("likeCount", likeCount);
	 	   request.setAttribute("chk", chk);
	 	   request.setAttribute("fCount", fCount);
		   request.setAttribute("u_id", u_id);
	 	   
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	   
	   
	   request.setAttribute("main_jsp", "../talent/detail.jsp");
	   return "../main/main.jsp";
   }
   
   @RequestMapping("talent/review.eum")
   public String talent_review(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   
	   String b_id=request.getParameter("b_id");
	   String page=request.getParameter("page");

	   BoardVO detail_vo=ContentDAO.talentDetailData(b_id);
	   BoardVO board_vo=ContentDAO.talentDetailboard(b_id);
	   List<BoardVO> review_vo=ContentDAO.talentDetailreview(b_id);
	   BoardVO score_vo=ContentDAO.talentDetailscore(b_id);
	   List<Board_OptionVO> price_vo=ContentDAO.talentDetailprice(b_id);
	   
	   
	   if (id != null) {
			  Map map=new HashMap();
			  map.put("u_id", id);
			  map.put("b_id", b_id);
			  
			 ReviewVO rvo=new ReviewVO();
			 rvo.setB_id(b_id);
			 rvo.setU_id(id);
			 
			 int buy=ContentDAO.buyCheck(map);
			 int rcount=ContentDAO.reviewOk(rvo);
			 
			 request.setAttribute("buy", buy);
			 request.setAttribute("rcount", rcount);
	   }
	   
	   request.setAttribute("page", page);
	   request.setAttribute("detail_vo", detail_vo);
	   request.setAttribute("board_vo", board_vo);
	   request.setAttribute("review_vo", review_vo);
	   request.setAttribute("score_vo", score_vo);
	   request.setAttribute("price_vo", price_vo);
	   

	   return "../talent/review.jsp";
   }
   
   // 리뷰 작성
   @RequestMapping("review/insert_ok.eum") 
   public String review_insert(HttpServletRequest request, HttpServletResponse response) {
	   String b_id=null;
	   try {
		   HttpSession session=request.getSession();
		   String u_id=(String)session.getAttribute("id");
		   
		   String u_s_id=request.getParameter("u_s_id");
		   b_id=request.getParameter("b_id");
		   String content=request.getParameter("content");
		   String score=request.getParameter("score");
		   
		   ReviewVO vo=new ReviewVO();
		   
		   vo.setU_id(u_id);
		   vo.setU_s_id(Integer.parseInt(u_s_id));
		   vo.setB_id(b_id);
		   vo.setB_review_content(content);
		   vo.setB_review_score(Double.parseDouble(score));
		   
		   ContentDAO.reviewInsert(vo);
		   
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   
	   return "redirect:../talent/detail.eum?b_id="+b_id;
   }
   
   // 답글 작성
   @RequestMapping("reply/insert_ok.eum") 
   public String reply_insert(HttpServletRequest request, HttpServletResponse response) {
	   String b_id=null;
	   try {
		   HttpSession session=request.getSession();
		   String u_id=(String)session.getAttribute("id");
		   
		   String u_s_id=request.getParameter("u_s_id");
		   b_id=request.getParameter("b_id");
		   String content=request.getParameter("content");
		   String group_id=request.getParameter("group_id");
		   
		   ReviewVO vo=new ReviewVO();
		   
		   vo.setU_id(u_id);
		   vo.setU_s_id(Integer.parseInt(u_s_id));
		   vo.setB_id(b_id);
		   vo.setB_review_content(content);
		   vo.setGroup_id(group_id);
		   
		   ContentDAO.replyInsert(vo);
		   
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   
	   return "redirect:../talent/detail.eum?b_id="+b_id;
   }
   
   // 리뷰 수정
   @RequestMapping("review/update_ok.eum")
   public void review_udpate_ok(HttpServletRequest request, HttpServletResponse response) {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String rid=request.getParameter("rid");
	   String score=request.getParameter("score");
	   String content=request.getParameter("content");
	   
	   ReviewVO vo=new ReviewVO();
	   
	   vo.setB_review_id(rid);
	   vo.setB_review_score(Double.parseDouble(score));
	   vo.setB_review_content(content);
	   
	   String res=ContentDAO.reviewUpdate(vo);
	   
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(res); 
	   }catch(Exception ex) {}
   }
   
   // 답변 수정
   @RequestMapping("reply/update_ok.eum")
   public void reply_udpate_ok(HttpServletRequest request, HttpServletResponse response) {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String rid=request.getParameter("rid");
	   String score=request.getParameter("score");
	   String content=request.getParameter("content");
	   
	   ReviewVO vo=new ReviewVO();
	   
	   vo.setB_review_id(rid);
	   vo.setB_review_content(content);
	   
	   String res=ContentDAO.replyUpdate(vo);
	   
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(res); 
	   }catch(Exception ex) {}
   }
   
   // 답변 삭제
   @RequestMapping("reply/delete_ok.eum")
   public void reply_delete_ok(HttpServletRequest request, HttpServletResponse response) {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String rid=request.getParameter("rid");
	   
	   String res=ContentDAO.replyDelete(Integer.parseInt(rid));
	   
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(res); 
	   }catch(Exception ex) {}
   }
   
   // 리뷰 삭제
   @RequestMapping("review/delete_ok.eum")
   public void rreview_delete_ok(HttpServletRequest request, HttpServletResponse response) {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String rid=request.getParameter("rid");
	   
	   String res=ContentDAO.reviewDelete(Integer.parseInt(rid));
	   
	   try
	   {
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(res); 
	   }catch(Exception ex) {}
   }
   	
   	@RequestMapping("talent/list.eum")
   	public String content_list(HttpServletRequest request, HttpServletResponse response) {

   	    String b_type = request.getParameter("b_type");
   	    String keyword = request.getParameter("keyword");
   	    String sort = request.getParameter("sort");
   	    if (sort == null || sort.equals("")) {
   	    	sort = "view";   
   	    }
   	    String page = request.getParameter("page");
   	    int curpage = (page == null || page.equals("")) ? 1 : Integer.parseInt(page);

   	    int rowSize = 12;
   	    int start = (curpage - 1) * rowSize + 1;
   	    int end   = curpage * rowSize;

   	    Map<String, Object> listMap = new HashMap<>();
   	    listMap.put("start", start);
   	    listMap.put("end", end);
   	    listMap.put("b_type", b_type);  
   	    listMap.put("sort", sort);          
   	    listMap.put("keyword", keyword);

   	    List<BoardVO> list = ContentDAO.contentList(listMap);

   	    Map<String, Object> pageMap = new HashMap<>();
   	    pageMap.put("b_type", b_type); 

   	    int totalpage = ContentDAO.contentTotalPage(listMap);

   	    final int BLOCK = 10;
   	    int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
   	    int endPage   = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
   	    if (endPage > totalpage) endPage = totalpage;

   	    request.setAttribute("list", list);
   	    request.setAttribute("curpage", curpage);
   	    request.setAttribute("totalpage", totalpage);
   	    request.setAttribute("startPage", startPage);
   	    request.setAttribute("endPage", endPage);

   	    request.setAttribute("b_type", b_type);
   	    request.setAttribute("sort", sort);
   	    request.setAttribute("keyword", keyword);

   	    request.setAttribute("main_jsp", "../talent/list.jsp");
   	    return "../main/main.jsp";
   	}
}

