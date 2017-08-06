package com.example.service.VIPAccount;

import java.util.List;
import com.example.pojo.Discount.Discount;
import com.example.pojo.Discount.VIP_Recharge;
import com.example.pojo.VIP.VIP_InFormation;
public interface AccountService {
	public List<VIP_InFormation> selectVIPByBalance(Integer vip_Balance);
	public List<Discount> selectrechargetype(Integer vip_ID,String vip_Name);
	public int rechargeByID(VIP_Recharge vip_Recharge);
	public List<VIP_Recharge> selectrechargeRecordByID(Integer vip_ID);
}
