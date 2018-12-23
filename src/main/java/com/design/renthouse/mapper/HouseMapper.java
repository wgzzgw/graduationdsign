package com.design.renthouse.mapper;

import com.design.renthouse.entity.House;
import com.design.renthouse.entity.Page;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HouseMapper {
    public int addNewHouse(House house);//发布房源
    public List<House> findHouseByUser(Page page);//查询自己发布的房源
    public List<House> findAllHouseByUser(Page page);//查询自己发布的房源总数
    public int deleteUserHouse(int houseId);//删除用户发布的房源信息
    public House findHouseDetailsById(int houseId);//通过id查询房屋详情
    public int updateHouse(House house);//修改用户发布的房源信息
    public List<House> findHomeInfo();//首页信息展示
    public List<House> findHouseByLike(String keywords);//条件查询
    public List<House> findHouseOrderByDesc();//降序查询
    public List<House> findHouseOrderByAsc();//升序查询

}
