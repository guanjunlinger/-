package com.example.dao.Recharge;

import java.util.List;

import com.example.pojo.VIP.VIP_Account;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.example.pojo.Discount.VIP_Recharge;

@Repository
public interface RechargeDao {
    int recharge_insert_VIP_Recharge(VIP_Recharge vip_Recharge);

    int recharge_insert_VIP_Level(VIP_Recharge vip_Recharge);

    List<VIP_Recharge> selectRecharge(@Param("vip_ID") Integer vip_ID);

    List<VIP_Account> listVIP(@Param("vip_ID")Integer vip_ID);

    int massage(VIP_Account vip_Account);
    int clear();
}
