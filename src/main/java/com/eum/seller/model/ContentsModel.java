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
		
		@RequestMapping("seller/update_contents.eum")
		public String update_contents(HttpServletRequest request, HttpServletResponse response) {
			
			String b_id=request.getParameter("b_id");
			
			
			BoardVO bvo = ContentsDAO.contentsDetail(b_id);
			List<Board_OptionVO> opList=ContentsDAO.contentsOptionList(b_id);
			
		    request.setAttribute("bvo", bvo);
		    request.setAttribute("opList", opList);
			
			request.setAttribute("main_jsp", "../seller/update_contents.jsp");
			return "../main/main.jsp";
		}
		
		
	
		@RequestMapping("seller/contents_insert_ok.eum")
		public String contents_insert_ok(HttpServletRequest request, HttpServletResponse response) {
			
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

		    } catch (Exception ex) {
		        ex.printStackTrace();
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
	        
	        if (priceTitle2 != null && !priceTitle2.trim().isEmpty() &&
	        	    price2 != null && !price2.trim().isEmpty()) {
	        	    
	        	    Board_OptionVO op2 = new Board_OptionVO();
	        	    op2.setB_op_title(priceTitle2);
	        	    op2.setB_op_price(Integer.parseInt(price2));
	        	    op2.setB_op_detail(priceDesc2);
	        	    optionList.add(op2);
	        	}

	        if (priceTitle3 != null && !priceTitle3.trim().isEmpty() &&
	       	    price3 != null && !price3.trim().isEmpty()) {
	        	    
	       	    Board_OptionVO op3 = new Board_OptionVO();
	       	    op3.setB_op_title(priceTitle3);
	       	    op3.setB_op_price(Integer.parseInt(price3));
	       	    op3.setB_op_detail(priceDesc3);
	       	    optionList.add(op3);
	       	}
	        
	        String b_id=ContentsDAO.contentsInsert(bvo, subImages, optionList);
	        
	        
			return "redirect:../talent/detail.eum?b_id="+b_id;
		}
		


		@RequestMapping("seller/contents_update_ok.eum")
		public String contents_update_ok(HttpServletRequest request, HttpServletResponse response) {
		    
		    String b_id=request.getParameter("b_id");
		    String type=request.getParameter("category");
		    String title=request.getParameter("title");
		    String content=request.getParameter("description");
		    String prod=request.getParameter("meetType");
		
		
		    String originThumb=request.getParameter("originThumb");
		
		    BoardVO bvo=new BoardVO();
		    bvo.setB_id(b_id);
		    bvo.setB_type(type);
		    bvo.setB_title(title);
		    bvo.setB_content(content);
		    bvo.setB_prod_on_off(prod);
		
		
		    try {
		        ServletContext context=request.getServletContext();
		        String uploadPath =context.getRealPath("/uploads/thumbnail");
		
		        File dir=new File(uploadPath);
		        if (!dir.exists()) dir.mkdirs();
		
		        Part mainPart=request.getPart("mainImage");
		
		        String mainFileUrl=originThumb; // 기본은 기존 썸네일 유지
		
		        if (mainPart != null && mainPart.getSize() > 0) {
		            String original= Paths.get(mainPart.getSubmittedFileName()).getFileName().toString();
		            String mainName=System.currentTimeMillis() + "_" + original;
		            String savePath=uploadPath + File.separator + mainName;
		            mainPart.write(savePath);
		
		            mainFileUrl=request.getContextPath() + "/uploads/thumbnail/" + mainName;
		        }
		
		        bvo.setB_thumbnail(mainFileUrl);
		
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    }
		
		    String[] opIds=request.getParameterValues("b_op_id");
		    String[] titles=request.getParameterValues("b_op_title");
		    String[] prices=request.getParameterValues("b_op_price");
		    String[] details=request.getParameterValues("b_op_detail");
		
		    List<Board_OptionVO> opList=new ArrayList<>();
		
		    if (opIds != null) {
		        for (int i = 0; i < opIds.length; i++) {
		            if (opIds[i] == null || opIds[i].trim().equals("")) continue;
		
		            Board_OptionVO ovo=new Board_OptionVO();
		            ovo.setB_op_id(Integer.parseInt(opIds[i]));
		            ovo.setB_id(b_id);
		            ovo.setB_op_title(titles[i]);
		            ovo.setB_op_price(Integer.parseInt(prices[i]));
		            ovo.setB_op_detail(details[i]);
		
		            opList.add(ovo);
		        }
		    }
		    

		    ContentsDAO.contentsUpdate(bvo, opList);
		
		    System.out.println("contents update 완료");
		    return "redirect:../talent/detail.eum?b_id="+b_id;
		}
		
}
