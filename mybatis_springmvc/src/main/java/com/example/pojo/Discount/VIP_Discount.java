package com.example.pojo.Discount;

public class VIP_Discount {

    protected Integer vip_Level_ID;
    protected String level_Description;
    protected Integer discount_count;
    protected Integer discount_price;

    public Integer getVip_Level_ID() {
        return vip_Level_ID;
    }

    public void setVip_Level_ID(Integer vip_Level_ID) {
        this.vip_Level_ID = vip_Level_ID;
    }

    public String getLevel_Description() {
        return level_Description;
    }

    public void setLevel_Description(String level_Description) {
        this.level_Description = level_Description;
    }

    public Integer getDiscount_count() {
        return discount_count;
    }

    public void setDiscount_count(Integer discount_count) {
        this.discount_count = discount_count;
    }

    public Integer getDiscount_price() {
        return discount_price;
    }

    public void setDiscount_price(Integer discount_price) {
        this.discount_price = discount_price;
    }

    @Override
    public String toString() {
        return "VIP_Discount{" +
                "vip_Level_ID=" + vip_Level_ID +
                ", level_Description='" + level_Description + '\'' +
                ", discount_count=" + discount_count +
                ", discount_price=" + discount_price +
                '}';
    }
}
