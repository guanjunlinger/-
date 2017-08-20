package com.example.controller.VipOrder;

import java.util.List;

import com.example.pojo.Goods.Goods;
import com.example.pojo.ProOrder.OrderDetails;
import com.example.pojo.ProOrder.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.pojo.VIPORDER.VipOrder;
import com.example.service.VIPORDER.VipOrderService;

@Controller
@RequestMapping(value="/viporder")
public class VipOrderController {

	@Autowired
	private VipOrderService vipOrderService;


	@ResponseBody
	@RequestMapping(value = "/selectByDate", produces = "application/json;charset=UTF-8")
	public List<VipOrder> selectByDate(@RequestParam(value = "year", defaultValue = "2017") String year, @RequestParam(value = "quarter", defaultValue = "0") String quarter, @RequestParam(value = "month", defaultValue = "0") String month) {
		return vipOrderService.selectByDate(year, quarter, month);
	}

	@RequestMapping(value = "/CreateOrder", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public float CreateOrder(@RequestBody OrderDetails order) {
		return vipOrderService.generateOrder(order);
	}

	@RequestMapping(value = "/selectUserOrderById", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<VipOrder> selectUserOrderById(Integer vip_ID, String order_ID) {
		return vipOrderService.selectUserOrderById(vip_ID, order_ID);
	}

	@RequestMapping(value = "/getOrderItems", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<OrderItem> getOrderItems(String order_ID) {
		return vipOrderService.selectOrderDetailsByID(order_ID);
	}
}