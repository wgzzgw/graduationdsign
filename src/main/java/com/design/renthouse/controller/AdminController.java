package com.design.renthouse.controller;

import com.design.renthouse.entity.*;
import com.design.renthouse.service.IAdminService;
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

    /**
     * 查询所有用户
     *
     * @return
     */
    @RequestMapping("AllUsers")
    @ResponseBody
    public String findAllUser() throws JsonProcessingException {
        List<Users> findAllUser = service.findAllUser();
        UserData u = new UserData();
        u.setCode(0);
        u.setTotal(findAllUser.size());
        u.setData(findAllUser);
        u.setMsg("OK");
        ObjectMapper objectMapper=new ObjectMapper();
        return objectMapper.writeValueAsString(u);
    }
    /**
     * 管理员删除用户
     *
     * @param userId
     * @return
     */
    @RequestMapping("deleteUser")
    @ResponseBody
    public String deleteUser(int userId) {
        int n = service.deleteUser(userId);
        if (n > 0) {
            return "OK";
        }
        return "FAIL";
    }
    /**
     * 传入id,跳转到修改用户界面
     *
     * @return
     */
    @RequestMapping("toEditUserPage")
    public String toEditUserPage(int userId, HttpServletRequest req) {
        Users findUserById = service.findUserById(userId);
        req.getSession().setAttribute("User", findUserById);
        return "editUser.jsp";
    }
    /**
     * 更新用户信息
     *
     * @param users
     * @return
     */
    @RequestMapping("editUser")
    @ResponseBody
    public String editUser(@RequestBody Users users) {
        int n = service.updateUser(users);
        if (n > 0)
            return "OK";
        return "FAIL";
    }
    @RequestMapping("toAllHousePage")
    public String toAllHousePage() {
        return "allhouse.jsp";
    }
    /**
     * 查询所有房源
     *
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("findAllHouse")
    @ResponseBody
    public String findAllHouse(int page, int limit,String sortOrder,String sortName,String keyword) throws  JsonProcessingException{
        if (sortName.equals("houseId")) sortName = "house_id";
        if (sortName.equals("houseArea")) sortName = "house_area";
        if (sortName.equals("housePrice")) sortName = "house_price";
        if (sortName.equals("publishTime")) sortName = "publish_time";
        Page p = new Page();
        p.setLimit(limit);
        p.setPage(page);
        p.setSortOrder(sortOrder);
        p.setSortName(sortName);
        if(keyword!=null&&!keyword.equals(""))p.setSearchkey(keyword);
        List<House> findAllHouse = service.findAllHouse(p);
        UserHouseData data = new UserHouseData();
        data.setCode(0);
        data.setTotal(service.findAllHouseNum());
        data.setData(findAllHouse);
        data.setMsg("OK");
        //向前端返回json数据
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(data);
    }
    /**
     * 删除房源
     *
     * @param houseId
     * @return
     */
    @RequestMapping("deleteHouse")
    @ResponseBody
    public String deleteHouse(int houseId) {
        int deleteHouse = service.deleteHouse(houseId);
        if (deleteHouse > 0) {
            return "OK";
        }
        return "FAIL";
    }
    /**
     * 跳转到管理员更新房源界面
     *
     * @param houseId
     * @param request
     * @return
     */
    @RequestMapping("toAdminUpdateHousePage")
    public String toUpdatePage(int houseId, HttpServletRequest request) {
        House house = dao.findHouseDetailsById(houseId);
        request.getSession().setAttribute("House", house);
        return "updatehouse.jsp";
    }
}
