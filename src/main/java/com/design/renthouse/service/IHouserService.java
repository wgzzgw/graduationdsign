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
}
