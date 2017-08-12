package com.example.service.VIPORDER.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.VIPORDER.VipOrderDao;
import com.example.pojo.VIPORDER.VipOrder;
import com.example.service.VIPORDER.VipOrderService;

@Service
public class VipOrderServiceImpl implements VipOrderService {
	
	@Autowired
	private VipOrderDao vipOrderDao;

	
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)

	public List<VipOrder> selectByDate(String year, String month) {
		// TODO Auto-generated method stub
		return vipOrderDao.selectByDate(year, month);
	}

}
