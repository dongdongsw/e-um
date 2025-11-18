package com.eum.seller.model;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.eum.seller.dao.SellerDAO;
import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Users_SellerVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@Controller
public class SellerModel {
	@RequestMapping("seller/join.eum")
	public String seller_join(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../seller/join.jsp");
		return "../main/main.jsp";
	}
	
	//셀러 이름 존재 여부
	@RequestMapping("seller/seller_name_ok.eum") 
	public void seller_name_ok(HttpServletRequest request, HttpServletResponse response) {
		
		String u_s_com=request.getParameter("u_s_com");

		int count=SellerDAO.sellerNameCheck(u_s_com);
		
		try {
			response.setContentType("text/plain;charset-UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		} catch (Exception ex) {}
	}
	
	// 셀러 가입
	@RequestMapping("seller/seller_join_ok.eum")
	public String seller_join_ok(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		String u_id=(String) session.getAttribute("id");
		
		String u_s_carrer=request.getParameter("carrer");
		String loc_do=request.getParameter("loc_do");
		String loc_si=request.getParameter("loc_si");
		String u_s_biz_no=request.getParameter("biz_no");
		String u_s_com=request.getParameter("seller_name");
		String u_s_profileimg_url=request.getParameter("profile_img");
		
		Users_SellerVO vo=new Users_SellerVO();
		
		vo.setU_id(u_id);
		vo.setU_s_carrer(u_s_carrer);
		vo.setU_s_zone(loc_do+" "+loc_si);
		vo.setU_s_biz_no(u_s_biz_no);
		vo.setU_s_com(u_s_com);
		vo.setU_s_profileimg_url(u_s_profileimg_url);
		
		SellerDAO.sellerInsert(vo);
		
		int sid=SellerDAO.sellerGetSid(u_id);
		session.setAttribute("sid", sid);
		
		return "redirect:../main/main.eum";
	}
	
	// 셀러 정보 (셀러 페이지)
	@RequestMapping("seller/info.eum")
	public String seller_info(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		int sid=(int) session.getAttribute("sid");
		
		Users_SellerVO vo=SellerDAO.sellerInfo(sid);
		
		request.setAttribute("vo", vo);
		
		request.setAttribute("main_jsp", "../seller/info.jsp");
		return "../main/main.jsp";
	}
	
	// 셀러 정보 수정 (셀러 페이지)
	@RequestMapping("seller/info_update.eum")
	public String seller_info_update(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		int sid=(int) session.getAttribute("sid");
		
		Users_SellerVO vo=SellerDAO.sellerInfo(sid);
		
		request.setAttribute("vo", vo);
		
		String loc_do=null;
		String loc_si=null;
		
		try {
			StringTokenizer zone=new StringTokenizer(vo.getU_s_zone(), " ");
			loc_do=zone.nextToken();
			loc_si=zone.nextToken();
		} catch (Exception ex) {
			StringTokenizer zone=new StringTokenizer(vo.getU_s_zone(), "-");
			loc_do=zone.nextToken();
			loc_si=zone.nextToken();
		}
		
		request.setAttribute("loc_do", loc_do);
		request.setAttribute("loc_si", loc_si);
		
		request.setAttribute("main_jsp", "../seller/info_update.jsp");
		return "../main/main.jsp";
	}
	
	// 셀러 정보 수정 완료
	@RequestMapping("seller/info_update_ok.eum")
	public String seller_update_ok(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		int sid=(int) session.getAttribute("sid");
		
		String u_s_carrer=request.getParameter("carrer");
		String loc_do=request.getParameter("loc_do");
		String loc_si=request.getParameter("loc_si");
		String u_s_biz_no=request.getParameter("biz_no");
		String u_s_com=request.getParameter("seller_name");
		String u_s_profileimg_url=request.getParameter("profile_img_url");
		
		Users_SellerVO vo=new Users_SellerVO();

		vo.setU_s_id(sid);
		vo.setU_s_carrer(u_s_carrer);
		vo.setU_s_zone(loc_do+" "+loc_si);
		vo.setU_s_biz_no(u_s_biz_no);
		vo.setU_s_com(u_s_com);
		vo.setU_s_profileimg_url(u_s_profileimg_url);
		
		SellerDAO.sellerInfoUpdate(vo);
		 
		return "redirect:../seller/info.eum";
	}
	
	// 내 컨텐츠 목록 (셀러 페이지)
	@RequestMapping("seller/my_contents.eum")
	public String seller_my_contents(HttpServletRequest request, HttpServletResponse response) {
		
		List<BoardVO> list=new ArrayList<BoardVO>();
		
		HttpSession session=request.getSession();
		int sid=(int) session.getAttribute("sid");
		
		list=SellerDAO.myContents(sid);
		
		request.setAttribute("list", list);
				
		request.setAttribute("main_jsp", "../seller/my_contents.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("seller/review.eum")
	   public String recipe_find(HttpServletRequest request, HttpServletResponse response) {
		   request.setAttribute("main_jsp", "../seller/review.jsp");
		   return "../main/main.jsp";
	}
	
	@RequestMapping("seller/review_result.eum")
	public String seller_review(HttpServletRequest request,HttpServletResponse response) {

	    HttpSession session=request.getSession();
	    int sid=(int)session.getAttribute("sid");
	    
	    String page=request.getParameter("page");
	    if (page==null)
	    	page="1";
	    int curpage=Integer.parseInt(page);
	    
	    String sort=request.getParameter("sort");
	    if (sort == null || sort.equals("")) {
	        sort="최신순"; 
	    }

	    Map map=new HashMap();
	    int rowSize=5;
	    int start=(rowSize*curpage)-(rowSize-1);
	    int end=rowSize*curpage;

	    map.put("start", start);
	    map.put("end", end);
	    map.put("sort", sort);
	    map.put("u_s_id", sid); 

	    List<BoardVO> list=SellerDAO.sellerReview(map);
	    int count=SellerDAO.sReviewTotalPage(map);

	    final int BLOCK=10;
	    int totalpage=(int)(Math.ceil(count/5.0));
	    int startPage=((curpage - 1) / BLOCK * BLOCK) + 1;
	    int endPage=((curpage - 1) / BLOCK * BLOCK) + BLOCK;
	    if (endPage > totalpage) 
	    	endPage=totalpage;

	    // JSP에서 쓸 값들 세팅
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
	    request.setAttribute("count", count);
	    request.setAttribute("sort", sort);

	    return "../seller/review_result.jsp";
	}
	
	
	
	@RequestMapping("seller/sell.eum")
	public String seller_sell(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../seller/sell.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("seller/chat.eum")
	public String seller_chat(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../seller/chat.jsp");
		return "../main/main.jsp";
	}
	
	// 프로필 이미지 업로드
		@RequestMapping("seller/profile_upload.eum")
		public String users_profile_upload(HttpServletRequest request, HttpServletResponse response) {
			HttpSession session = request.getSession();
			int sid = (int)session.getAttribute("sid");
			
			
			String uploadDir = "/upload/profile";
			String path = request.getServletContext().getRealPath(uploadDir);
			
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String newFilePath = null;
			
			try {
				Part filePart = request.getPart("profile_img");
				String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
				
				if(filePart.getSize() > 0 && originalFileName != null && !originalFileName.isEmpty()) {
					String oldProFileUrl = (String)session.getAttribute("profile");
					
					String uniqueFileName = System.currentTimeMillis() + "-" + originalFileName;
					Path filePath = Paths.get(path, uniqueFileName);
					try(InputStream input = filePart.getInputStream()) {
						Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
					}
					newFilePath = request.getContextPath() + uploadDir + "/" + uniqueFileName;
					
					Users_SellerVO vo=new Users_SellerVO();
					vo.setU_s_id(sid);
					vo.setU_s_profileimg_url(newFilePath);
					SellerDAO.sellerProfile(vo);
					
					if(oldProFileUrl != null && !oldProFileUrl.contains("profile.jpg")) {
						try {
							String oldFileName = oldProFileUrl.substring(oldProFileUrl.lastIndexOf("/")+1);
							File oldFile = new File(path + File.separator + oldFileName);
							if(oldFile.exists()) {
								oldFile.delete();
							}
						} catch(Exception ignore) {
						}
					}
					session.setAttribute("profile", newFilePath);
				}
			} catch(Exception ex) {
				ex.printStackTrace();
				request.setAttribute("msg", "파일 업로드 처리 중 오류가 발생했습니다.");
				request.setAttribute("url", "../seller/info.eum");
				return "../commons/alert.jsp";
			}
			return "redirect:../seller/info.eum";
		}
}