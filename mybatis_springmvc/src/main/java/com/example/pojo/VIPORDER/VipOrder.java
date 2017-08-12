package com.example.pojo.VIPORDER;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class VipOrder implements Serializable{

	private int vip_ID;
	private String order_ID;
	private float order_total;
	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private Date order_Time;
	private String employee_Name;
	public int getVip_ID() {
		return vip_ID;
	}
	public void setVip_ID(int vip_ID) {
		this.vip_ID = vip_ID;
	}
	public String getOrder_ID() {
		return order_ID;
	}
	public void setOrder_ID(String order_ID) {
		this.order_ID = order_ID;
	}
	public float getOrder_total() {
		return order_total;
	}
	public void setOrder_total(float order_total) {
		this.order_total = order_total;
	}
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	public Date getOrder_Time() {
		return order_Time;
	}
	public void setOrder_Time(Date order_Time) {
		this.order_Time = order_Time;
	}
	public String getEmployee_Name() {
		return employee_Name;
	}
	public void setEmployee_Name(String employee_Name) {
		this.employee_Name = employee_Name;
	}
	
	
	
	
}
