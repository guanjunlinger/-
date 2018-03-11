package com.example.controller.Recharge;

import java.util.List;

import com.example.pojo.VIP.VIP_Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.pojo.Discount.VIP_Recharge;
import com.example.pojo.VIP.VIP_InFormation;
import com.example.service.VIPRecharge.RechargeService;

@Controller
@RequestMapping(value = "/recharge")
public class RechargeController {
    @Autowired
    private RechargeService accountService;

    @ResponseBody
    @RequestMapping(value = "/listVIP", produces = "application/json;charset=UTF-8")
    public List<VIP_Account> ListVIP(@RequestParam(value = "vip_ID", required = false)
                                             Integer vip_ID) {
        return accountService.listVIP(vip_ID);
    }

    @ResponseBody
    @RequestMapping(value = "/massage", produces = "application/json;charset=UTF-8")
    public int massage(VIP_Account vip_account)
                                  {
        return accountService.massage(vip_account);
    }

    @ResponseBody
    @RequestMapping(value = "/recharge", produces = "application/json;charset=UTF-8")
    public int rechargeByID(VIP_Recharge vip_Recharge) {
        return accountService.recharge(vip_Recharge);
    }

    @ResponseBody
    @RequestMapping(value = "/selectRecharge", produces = "application/json;charset=UTF-8")
    public List<VIP_Recharge> selectRecharge(@RequestParam(value = "vip_ID",required=false) Integer vip_ID) {
        return accountService.selectRecharge(vip_ID);
    }
}	
