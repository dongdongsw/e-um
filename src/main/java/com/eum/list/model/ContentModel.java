package com.eum.list.model;

import com.sist.controller.Controller;

import com.sist.controller.RequestMapping;
import com.eum.list.dao.ContentDAO;
import com.eum.list.vo.ContentVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;

@Controller
public class ContentModel {
	@RequestMapping("main/list.eum")
	public String main_list(HttpServletRequest request, HttpServletResponse response) {
        // 전체 리스트를 받는 경우 파라미터 없이 호출
        List<ContentVO> list = ContentDAO.contentListData(null);
        
        // 만약 Map 등으로 필터링 조건을 넘기는 경우
        // Map<String, Object> params = new HashMap<>();
        // params.put(...); // 조건 추가
        // List<ContentVO> list = ContentDAO.contentListData(params);
        
        request.setAttribute("list", list);
        // b_id가 null이면 jsp에서 사용할 때도 null일 수 있으니 확인
        request.setAttribute("b_id", null);

        request.setAttribute("main_jsp", "../main/list.jsp");
        return "../main/main.jsp";
    }
}
