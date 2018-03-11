package com.example.pojo.Discount;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonFormat;

@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.PROTECTED_AND_PUBLIC)
public class VIP_Recharge extends VIP_Discount {
    private Integer vip_ID;
    private Date recharge_Time;



    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    public Date getRecharge_Time() {
        return recharge_Time;
    }

    public void setRecharge_Time(Date recharge_Time) {
        this.recharge_Time = recharge_Time;
    }

    public Integer getVip_ID() {
        return vip_ID;
    }

    public void setVip_ID(Integer vip_ID) {
        this.vip_ID = vip_ID;
    }
}
