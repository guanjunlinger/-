package com.example.dao.Account;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.pojo.Discount.VIP_Recharge;
import com.example.pojo.VIP.VIP_InFormation;
@Repository
public interface AccountDao {
 List<VIP_InFormation> selectVIPByBalance(Integer vip_Balance);
 int rechargeByID(VIP_Recharge vip_Recharge);
 List<VIP_Recharge> selectrechargeRecordByID(@Param("vip_ID")Integer vip_ID);
}
