package com.example.service.VIPAccountImpl;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.example.dao.Account.AccountDao;
import com.example.pojo.Discount.VIP_Recharge;
import com.example.pojo.VIP.VIP_InFormation;
import com.example.service.VIPAccount.AccountService;
@Service
public class AccountImpl implements AccountService {
	@Autowired
	AccountDao  accountDao;
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	public List<VIP_InFormation> selectVIPByBalance(Integer vip_Balance) {
		return accountDao.selectVIPByBalance(vip_Balance);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public int rechargeByID(VIP_Recharge vip_Recharge){
      float total=vip_Recharge.getRecharge_Total().floatValue()+vip_Recharge.getRecharge_Gift().floatValue();		
      vip_Recharge.setRecharge_Accumulate(Float.valueOf(total));
      vip_Recharge.setRecharge_Time(new Date());
      vip_Recharge.setEmployee_Name("guanjun");
	return accountDao.rechargeByID(vip_Recharge);
	}
	public List<VIP_Recharge> selectrechargeRecordByID(Integer vip_ID){
	return 	accountDao.selectrechargeRecordByID(vip_ID);
	}
}
