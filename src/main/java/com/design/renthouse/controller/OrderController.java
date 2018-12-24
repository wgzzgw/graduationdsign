package com.design.renthouse.controller;

import com.design.renthouse.entity.*;
import com.design.renthouse.service.IOrderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    private IOrderService sevice;
    @RequestMapping("myorder")
    public String toOrderPage() {
        return "myorder.jsp";
    }
    @RequestMapping("addOrder")
    @ResponseBody
    public String addOrder(String id,HttpServletRequest request) {
        System.out.println("order");
        Users u = (Users) request.getSession().getAttribute("loginUser");
        try {
            Order order = new Order();
            order.setHouseId(Integer.parseInt(id));
            order.setOrderUser(u.getUserNickname());
            order.setUserId(u.getUserId());
            int n = sevice.addOrder(order);
            if(n>0) {
                return "OK";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "FAIL";
        }
        return "FAIL";
    }
    @RequestMapping("myOrderInfo")
    @ResponseBody
    public String findAllOrder(int page,int limit,String sortOrder,String sortName,String keyword,HttpServletRequest request)  throws JsonProcessingException {
        System.out.println("find");
        System.out.println("page" + page);
        System.out.println("limit" + limit);
        System.out.println("sortorder" + sortOrder);
        System.out.println("sortname" + sortName);
        System.out.println("keyword" + keyword);
        if (sortName.equals("housePrice")) sortName = "house_price";
        if (sortName.equals("orderId")) sortName = "order_id";
        Page p = new Page();
        p.setPage(page);
        p.setLimit(limit);
        p.setSortOrder(sortOrder);
        p.setSortName(sortName);
        Users u = (Users) request.getSession().getAttribute("loginUser");
        p.setUserId(u.getUserId());
        if(keyword!=null&&!keyword.equals(""))p.setSearchkey(keyword);
        UserOrderData data = new UserOrderData();
        List<UserOrder> order = sevice.findAllOrder(p);
        data.setCode(0);
        data.setTotal(sevice.getOrderCount(u.getUserId()));
        data.setData(order);
        data.setMsg("200");
        //向前端返回json数据
        ObjectMapper objectMapper = new ObjectMapper();
        System.out.println("end");
        return objectMapper.writeValueAsString(data);
    }
    @RequestMapping("deleteOrder")
    @ResponseBody
    public String deleteOrder(int orderId) {
        System.out.println("dedsdsdad");
        int n = sevice.deleteOrder(orderId);
        if(n>0)
            return "OK";
        return "FAIL";
    }
}
