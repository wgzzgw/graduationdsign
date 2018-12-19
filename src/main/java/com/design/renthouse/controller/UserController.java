package com.design.renthouse.controller;

import com.design.renthouse.entity.Users;
import com.design.renthouse.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private IUserService service;
    @RequestMapping("toUserSystem")
    public String toUserSystemPage() {
        return "customer.jsp";
    }
    @RequestMapping("updateUserPwd")
    @ResponseBody
    public String updateUserPwd(String id,String newPwd,String oldPwd) {
        System.out.println(oldPwd);
        Users oldUser = new Users();
        oldUser.setUserId(Integer.parseInt(id));
        oldUser.setUserPassword(oldPwd);
        Users checkUser = service.checkOldPwd(oldUser);
        if(checkUser!=null) {
            Users newUser = new Users();
            newUser.setUserId(Integer.parseInt(id));
            newUser.setUserPassword(newPwd);
            int n = service.updateUserPwd(newUser);
            if(n>0) {
                return "OK";
            }
        }
        return "FAIL";
    }
    @RequestMapping("updaten")
    public String toUpdatePwdPage() {
        return "updatepwd.jsp";
    }
    @RequestMapping("toUserRentalPage")
    public String toUserRentalPage() {
        return "myrental.jsp";
    }
}
