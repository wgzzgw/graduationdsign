package com.design.renthouse.service.impl;

import com.design.renthouse.entity.Admin;
import com.design.renthouse.mapper.AdminMapper;
import com.design.renthouse.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

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
}
