package com.example.pojo.ProOrder;

public class OrderItem {
    private String product_Description;
    private int product_ID;
    private float product_Price;

    public float getProduct_Price() {
        return product_Price;
    }

    public void setProduct_Price(float product_Price) {
        this.product_Price = product_Price;
    }

    public String getProduct_Description() {
        return product_Description;
    }

    public void setProduct_Description(String product_Description) {
        this.product_Description = product_Description;
    }

    private  int product_Num;
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
        return "OrderItem{" +
                "product_Description='" + product_Description + '\'' +
                ", product_ID=" + product_ID +
                ", product_Price=" + product_Price +
                ", product_Num=" + product_Num +
                '}';
    }
}
