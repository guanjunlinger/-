package com.example.service.VIPRecharge.impl;

import java.util.Date;
import java.util.List;

import com.example.pojo.VIP.VIP_Account;
import com.example.service.VIPRecharge.RechargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.example.dao.Recharge.RechargeDao;
import com.example.pojo.Discount.VIP_Recharge;

@Service
public class RechargeImpl implements RechargeService {
    @Autowired
    RechargeDao rechargeDao;

    @Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.REPEATABLE_READ)
    public List<VIP_Account> listVIP(Integer vip_ID) {
        return rechargeDao.listVIP(vip_ID);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.REPEATABLE_READ)
    @Override
    public int recharge(VIP_Recharge vip_Recharge) {
        vip_Recharge.setRecharge_Time(new Date());
        rechargeDao.recharge_insert_VIP_Recharge(vip_Recharge);
        return rechargeDao.recharge_insert_VIP_Level(vip_Recharge);
    }

    @Override
    public int massage(VIP_Account vip_Account) {
        if (vip_Account.getRemains() >= 1) {

            int flag = rechargeDao.massage(vip_Account);
            rechargeDao.clear();//清除过期的映射
            return flag;

        } else if (vip_Account.getRemains() == -1) {
            rechargeDao.clear();
            return 1;
        } else
            return 0;
    }

    public List<VIP_Recharge> selectRecharge(Integer vip_ID) {
        return rechargeDao.selectRecharge(vip_ID);
    }
}
