package com.design.renthouse.service.impl;

import com.design.renthouse.entity.Admin;
import com.design.renthouse.entity.House;
import com.design.renthouse.entity.Page;
import com.design.renthouse.entity.Users;
import com.design.renthouse.mapper.AdminMapper;
import com.design.renthouse.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
public class AdminServiceImpl implements IAdminService {
    @Autowired
    private AdminMapper service;
    @Override
    public Admin adminAccess(Admin admin) {
        return service.adminAccess(admin);
    }
    @Override
    public Admin checkAdminPwd(Admin admin) {
        return service.checkAdminPwd(admin);
    }
    @Override
    public int updateAdminPwd(Admin admin) {
        return service.updateAdminPwd(admin);
    }
    @Override
    public List<Users> findAllUser() {
        return service.findAllUser();
    }
    @Override
    public int deleteUser(int uID) {
        return service.deleteUser(uID);
    }
    @Override
    public Users findUserById(int uID) {
        return service.findUserById(uID);
    }
    @Override
    public int updateUser(Users users) {
        return service.updateUser(users);
    }
    @Override
    public List<House> findAllHouse(Page page) {
        return service.findAllHouse(page);
    }
    @Override
    public int findAllHouseNum() {
        return service.findAllHouseNum();
    }
    @Override
    public int deleteHouse(int houseId) {
        return service.deleteHouse(houseId);
    }
}
