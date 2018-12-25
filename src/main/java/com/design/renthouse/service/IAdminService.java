package com.design.renthouse.service;

import com.design.renthouse.entity.Admin;

public interface IAdminService {
    /**
     * 管理员登录
     * @param admin
     * @return
     */
    public Admin adminAccess(Admin admin);
    /**
     *  检查修改密码原密码
     * @param admin
     * @return
     */
    public Admin checkAdminPwd(Admin admin);
    /**
     *  修改管理员密码
     * @param admin
     * @return
     */
    public int updateAdminPwd(Admin admin);
}
