package com.example.dao.Account;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.pojo.Discount.Discount;
import com.example.pojo.Discount.VIP_Recharge;
import com.example.pojo.VIP.VIP_InFormation;
@Repository
public interface AccountDao {
public List<VIP_InFormation> selectVIPByBalance(Integer vip_Balance);
public List<Discount> selectrechargetype(@Param("vip_ID")Integer vip_ID,@Param("vip_Name")String vip_Name);
public int rechargeByID(VIP_Recharge vip_Recharge);
public List<VIP_Recharge> selectrechargeRecordByID(@Param("vip_ID")Integer vip_ID);
}
