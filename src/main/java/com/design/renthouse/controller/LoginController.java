package com.design.renthouse.controller;

import com.design.renthouse.entity.Users;
import com.design.renthouse.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private IUserService mapper;

    @RequestMapping("loginn")
    public String toLoginPage() {
        return "login.jsp";
    }
    @RequestMapping("registn")
    public String toRegistPage() {
        return "regist.jsp";
    }
    @RequestMapping("indexx")
    public String toIndexPage() {
        return "index.jsp";
    }
    @RequestMapping("regist")
    @ResponseBody
    public String regist(@RequestBody Users user) {
        int regist;
        try {
            if (user.getUserName().getBytes().length > 100 ||
                user.getUserNickname().getBytes().length > 100 ||
                user.getUserPassword().getBytes().length > 100) {
                return "NO";
            }
            if(!user.getUserPhone().matches("^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$")){
                return "NO";
            }
            regist = mapper.regist(user);
            if(regist>0) {
                return "OK";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "FAIL";
    }
    @RequestMapping("login")
    @ResponseBody
    public String toIndexPage(String userName, String userPassword, HttpServletRequest req) {
        Users user = new Users();
        user.setUserName(userName);
        user.setUserPassword(userPassword);
        System.out.println(userName+userPassword);
        Users loginUser = mapper.login(user);
        if(loginUser!=null) {
            req.getSession().setAttribute("loginUser", loginUser);
            return "OK";
        }
        return "FAIL";
    }
    @RequestMapping("signout")
    public String signout(HttpSession session) {
        session.invalidate();
        return "index.jsp";
    }
}
