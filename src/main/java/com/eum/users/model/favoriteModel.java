package com.eum.users.model;

import com.eum.main.vo.FavoriteVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class favoriteModel {
	@RequestMapping("users/favorite_insert.eum")
	public String favorite_insert(HttpServletRequest request, HttpServletResponse response) {
		String fv_id = request.getParameter("fv_id");
		String u_id = request.getParameter("u_id");
		String b_id = request.getParameter("b_id");
		String dbday = request.getParameter("dbday"); 
		
		HttpSession session = request.getSession();
		String loginid = (String)session.getAttribute("loginid");
		
		FavoriteVO vo = new FavoriteVO();
		vo.setFv_id(Integer.parseInt(fv_id));
		vo.setU_id(u_id);
		vo.setB_id(b_id);
		vo.setDbday(dbday);
		
		return "redirect:../talent/detail.eum?b_id="+b_id;
	}
/*
	
	@RequestMapping("jjim/jjim_list.do")
	public String jjim_list(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<JjimVO> list = JjimDAO.jjimFoodListData(id);
		
		request.setAttribute("list", list);
		
		request.setAttribute("mypage_jsp", "../mypage/jjim_list.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("jjim/jjim_cancel.do")
	public String jjim_cancel(HttpServletRequest request, HttpServletResponse response) {
		String jno = request.getParameter("jno");
		
		// DB연동
		JjimDAO.jjimCancel(Integer.parseInt(jno));
		return "redirect:../jjim/jjim_list.do";
	}
	
	@RequestMapping("jjim/food_detail.do")
	public void jjim_food_detail(HttpServletRequest request, HttpServletResponse response) {
		String fno = request.getParameter("fno");
		FoodVO vo = JjimDAO.foodDetailData(Integer.parseInt(fno));
		JSONObject obj = new JSONObject();
		obj.put("name", vo.getName());
		obj.put("poster", vo.getPoster());
		obj.put("address", vo.getAddress());
		obj.put("phone", vo.getPhone());
		obj.put("price", vo.getPrice());
		obj.put("parking", vo.getParking());
		obj.put("type", vo.getType());
		obj.put("theme", vo.getTheme());
		obj.put("content", vo.getContent());
		obj.put("time", vo.getTime());
		obj.put("score", vo.getScore());
		
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(obj.toJSONString());
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
 */
	
}
