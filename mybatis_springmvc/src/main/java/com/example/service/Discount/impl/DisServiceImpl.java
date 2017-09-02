package com.example.service.Discount.impl;

import com.example.dao.Discount.DiscountDao;
import com.example.pojo.Discount.Discount;
import com.example.pojo.Discount.VDisccount;
import com.example.service.Discount.DisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DisServiceImpl implements DisService {

    @Autowired
    private DiscountDao discountDao;

    @Transactional(propagation= Propagation.REQUIRES_NEW,isolation= Isolation.REPEATABLE_READ)
    public int insertDis(Discount discount) {
        return discountDao.insertDis(discount);
    }

    @Transactional(propagation= Propagation.REQUIRES_NEW,isolation= Isolation.REPEATABLE_READ)
    public List<Discount> selectBytotal(float discount_total) {
        return discountDao.selectBytotal(discount_total);
    }

    @Transactional(propagation= Propagation.REQUIRES_NEW,isolation= Isolation.REPEATABLE_READ)
    public List<VDisccount> selectBysome(Integer vip_Level, Integer discount_ID) {


        return discountDao.selectBysome(vip_Level,discount_ID);
    }

    @Transactional(propagation= Propagation.REQUIRES_NEW,isolation= Isolation.REPEATABLE_READ)
    public int updateDis(Discount discount) {
        return discountDao.updateDis(discount);
    }
}
