package com.example.service.VIPAccountImpl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.Account.AccountDao;
import com.example.pojo.Discount.Discount;
import com.example.pojo.VIP.VIP_InFormation;
import com.example.service.VIPAccount.AccountService;
@Service
public class AccountImpl implements AccountService {
	@Autowired
	AccountDao  accountDao;
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public List<VIP_InFormation> selectVIPByBalance(Integer vip_Balance) {
		return accountDao.selectVIPByBalance(vip_Balance);
	}
	public List<Discount> selectrechargetype(Integer vip_ID,String vip_Name){
        return accountDao.selectrechargetype(vip_ID, vip_Name);		
	}
}
