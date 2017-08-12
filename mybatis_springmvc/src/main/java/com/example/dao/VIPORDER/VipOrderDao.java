package com.example.dao.VIPORDER;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.pojo.VIPORDER.VipOrder;
@Repository
public interface VipOrderDao {

	public List<VipOrder> selectByDate(@Param("year") String year, @Param("month") String month);
}
