package com.example.dao.Discount;

import com.example.pojo.Discount.Discount;
import com.example.pojo.Discount.VDisccount;
import com.example.pojo.Discount.VIP_Discount;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiscountDao {

    public int insertDis(Discount discount);

    public int insertVipDis(VIP_Discount vdiscount);

    public List<Discount> selectBytotal(@Param("discount_total") float discount_total);

    public List<VDisccount> selectBysome(@Param("vip_Level")Integer vip_Level,@Param("discount_ID")Integer discount_ID);

    public int updateDis(Discount discount);

}
