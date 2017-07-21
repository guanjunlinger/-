package com.example.dao.Account;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.pojo.VIP.VIP_InFormation;
@Repository
public interface AccountDao {
public List<VIP_InFormation> selectVIPByBalance(Integer vip_Balance);
}
