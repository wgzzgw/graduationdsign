package com.design.renthouse.controller;

import com.design.renthouse.entity.House;
import com.design.renthouse.entity.Page;
import com.design.renthouse.entity.UserHouseData;
import com.design.renthouse.entity.Users;
import com.design.renthouse.service.IHouserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
    public String houseByUser(HttpServletRequest request, int page, int limit,String sortOrder,String sortName,String keyword) throws JsonProcessingException {
        System.out.println("find");
        System.out.println("page" + page);
        System.out.println("limit" + limit);
        System.out.println("sortorder" + sortOrder);
        System.out.println("sortname" + sortName);
        System.out.println("keyword" + keyword);
        if (sortName.equals("houseId")) sortName = "house_id";
        if (sortName.equals("houseArea")) sortName = "house_area";
        if (sortName.equals("housePrice")) sortName = "house_price";
        if (sortName.equals("publishTime")) sortName = "publish_time";
        Page p = new Page();
        Users u = (Users) request.getSession().getAttribute("loginUser");
        String publisher = u.getUserName();
        p.setPublisher(publisher);
        p.setLimit(limit);
        p.setPage(page);
        p.setSortOrder(sortOrder);
        p.setSortName(sortName);
        if(keyword!=null&&!keyword.equals(""))p.setSearchkey(keyword);
        System.out.println(p.getSortOrder() + "-");
        List<House> list = service.findHouseByUser(p);
        System.out.println(list.size() + "size");
        List<House> list2 = service.findAllHouseByUser(p);
        UserHouseData data = new UserHouseData(0, "200", list2.size(), list);
        //向前端返回json数据
        ObjectMapper objectMapper = new ObjectMapper();
        System.out.println("end");
        return objectMapper.writeValueAsString(data);
        }
    @RequestMapping("deleteUserHouse")
    @ResponseBody
    public String deleteUserHouse(String houseId) {
        int n = service.deleteUserHouse(Integer.parseInt(houseId));
        if(n>0) {
            return "OK";
        }
        return "FAIL";
    }
    @RequestMapping("updateHouse")
    @ResponseBody
    public String updateHouse(@RequestBody House house) {
        int n = service.updateHouse(house);
        if(n>0)
            return "OK";
        return "FAIL";
    }
}
