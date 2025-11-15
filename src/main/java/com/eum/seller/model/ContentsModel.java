package com.eum.seller.model;

import java.io.File;
import java.net.URL;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.eum.main.vo.BoardVO;
import com.eum.main.vo.Board_ImageVO;
import com.eum.main.vo.Board_OptionVO;
import com.eum.seller.dao.ContentsDAO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@Controller
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,  
	    maxFileSize = 5 * 1024 * 1024L,   
	    maxRequestSize = 20 * 1024 * 1024L 
)
	public class ContentsModel {
	
		@RequestMapping("seller/create_contents.eum")
		public String create_contents(HttpServletRequest request, HttpServletResponse response) {
			
			request.setAttribute("main_jsp", "../seller/create_contents.jsp");
			return "../main/main.jsp";
		}
		
	
		@RequestMapping("seller/contents_insert_ok.eum")
		public String contents_insert_ok(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("==== contents_insert_ok 진입 ====");
			HttpSession session=request.getSession();
			int sid=(int)session.getAttribute("sid");
			System.out.println("sid 세션 값: " + session.getAttribute("sid"));
			String type=request.getParameter("category");
			String title=request.getParameter("title");
			String content=request.getParameter("description");
			String prod=request.getParameter("meetType");
			
			BoardVO bvo=new BoardVO();
			
			bvo.setB_content(content);
			bvo.setB_title(title);
			bvo.setB_prod_on_off(prod);
			bvo.setB_type(type);
			bvo.setU_s_id(sid);
			// 썸네일 이미지
			
			try {
		        ServletContext context = request.getServletContext();
		        String uploadPath = context.getRealPath("/uploads/thumbnail");

		        File dir = new File(uploadPath);
		        if (!dir.exists()) dir.mkdirs();

		        Part mainPart = request.getPart("mainImage");

		        String mainFileName = null;
		        String mainFileUrl = null;

		        if (mainPart != null && mainPart.getSize() > 0) {
		            String original = Paths.get(mainPart.getSubmittedFileName()).getFileName().toString();
		            mainFileName = System.currentTimeMillis() + "_" + original;

		            String savePath = uploadPath + File.separator + mainFileName;
		            mainPart.write(savePath);

		            mainFileUrl = request.getContextPath() + "/uploads/thumbnail/" + mainFileName;
		        }
		        bvo.setB_thumbnail(mainFileUrl);
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
			
			
		    // 디테일 이미지
			List<Board_ImageVO> subImages = new ArrayList<>();
			
		    try {
		        ServletContext context = request.getServletContext();
		        String uploadPath = context.getRealPath("/uploads/detailimage");

		        File dir = new File(uploadPath);
		        if (!dir.exists()) dir.mkdirs();

		        for (Part part : request.getParts()) {
		            if (!"subImages".equals(part.getName())) continue;
		            if (part.getSize() == 0) continue;

		            String original = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		            String fileName = System.currentTimeMillis() + "_" + original;

		            String savePath = uploadPath + File.separator + fileName;
		            part.write(savePath);

		            String fileUrl = request.getContextPath() + "/uploads/detailimage/" + fileName;
		            Board_ImageVO vo = new Board_ImageVO();
		            vo.setB_img_url(fileUrl);

		            subImages.add(vo);
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
			
		    // 옵션
		    
		    String priceTitle1=request.getParameter("priceTitle1");
		    String price1=request.getParameter("price1");
		    String priceDesc1=request.getParameter("priceDesc1");
		    
		    String priceTitle2=request.getParameter("priceTitle2");
		    String price2=request.getParameter("price2");
		    String priceDesc2=request.getParameter("priceDesc2");
		    
		    String priceTitle3=request.getParameter("priceTitle3");
		    String price3=request.getParameter("price3");
		    String priceDesc3=request.getParameter("priceDesc3");

		    
		    List<Board_OptionVO> optionList=new ArrayList<>();
		    Board_OptionVO op1=new Board_OptionVO();
	        op1.setB_op_title(priceTitle1);
	        op1.setB_op_price(Integer.parseInt(price1));
	        op1.setB_op_detail(priceDesc1);
	        optionList.add(op1);
	        
	        Board_OptionVO op2=new Board_OptionVO();
	        op2.setB_op_title(priceTitle2);
	        op2.setB_op_price(Integer.parseInt(price2));
	        op2.setB_op_detail(priceDesc2);
	        optionList.add(op2);
	        
	        Board_OptionVO op3=new Board_OptionVO();
	        op3.setB_op_title(priceTitle3);
	        op3.setB_op_price(Integer.parseInt(price3));
	        op3.setB_op_detail(priceDesc3);
	        optionList.add(op3);
	        System.out.println("board insert 직전");
	        ContentsDAO.contentsInsert(bvo, subImages, optionList);
	        System.out.println("board insert 완료");
	        System.out.println("리턴 직전");
	        request.setAttribute("main_jsp", "../talent/list.jsp");
			return "../main/main.jsp";
		}
		
		
}
