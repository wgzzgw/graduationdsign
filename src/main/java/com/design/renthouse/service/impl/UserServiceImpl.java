package com.design.renthouse.service.impl;

import com.design.renthouse.entity.Users;
import com.design.renthouse.mapper.UserMapper;
import com.design.renthouse.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper mapper;
    @Override
    public int regist(Users user) {
        return mapper.regist(user);
    }
    @Override
    public Users login(Users user) {
        return mapper.login(user);
    }
    @Override
    public int updateUserPwd(Users users) {
        return mapper.updateUserPwd(users);
    }
    @Override
    public Users checkOldPwd(Users users) {
        return mapper.checkOldPwd(users);
    }
}
