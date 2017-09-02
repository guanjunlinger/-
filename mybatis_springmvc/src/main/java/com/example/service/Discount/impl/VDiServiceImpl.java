package com.example.service.Discount.impl;

import com.example.dao.Discount.DiscountDao;
import com.example.pojo.Discount.VIP_Discount;
import com.example.service.Discount.VDisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VDiServiceImpl implements VDisService{

    @Autowired
    private DiscountDao discountDao;

    @Transactional(propagation= Propagation.REQUIRES_NEW,isolation= Isolation.REPEATABLE_READ)
    public int insertVIPDis(VIP_Discount vdiscount) {
        return discountDao.insertVipDis(vdiscount);
    }
}
