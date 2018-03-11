package com.example.controller.Discount;

import com.example.pojo.Discount.VIP_Discount;
import com.example.service.Discount.Vip_DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/discount")
public class DiscountController {

    @Autowired
    private Vip_DiscountService vip_discountService;

    @ResponseBody
    @RequestMapping(value = "/insertDiscount", produces = "application/json;charset=UTF-8")
    public int insertDiscount(VIP_Discount vipDiscount) {
        return vip_discountService.insertVipDiscount(vipDiscount);
    }


    @ResponseBody
    @RequestMapping(value = "/selectByVIP_Level_ID", produces = "application/json;charset=UTF-8")
    public List<VIP_Discount> selectByVIP_Level_ID(@RequestParam(value = "vip_Level_ID",required = false)Integer vip_Level_ID) {

        return vip_discountService.selectByVIP_Level_ID(vip_Level_ID);
    }

    @ResponseBody
    @RequestMapping(value = "/updateVipDiscount", produces = "application/json;charset=UTF-8")
    public int updateVipDiscount(VIP_Discount discount) {
        return vip_discountService.updateDiscount(discount);
    }
}
