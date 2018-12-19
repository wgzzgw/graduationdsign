package com.design.renthouse.mapper;

import com.design.renthouse.entity.House;
import com.design.renthouse.entity.Page;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HouseMapper {
    public int addNewHouse(House house);//发布房源
    public List<House> findHouseByUser(Page page);//查询自己发布的房源
}
