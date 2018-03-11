package com.example.service.Discount;

import com.example.pojo.Discount.VIP_Discount;

import java.util.List;

public interface Vip_DiscountService {
    int insertVipDiscount(VIP_Discount vip_discount);

    List<VIP_Discount> selectByVIP_Level_ID(Integer vip_Level);

    int updateDiscount(VIP_Discount discount);

}
