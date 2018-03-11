package com.example.service.VIPRecharge;

import java.util.List;

import com.example.pojo.Discount.VIP_Recharge;
import com.example.pojo.VIP.VIP_Account;
public interface RechargeService {
	 List<VIP_Account> listVIP(Integer vip_ID);
	 int recharge(VIP_Recharge vip_Recharge);
	 int massage(VIP_Account vip_Account);
	 List<VIP_Recharge> selectRecharge(Integer vip_ID);
}
