package com.example.controller.Discount;

import com.example.pojo.Discount.Discount;
import com.example.pojo.Discount.VDisccount;
import com.example.pojo.Discount.VIP_Discount;
import com.example.service.Discount.DisService;
import com.example.service.Discount.VDisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value="/dis")
public class DisController {

    @Autowired
    private DisService disService;

    @Autowired
    private VDisService vDisService;

    @ResponseBody
    @RequestMapping(value="/insertDis",produces="application/json;charset=UTF-8")
    public int insertDis(Discount discount, VIP_Discount vdiscount){

        if(disService.insertDis(discount)==1)
        {
            vdiscount.setDiscount_ID(discount.getDiscount_ID());
            if(vDisService.insertVIPDis(vdiscount)==1)
                return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="/selectBytotal",produces="application/json;charset=UTF-8")
    public List<Discount> selectBytotal(@RequestParam(value="discount_total",required=false,defaultValue="0")float discount_total){


        return disService.selectBytotal(discount_total);
    }
    @ResponseBody
    @RequestMapping(value="/selectBysome",produces="application/json;charset=UTF-8")
    public List<VDisccount> selectBysome(Integer vip_Level,Integer discount_ID){

        return disService.selectBysome(vip_Level,discount_ID);
    }

    @ResponseBody
    @RequestMapping(value="/updateDis",produces="application/json;charset=UTF-8")
    public int updateDis(Discount discount){
        return disService.updateDis(discount);
    }
}
