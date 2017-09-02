package com.example.service.Discount;

import com.example.pojo.Discount.Discount;
import com.example.pojo.Discount.VDisccount;

import java.util.List;

public interface DisService {

    public int insertDis(Discount discount);

    public List<Discount> selectBytotal(float discount_total);

    public List<VDisccount> selectBysome(Integer vip_Level,Integer discount_ID);

    public int updateDis(Discount discount);
}
