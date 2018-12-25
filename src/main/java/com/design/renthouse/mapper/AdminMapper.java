package com.design.renthouse.mapper;

import com.design.renthouse.entity.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
    public Admin adminAccess(Admin admin);//管理员登录
    public Admin checkAdminPwd(Admin admin);//检查修改密码原密码
    public int updateAdminPwd(Admin admin);//修改管理员密码
}
