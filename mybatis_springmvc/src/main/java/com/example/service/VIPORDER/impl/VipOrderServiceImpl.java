package com.example.service.VIPORDER.impl;

import java.util.List;

import com.example.dao.Goods.GoodsDao;
import com.example.pojo.Goods.Goods;
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
	@Override
	public List<VipOrder> selectByDate(String year, String quarter,String month) {
		String startMonth="";
		String endMonth="";
		if(month.equals("0"))
		{
			if(quarter.equals("0"))
			{
				startMonth="01";
				endMonth="12";
			}
			else if(quarter.equals("1"))
			{
				startMonth="01";
				endMonth="03";
			}
			else if(quarter.equals("2"))
			{
				startMonth="04";
				endMonth="06";
			}
			else if(quarter.equals("3"))
			{
				startMonth="07";
				endMonth="09";
			}
			else if(quarter.equals("4"))
			{
				startMonth="10";
				endMonth="12";
			}
		}else
		{
			if(quarter.equals("0")) {
				startMonth = endMonth = month;
			}
		}
		return vipOrderDao.selectByDate(year,startMonth,endMonth);
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public float generateOrder(OrderDetails order) {
	float sum=0;
	System.out.println(order);
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
