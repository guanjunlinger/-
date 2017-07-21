package com.example.service.VIPAccount;

import java.util.List;

import com.example.pojo.VIP.VIP_InFormation;
public interface AccountService {
	public List<VIP_InFormation> selectVIPByBalance(Integer vip_Balance);
}
