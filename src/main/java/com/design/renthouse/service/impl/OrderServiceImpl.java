package com.design.renthouse.service.impl;

import com.design.renthouse.entity.Order;
import com.design.renthouse.entity.Page;
import com.design.renthouse.entity.UserOrder;
import com.design.renthouse.mapper.OrderMapper;
import com.design.renthouse.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Component
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private OrderMapper mapper;
    @Override
    public int addOrder(Order order) {
        return mapper.addOrder(order);
    }
    @Override
    public List<UserOrder> findAllOrder(Page page) {
        return mapper.findAllOrder(page);
    }

    @Override
    public int getOrderCount(int uID) {
        return mapper.getOrderCount(uID);
    }
    @Override
    public int deleteOrder(int oID) {
        return mapper.deleteOrder(oID);
    }
}
