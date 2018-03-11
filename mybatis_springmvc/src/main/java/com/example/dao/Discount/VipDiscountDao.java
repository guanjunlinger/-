package com.example.dao.Discount;

import com.example.pojo.Discount.VIP_Discount;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VipDiscountDao {

    int insertVipDiscount(VIP_Discount vip_discount);


    List<VIP_Discount> selectByVIP_Level_ID(@Param("VIP_Level_ID")Integer VIP_Level_ID);

    int updateVipDiscount(VIP_Discount discount);

}
