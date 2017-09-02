package com.example.pojo.Discount;

public class VIP_Discount {

    private Integer vip_Level;
    private String level_Description;
    private Integer discount_ID;

    public Integer getVip_Level() {
        return vip_Level;
    }

    public String getLevel_Description() {
        return level_Description;
    }

    public Integer getDiscount_ID() {
        return discount_ID;
    }

    public void setVip_Level(Integer vip_Level) {
        this.vip_Level = vip_Level;
    }

    public void setLevel_Description(String level_Description) {
        this.level_Description = level_Description;
    }

    public void setDiscount_ID(Integer discount_ID) {
        this.discount_ID = discount_ID;
    }
}
