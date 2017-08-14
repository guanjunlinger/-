package com.example.service.VIPORDER;

import java.util.List;

import com.example.pojo.VIPORDER.VipOrder;

public interface VipOrderService {

	public List<VipOrder> selectByDate(String year, String month1,String month2);
}
