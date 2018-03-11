package com.example.service.VIPORDER.impl;

import java.util.List;

import com.example.dao.Goods.GoodsDao;
import com.example.pojo.ProOrder.OrderDetails;
import com.example.pojo.ProOrder.OrderItem;
import com.example.pojo.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.VIPOrder.VipOrderDao;
import com.example.pojo.VipOrder.VipOrder;
import com.example.service.VIPORDER.VipOrderService;

@Service
public class VipOrderServiceImpl implements VipOrderService {
	
	@Autowired
	private VipOrderDao vipOrderDao;
	@Autowired
	private GoodsDao goodsDao;

	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public List<VipOrder> selectByDate(String year,String month) {
		if(month.equals("0"))
		return	vipOrderDao.selectByDate(year,"1","12")	;
		else
		return	vipOrderDao.selectByDate(year,month,month);
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public float generateOrder(OrderDetails order) {
	float sum=0;
	String order_id= StringUtil.generateOrderID(order.getVip_ID());
	for(OrderItem orderItem:order.getItemList()){
	float price=goodsDao.selectById(orderItem.getProduct_ID()).get(0).getProduct_Price();
	sum+=price*orderItem.getProduct_Num();
	vipOrderDao.insertOrderItemById(orderItem,order_id);
	}
    vipOrderDao.insertOrderById(order.getVip_ID(),order_id,sum);
	return  sum;
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public List<VipOrder> selectUserOrderById(Integer vip_ID, String order_ID) {
		return vipOrderDao.selectUserOrderById(vip_ID,order_ID);
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public List<OrderItem> selectOrderDetailsByID(String order_ID) {
		return vipOrderDao.selectOrderDetailsByID(order_ID);
	}


}
