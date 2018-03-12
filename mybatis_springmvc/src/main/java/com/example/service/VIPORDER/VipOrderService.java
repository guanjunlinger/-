package com.example.service.VIPORDER;

import java.util.List;

import com.example.pojo.ProOrder.OrderDetails;
import com.example.pojo.ProOrder.OrderItem;
import com.example.pojo.VipOrder.VipOrder;
import org.apache.ibatis.annotations.Param;

public interface VipOrderService {

 List<VipOrder> selectByDate(String year,String month);
 float generateOrder(OrderDetails order);
 List<VipOrder> selectUserOrderById(Integer vip_ID, String order_ID);
 List<OrderItem> selectOrderDetailsByID(String order_ID);
}
