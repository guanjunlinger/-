package com.example.pojo.ProOrder;

import java.util.List;

public class OrderDetails {
    @Override
    public String toString() {
        return "OrderDetails{" +
                "vip_ID='" + vip_ID + '\'' +
                ", itemList=" + itemList +
                '}';
    }

    private String vip_ID;
    private List<OrderItem> itemList;

    public String getVip_ID() {
        return vip_ID;
    }

    public void setVip_ID(String vip_ID) {
        this.vip_ID = vip_ID;
    }

    public List<OrderItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<OrderItem> itemList) {
        this.itemList = itemList;
    }
}

