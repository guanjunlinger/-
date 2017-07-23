package com.example.pojo.Discount;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class VIP_Recharge {
	private Integer vip_ID;
	public Integer getVip_ID() {
		return vip_ID;
	}
	public void setVip_ID(Integer vip_ID) {
		this.vip_ID = vip_ID;
	}
	
	public Float getRecharge_Accumulate() {
		return recharge_Accumulate;
	}
	public void setRecharge_Accumulate(Float recharge_Accumulate) {
		this.recharge_Accumulate = recharge_Accumulate;
	}
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	public Date getRecharge_Time() {
		return recharge_Time;
	}
	public Float getRecharge_Total() {
		return recharge_Total;
	}
	public void setRecharge_Total(Float recharge_Total) {
		this.recharge_Total = recharge_Total;
	}
	public Float getRecharge_Gift() {
		return recharge_Gift;
	}
	public void setRecharge_Gift(Float recharge_Gift) {
		this.recharge_Gift = recharge_Gift;
	}
	public void setRecharge_Time(Date recharge_Time) {
		this.recharge_Time = recharge_Time;
	}
	public String getEmployee_Name() {
		return employee_Name;
	}
	public void setEmployee_Name(String employee_Name) {
		this.employee_Name = employee_Name;
	}
	@Override
	public String toString() {
		return "VIP_Recharge [vip_ID=" + vip_ID + ", recharge_Total=" + recharge_Total + ", recharge_Gift="
				+ recharge_Gift + ", recharge_Accumulate=" + recharge_Accumulate + ", recharge_Time=" + recharge_Time
				+ ", employee_Name=" + employee_Name + "]";
	}
	private Float recharge_Total;//充值金额
	private Float recharge_Gift;//赠送金额
	private Float recharge_Accumulate;//累计金额
	private Date recharge_Time;
	private String employee_Name;
}
