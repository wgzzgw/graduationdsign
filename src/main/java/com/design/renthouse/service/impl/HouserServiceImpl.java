package com.design.renthouse.service.impl;

import com.design.renthouse.entity.House;
import com.design.renthouse.entity.Page;
import com.design.renthouse.mapper.HouseMapper;
import com.design.renthouse.service.IHouserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
public class HouserServiceImpl implements IHouserService {
    @Autowired
    private HouseMapper mapper;
    @Override
    public int addNewHouse(House house) {
        return mapper.addNewHouse(house);
    }
    @Override
    public List<House> findHouseByUser(Page page) {
        return mapper.findHouseByUser(page);
    }

    @Override
    public List<House> findAllHouseByUser(Page page) {
        return mapper.findAllHouseByUser(page);
    }
    @Override
    public int deleteUserHouse(int houseId) {
        return mapper.deleteUserHouse(houseId);
    }
    @Override
    public House findHouseDetailsById(int houseId) {
        return mapper.findHouseDetailsById(houseId);
    }
    @Override
    public int updateHouse(House house) {
        return mapper.updateHouse(house);
    }
    @Override
    public List<House> findHomeInfo() {
        return mapper.findHomeInfo();
    }
    @Override
    public List<House> findHouseByLike(String keywords) {
        return mapper.findHouseByLike(keywords);
    }
    @Override
    public List<House> findHouseOrderByAsc() {
        return mapper.findHouseOrderByAsc();
    }
    @Override
    public List<House> findHouseOrderByDesc() {
        return mapper.findHouseOrderByDesc();
    }
}
