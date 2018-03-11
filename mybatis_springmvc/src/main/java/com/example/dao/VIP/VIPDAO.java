package com.example.dao.VIP;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.example.pojo.VIP.VIP_InFormation;
@Repository
public interface VIPDAO {
 int  insertVIP(VIP_InFormation user);
 int  updateVIP(VIP_InFormation user);
 List<VIP_InFormation>  SelectVIPByID(@Param("vip_ID")Integer vip_ID,@Param("vip_Name")String vip_Name);
 List<VIP_InFormation> SelectVIPByBirthday(Integer time);
}
