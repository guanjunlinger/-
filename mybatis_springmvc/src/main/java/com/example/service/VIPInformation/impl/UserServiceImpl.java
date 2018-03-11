package com.example.service.VIPInformation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.example.dao.VIPInformation.VipDAO;
import com.example.pojo.VIP.VIP_InFormation;
import com.example.service.VIPInformation.VIPService;
@Service
public class UserServiceImpl implements VIPService{
	@Autowired
    private VipDAO vipDAO;
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	public int insertVIP(VIP_InFormation user) {
		return vipDAO.insertVIP(user);
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	public List<VIP_InFormation> SelectVIPByID(Integer vip_ID,String vip_Name) {
		return vipDAO.SelectVIPByID(vip_ID,vip_Name);
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	public int updateVIP(VIP_InFormation user) {
		return vipDAO.updateVIP(user);
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	public List<VIP_InFormation> SelectVIPByBirthday(Integer time) {
		return vipDAO.SelectVIPByBirthday(time);
	}
}
