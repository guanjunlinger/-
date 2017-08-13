package com.example.pojo.ProOrder;

public class ProOrder {

    private String order_id;

    private int product_ID;

    private  int product_Num;

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public int getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(int product_ID) {
        this.product_ID = product_ID;
    }

    public int getProduct_Num() {
        return product_Num;
    }

    public void setProduct_Num(int product_Num) {
        this.product_Num = product_Num;
    }

    @Override
    public String toString() {
        return "ProOrder{" +
                "order_id='" + order_id + '\'' +
                ", product_ID=" + product_ID +
                ", product_Num=" + product_Num +
                '}';
    }
}
