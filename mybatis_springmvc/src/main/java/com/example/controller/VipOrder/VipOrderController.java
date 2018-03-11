package com.example.controller.VipOrder;

import java.util.Calendar;
import java.util.List;
import com.example.pojo.ProOrder.OrderDetails;
import com.example.pojo.ProOrder.OrderItem;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.pojo.VipOrder.VipOrder;
import com.example.service.VIPORDER.VipOrderService;

@Controller
@RequestMapping(value = "/order")
public class VipOrderController {

    @Autowired
    private VipOrderService vipOrderService;


    @ResponseBody
    @RequestMapping(value = "/selectBill", produces = "application/json;charset=UTF-8")
    public List<VipOrder> selectByDate(@RequestParam(value = "year",required = false) String year,@RequestParam(value = "month", defaultValue = "0") String month) {
        if(year==null||year.length()==0) {
            Calendar calendar= Calendar.getInstance();
            year=String.valueOf(calendar.get(Calendar.YEAR));
        }
        return vipOrderService.selectByDate(year, month);
    }

    @RequestMapping(value = "/CreateOrder", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public float CreateOrder(@RequestBody OrderDetails order) {
        return vipOrderService.generateOrder(order);
    }

    @RequestMapping(value = "/selectUserOrderById", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List<VipOrder> selectUserOrderById(@RequestParam(value = "vip_ID",required = false) Integer vip_ID, String order_ID) {
        return vipOrderService.selectUserOrderById(vip_ID, order_ID);
    }

    @RequestMapping(value = "/getOrderItems", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public List<OrderItem> getOrderItems(String order_ID) {
        return vipOrderService.selectOrderDetailsByID(order_ID);
    }
}