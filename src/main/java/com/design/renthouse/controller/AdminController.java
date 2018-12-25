package com.design.renthouse.controller;

import com.design.renthouse.entity.Admin;
import com.design.renthouse.service.IAdminService;
import com.design.renthouse.service.IHouserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private IAdminService service;
    @Autowired
    private IHouserService dao;
    /**
     * 登录
     *
     * @param adminUsername
     * @param adminPassword
     * @param req
     * @return
     */
    @RequestMapping("adminAccess")
    @ResponseBody
    public String adminAccess(String adminUsername, String adminPassword, HttpServletRequest req) {
        System.out.println(adminUsername+" "+adminPassword);
        Admin admin = new Admin(adminUsername, adminPassword);
        Admin adminAccess = service.adminAccess(admin);
        req.getSession().setAttribute("Admin", adminAccess);
        if (adminAccess != null)
            return "OK";
        return "FAIL";
    }
    @RequestMapping("toAdminHomePage")
    public String toAdminHomePage() {
        return "adminhome.jsp";
    }
    /**
     * 跳转到登录页
     *
     * @return
     */
    @RequestMapping("toAdminLogin")
    public String toAdminLogin() {
        return "admin.jsp";
    }
    /**
     * 登出
     *
     * @param request
     * @return
     */
    @RequestMapping("adminSingnout")
    public String signout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "admin.jsp";
    }
    @RequestMapping("toUpdateAdminPwdPage")
    public String toUpdateAdminPwdPage() {
        return "updateAdminPwd.jsp";
    }
    @RequestMapping("updateAdminPwd")
    @ResponseBody
    public String updateAdminPwd(HttpServletRequest request,String oldPwd, String newPwd) {
        Admin admin = new Admin();
        Admin adminSession = (Admin) request.getSession().getAttribute("Admin");
        admin.setAdminId(adminSession.getAdminId());
        admin.setAdminPassword(oldPwd);
        Admin checkAdminPwd = service.checkAdminPwd(admin);
        if (checkAdminPwd == null) {
            return "FAIL";
        }
        System.out.println("+1");
        Admin a = new Admin();
        a.setAdminId(adminSession.getAdminId());
        a.setAdminPassword(newPwd);
        int n = service.updateAdminPwd(a);
        System.out.println("++++");
        if (n > 0)
            return "OK";
        return "FAIL";
    }
    @RequestMapping("toAllUserPage")
    public String toAllUserPage() {
        return "alluser.jsp";
    }
}
