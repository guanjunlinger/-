package com.example.service.VIP;
import java.util.List;

import com.example.pojo.VIP.VIP_InFormation;
public interface VIPService {
public int  insertVIP(VIP_InFormation user);
public int  updateVIP(VIP_InFormation user);
public List<VIP_InFormation>   SelectVIPByID(Integer vip_ID,String vip_Name);
public List<VIP_InFormation>   SelectVIPByBirthday(Integer time);
}
