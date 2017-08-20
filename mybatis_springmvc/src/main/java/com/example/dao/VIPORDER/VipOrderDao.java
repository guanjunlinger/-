package com.example.dao.VIPORDER;

import java.util.List;

import com.example.pojo.Goods.Goods;
import com.example.pojo.ProOrder.OrderItem;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.pojo.VIPORDER.VipOrder;

@Repository
public interface VipOrderDao {

    public List<VipOrder> selectByDate(@Param("year") String year, @Param("month1") String month1, @Param("month2") String month2);

    public List<VipOrder> selectUserOrderById(@Param("vip_ID") Integer vip_ID, @Param("order_ID") String order_id);

    public Integer insertOrderItemById(@Param("orderItem") OrderItem orderItem, @Param("order_ID") String order_ID);

    public Integer insertOrderById(@Param("VIP_ID") String vipId, @Param("Order_ID") String orderId, @Param("Order_total") Float orderTotal);

    public List<OrderItem> selectOrderDetailsByID(@Param("order_ID") String order_ID);
}
