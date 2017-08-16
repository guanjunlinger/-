package com.example.pojo.OrderDetails;

public class OrderItem {
    private int product_ID;
    private  int product_Num;

    @Override
    public String toString() {
        return "OrderItem{" +
                "product_ID=" + product_ID +
                ", product_Num=" + product_Num +
                '}';
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

}
