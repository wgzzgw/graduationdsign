package com.design.renthouse.service;

import com.design.renthouse.entity.House;
import com.design.renthouse.entity.Page;

import java.util.List;

public interface IHouserService {
    /**
     * 添加房源信息
     * @param house
     * @return
     */
    public int addNewHouse(House house);
    /**
     * 查询用户发布的房源信息
     * @param
     * @return
     */
    public List<House> findHouseByUser(Page page);
    /**
     * 查询用户发布的房源信息
     * @param
     * @return
     */
    public List<House> findAllHouseByUser(Page page);
    /**
     *  删除用户发布的房源信息
     * @param houseId
     * @return
     */
    public int deleteUserHouse(int houseId);
    /**
     * 通过id查询房屋详情
     * @param houseId
     * @return
     */
    public House findHouseDetailsById(int houseId);

}
