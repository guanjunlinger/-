package com.example.dao.VIPORDER;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.pojo.VIPORDER.VipOrder;
@Repository
public interface VipOrderDao {

	public List<VipOrder> selectByDate(@Param("year") String year, @Param("month1") String  month1,@Param("month2") String  month2);


	public List<VipOrder> selectByIds(@Param("vip_ID")Integer vip_ID,@Param("order_id")String order_id);
}
