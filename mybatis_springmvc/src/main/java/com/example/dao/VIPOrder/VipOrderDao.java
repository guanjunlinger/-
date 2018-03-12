package com.example.dao.VIPOrder;

import java.util.List;

import com.example.pojo.ProOrder.OrderItem;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.pojo.VipOrder.VipOrder;

@Repository
public interface VipOrderDao {

     List<VipOrder> selectByDate(@Param("year") String year,@Param("start") String start,@Param("end") String end);

     List<VipOrder> selectUserOrderById(@Param("vip_ID") Integer vip_ID, @Param("order_ID") String order_ID);

     Integer insertOrderItemById(@Param("orderItem")OrderItem orderItem, @Param("order_ID")String order_ID);

     Integer insertOrderById(@Param("vip_ID") String vip_ID,  @Param("order_ID") String orderId,@Param("orderTotal") Float orderTotal);

     List<OrderItem> selectOrderDetailsByID(@Param("order_ID") String order_ID);
}
