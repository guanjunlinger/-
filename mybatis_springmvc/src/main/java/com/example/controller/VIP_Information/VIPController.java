package com.example.controller.VIP_Information;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.pojo.VIP.VIP_InFormation;
import com.example.service.VIP.VIPService;

@Controller
@RequestMapping(value="/vip")
public class VIPController {
@Autowired
private VIPService vipService;
@ResponseBody  
@RequestMapping(value="/insertvip",produces="application/json;charset=UTF-8")
public int insertUser(VIP_InFormation user){
return vipService.insertVIP(user);	
}
@ResponseBody  
@RequestMapping(value="/selectvip",produces="application/json;charset=UTF-8")
public List<VIP_InFormation> selectUser(Integer vip_ID,String vip_Name){
List<VIP_InFormation> information=vipService.SelectVIPByID(vip_ID,vip_Name);
return information;
}
@ResponseBody  
@RequestMapping(value="/updatevip",produces="application/json;charset=UTF-8")
public int  updateVIP (VIP_InFormation user){
System.out.println(user.toString());	
return  vipService.updateVIP(user);

}
@ResponseBody
@RequestMapping(value="/selectbir",produces="application/json;charset=UTF-8")
public List<VIP_InFormation> SelectVIPByBirthday(@RequestParam(value="time",required=false,defaultValue="7") Integer time){
	return vipService.SelectVIPByBirthday(time);
}
}
