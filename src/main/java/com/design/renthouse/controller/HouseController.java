package com.design.renthouse.controller;

import com.design.renthouse.entity.House;
import com.design.renthouse.entity.Page;
import com.design.renthouse.entity.UserHouseData;
import com.design.renthouse.entity.Users;
import com.design.renthouse.service.IHouserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("house")
public class HouseController {
    @Autowired
    private IHouserService service;
    @RequestMapping("addhouse")
    public String toAddHousePage() {
        return "addhouse.jsp";
    }
    @RequestMapping("findUserHouse")
    @ResponseBody
    public UserHouseData houseByUser(HttpServletRequest request, int page, int limit) {
        Page p = new Page();
        Users u = (Users) request.getSession().getAttribute("loginUser");
        String publisher = u.getUserNickname();
        p.setPublisher(publisher);
        p.setLimit(limit);
        p.setPage((page - 1) * limit);
        List<House> list = service.findHouseByUser(p);
        System.out.println(list);
        UserHouseData data = new UserHouseData(0, "200", list.size(), list);
        return data;
    }
}
