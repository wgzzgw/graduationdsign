package com.design.renthouse.mapper;

import com.design.renthouse.entity.Admin;
import com.design.renthouse.entity.House;
import com.design.renthouse.entity.Page;
import com.design.renthouse.entity.Users;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {
    public Admin adminAccess(Admin admin);//管理员登录
    public Admin checkAdminPwd(Admin admin);//检查修改密码原密码
    public int updateAdminPwd(Admin admin);//修改管理员密码
    public List<Users> findAllUser();//查询所有用户
    public int deleteUser(int userId);//管理员删除用户
    public Users findUserById(int userId);//通过id查询用户
    public int updateUser(Users users);//管理员更新普通用户信息
    public List<House> findAllHouse(Page page);//查询所有房源信息
    public int findAllHouseNum();//所有房源数量
    public int deleteHouse(int houseId);//管理员删除房源信息
}
