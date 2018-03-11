package com.example.service.Discount.impl;

import com.example.dao.Discount.VipDiscountDao;
import com.example.pojo.Discount.VIP_Discount;
import com.example.service.Discount.Vip_DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class VipDiscountServiceImpl implements Vip_DiscountService{

    @Autowired
    private VipDiscountDao vipDiscountDao;


    @Override
    public int insertVipDiscount(VIP_Discount vip_discount) {
        return vipDiscountDao.insertVipDiscount(vip_discount);
    }

    @Override
    public List<VIP_Discount> selectByVIP_Level_ID(Integer vip_Level_ID) {
        return vipDiscountDao.selectByVIP_Level_ID(vip_Level_ID);
    }

    @Override
    public int updateDiscount(VIP_Discount discount) {
        return vipDiscountDao.updateVipDiscount(discount);
    }
}
