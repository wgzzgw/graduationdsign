package com.design.renthouse.mapper;

import com.design.renthouse.entity.Order;
import com.design.renthouse.entity.Page;
import com.design.renthouse.entity.UserOrder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderMapper {
    public int addOrder(Order order);//添加房屋订单
    public List<UserOrder> findAllOrder(Page page);//查询所有订单信息
    public int getOrderCount(int userId);//查询所有订单数
    public int deleteOrder(int oID);//删除用户订单
}
