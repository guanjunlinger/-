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
	public List<VipOrder> selectByDate(@RequestParam(value="year",defaultValue="2017")String year,@RequestParam(value="quarter",defaultValue = "0")String quarter,@RequestParam(value="month",defaultValue="0")String month){


		String month1="",month2="";
		if(month.equals("0"))
		{
			if(quarter.equals("0"))
			{
				month1="01";
				month2="12";
			}
			else if(quarter.equals("1"))
			{
				month1="01";
				month2="03";
			}
			else if(quarter.equals("2"))
			{
				month1="04";
				month2="06";
			}
			else if(quarter.equals("3"))
			{
				month1="07";
				month2="09";
			}
			else if(quarter.equals("4"))
			{
				month1="10";
				month2="12";
			}
		}else
		{
			month1=month2=month;
		}
		return vipOrderService.selectByDate(year,month1,month2);
	}
	@RequestMapping(value="/subOrder",produces="application/json;charset=UTF-8")
	@ResponseBody
	public int subOrder(@RequestBody List<ProOrder> proOrders){

		System.out.println("hahh1");
		System.out.println(proOrders);
		return 0;
	}
} 
