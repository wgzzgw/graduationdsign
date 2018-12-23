package com.design.renthouse.controller;

import com.design.renthouse.entity.House;
import com.design.renthouse.service.IHouserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("homepage")
public class HomePageController {
    @Autowired
    private IHouserService service;
    @RequestMapping("toIndexPage")
    public String toIndexPage(HttpServletRequest request) {
        System.out.println("findhomeinfo");
        List<House> findHomeInfo = service.findHomeInfo();
        request.getSession().setAttribute("House", findHomeInfo);
        return "index.jsp";
    }
    @RequestMapping("findHouseByLike")
    @ResponseBody
    public String findHouseByLike(HttpServletRequest request,String keywords) throws UnsupportedEncodingException {
        String key = new String(keywords.getBytes("ISO-8859-1"),"utf-8");
        List<House> findHomeInfo = service.findHouseByLike(key);
        System.out.println(key);
        System.out.println(findHomeInfo.size()+"-=-=");
        request.getSession().removeAttribute("House");
        request.getSession().setAttribute("House", findHomeInfo);
        System.out.println(request.getSession().getAttribute("House"));
        return "OK";
    }
    @RequestMapping("toindex")
    public String toIndexPage2() {
        return "index.jsp";
    }
    @RequestMapping("findHousrOrderByAsc")
    public String findHousrOrderByAsc(HttpServletRequest request) {
        List<House> findHomeInfo = service.findHouseOrderByAsc();
        request.getSession().removeAttribute("House");
        request.getSession().setAttribute("House", findHomeInfo);
        return "index.jsp";
    }

    @RequestMapping("findHousrOrderByDesc")
    public String findHousrOrderByDesc(HttpServletRequest request) {
        List<House> findHomeInfo = service.findHouseOrderByDesc();
        request.getSession().removeAttribute("House");
        request.getSession().setAttribute("House", findHomeInfo);
        return "index.jsp";
    }

}
