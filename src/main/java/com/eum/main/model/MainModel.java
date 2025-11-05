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
        String page = request.getParameter("page");
        if (page == null) page = "1";
        int curpage = Integer.parseInt(page);

        int rowSize = 12;
        int start = (curpage - 1) * rowSize + 1;
        int end = curpage * rowSize;

        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("end", end);

        List<ContentVO> list = ContentDAO.contentListData(map);
        int totalpage = ContentDAO.contentTotalPage();

        final int BLOCK = 10;
        int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
        int endPage = startPage + BLOCK - 1;
        if (endPage > totalpage) endPage = totalpage;

        request.setAttribute("list", list);
        request.setAttribute("curpage", curpage);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);

        request.setAttribute("main_jsp", "../main/list/bizlist.jsp");
        return "../main/main.jsp";
    }

    @RequestMapping("main/bizdetail.eum")
    public String main_detail(HttpServletRequest request, HttpServletResponse response) {
        String b_id = request.getParameter("b_id");

        ContentVO vo = ContentDAO.contentDetailData(b_id);
        List<String> list = ContentDAO.contentDetailImage(b_id);

        request.setAttribute("vo", vo);
        request.setAttribute("list", list);

        request.setAttribute("main_jsp", "../main/list/bizdetail.jsp");
        return "../main/main.jsp";
    }
}
