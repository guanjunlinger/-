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

import com.example.dao.VIPORDER.VipOrderDao;
import com.example.pojo.VIPORDER.VipOrder;
import com.example.service.VIPORDER.VipOrderService;

@Service
public class VipOrderServiceImpl implements VipOrderService {
	
	@Autowired
	private VipOrderDao vipOrderDao;
	@Autowired
	private GoodsDao goodsDao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)

	public List<VipOrder> selectByDate(String year, String month1,String month2) {
		return vipOrderDao.selectByDate(year, month1,month2);
	}

	public Integer generateOrder(OrderDetails order) {
	float sum=0;
	System.out.println(order);
	String order_id= StringUtil.generateOrderID(order.getVip_ID());
	for(OrderItem orderItem:order.getItemList()){
	float price=goodsDao.selectById(orderItem.getProduct_ID()).get(0).getProduct_Price();
	sum+=price*orderItem.getProduct_Num();
	vipOrderDao.insertOrderItemById(orderItem,order_id);
	}
    vipOrderDao.insertOrderById(order.getVip_ID(),order_id,sum);
	System.out.println(sum);
	return (int) sum;
	}


	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	public List<VipOrder> selectByIds(Integer vip_ID, String order_ID) {
		return vipOrderDao.selectByIds(vip_ID,order_ID);
	}


}
