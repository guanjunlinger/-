package com.example.controller.VipOrder;

import java.util.List;

import com.example.pojo.ProOrder.ProOrder;
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
	@RequestMapping(value="/selectByDate",produces="application/json;charset=UTF-8")
	public List<VipOrder> selectByDate(@RequestParam(value="year",defaultValue="2017")String year,@RequestParam(value="month",defaultValue="07")String month){
		
		System.out.println(year+""+month);
		return vipOrderService.selectByDate(year, month);
	}
	@RequestMapping(value="/subOrder",produces="application/json;charset=UTF-8")
	@ResponseBody
	public int subOrder(@RequestBody List<ProOrder> proOrders){

		System.out.println("hahh1");
		System.out.println(proOrders);
		return 0;
	}
} 
