package com.design.renthouse.service;

import com.design.renthouse.entity.Admin;
import com.design.renthouse.entity.House;
import com.design.renthouse.entity.Page;
import com.design.renthouse.entity.Users;

import java.util.List;

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
    /**
     * 查询所有用户
     * @return
     */
    public List<Users> findAllUser();
    /**
     * 管理员删除用户
     * @param userId
     * @return
     */
    public int deleteUser(int userId);
    /**
     * 通过id查询用户
     * @param userId
     * @return
     */
    public Users findUserById(int userId);
    /**
     * 管理员更新普通用户信息
     * @return
     */
    public int updateUser(Users users);
    /**
     * 查询所有房源信息
     * @return
     */
    public List<House> findAllHouse(Page page);
    public int findAllHouseNum();
    /**
     * 管理员删除房源信息
     * @return
     */
    public int deleteHouse(int houseId);
}
