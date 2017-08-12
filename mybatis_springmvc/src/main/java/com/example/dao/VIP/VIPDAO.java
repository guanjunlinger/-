package com.example.dao.VIP;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.example.pojo.VIP.VIP_InFormation;
@Repository
public interface VIPDAO {
public int  insertVIP(VIP_InFormation user);
public int  updateVIP(VIP_InFormation user);
public List<VIP_InFormation>  SelectVIPByID(@Param("vip_ID")Integer vip_ID,@Param("vip_Name")String vip_Name);
public List<VIP_InFormation> SelectVIPByBirthday(Integer time);
}
