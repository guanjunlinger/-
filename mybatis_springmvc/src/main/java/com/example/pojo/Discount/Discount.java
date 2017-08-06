package com.example.pojo.Discount;

public class Discount {
@Override
	public String toString() {
		return "Discount [discount_ID=" + discount_ID + ", discount_total=" + discount_total + ", discount_gift="
				+ discount_gift + "]";
	}
private Integer discount_ID;
private Float discount_total;
private Float discount_gift;
public Integer getDiscount_ID() {
	return discount_ID;
}
public void setDiscount_ID(Integer discount_ID) {
	this.discount_ID = discount_ID;
}
public Float getDiscount_total() {
	return discount_total;
}
public void setDiscount_total(Float discount_total) {
	this.discount_total = discount_total;
}
public Float getDiscount_gift() {
	return discount_gift;
}
public void setDiscount_gift(Float discount_gift) {
	this.discount_gift = discount_gift;
}
}
