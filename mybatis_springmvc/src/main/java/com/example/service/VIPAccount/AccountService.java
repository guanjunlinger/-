package com.example.service.VIPAccount;

import java.util.List;

import com.example.pojo.Discount.VIP_Recharge;
import com.example.pojo.VIP.VIP_InFormation;
public interface AccountService {
	 List<VIP_InFormation> selectVIPByBalance(Integer vip_Balance);
	 int rechargeByID(VIP_Recharge vip_Recharge);
	 List<VIP_Recharge> selectrechargeRecordByID(Integer vip_ID);
}
