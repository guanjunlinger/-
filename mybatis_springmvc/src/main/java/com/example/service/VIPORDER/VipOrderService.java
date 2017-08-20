package com.example.service.VIPORDER;

import java.util.List;
import com.example.pojo.Goods.Goods;
import com.example.pojo.ProOrder.OrderDetails;
import com.example.pojo.ProOrder.OrderItem;
import com.example.pojo.VIPORDER.VipOrder;

public interface VipOrderService {

	public List<VipOrder> selectByDate(String year, String month1,String month2);
	public float generateOrder(OrderDetails order);
	public List<VipOrder> selectUserOrderById(Integer vip_ID,String order_ID);
	public List<OrderItem> selectOrderDetailsByID(String order_ID);
}
