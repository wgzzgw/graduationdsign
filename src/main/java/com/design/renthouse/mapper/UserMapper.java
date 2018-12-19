package com.design.renthouse.mapper;

import com.design.renthouse.entity.Users;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    public int regist(Users users);//注册用户
    public Users login(Users user);//登录用户
    public int updateUserPwd(Users users);//修改密码
    public Users checkOldPwd(Users users);//检查旧密码
}
