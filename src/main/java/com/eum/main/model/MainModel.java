package com.eum.main.model;

import java.util.*;
import com.eum.list.dao.ContentDAO;
import com.eum.list.vo.ContentVO;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MainModel {
    
    @RequestMapping("main/main.eum")
    public String main_main(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("main_jsp", "../main/home.jsp");
        return "../main/main.jsp";
    }

    @RequestMapping("main/list.eum")
    public String main_list(HttpServletRequest request, HttpServletResponse response) {
        // 페이지 번호 파라미터 처리
        String page = request.getParameter("page");
        if (page == null) page = "1";
        int curpage = Integer.parseInt(page);

        // 1페이지 = 1~12, 2페이지 = 13~24
        int rowSize = 12;
        int start = (curpage - 1) * rowSize + 1;

        // 파라미터 맵 생성
        Map<String, Object> map = new HashMap<>();
        map.put("start", start);

        // 데이터 목록 조회
        List<ContentVO> list = ContentDAO.contentListData(map);

        // 전체 페이지 수 계산
        int totalpage = ContentDAO.contentTotalPage();

        // 페이지 블록 계산
        final int BLOCK = 10;
        int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
        int endPage = startPage + BLOCK - 1;
        if (endPage > totalpage)
            endPage = totalpage;

        // JSP에 전달
        request.setAttribute("list", list);
        request.setAttribute("curpage", curpage);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);

        request.setAttribute("main_jsp", "../main/list.jsp");
        return "../main/main.jsp";
    }

    @RequestMapping("main/detail.eum")
    public String main_detail(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("main_jsp", "../main/detail.jsp");
        return "../main/main.jsp";
    }
}
