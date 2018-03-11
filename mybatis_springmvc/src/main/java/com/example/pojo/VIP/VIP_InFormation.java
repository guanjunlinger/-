package com.example.pojo.VIP;
import java.io.Serializable;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
public class VIP_InFormation implements Serializable{
	private static final long serialVersionUID = 1L;
    private int vip_ID;

	public int getVip_ID() {
		return vip_ID;
	}

	public void setVip_ID(int vip_ID) {
		this.vip_ID = vip_ID;
	}

	private String vip_Name;
    private String vip_Gender;
    @DateTimeFormat(pattern="yyyy-MM-dd") 
    private Date vip_Birthday;
    private String vip_Telephone;
    private int vip_Age;
    private String vip_Address;
    @DateTimeFormat(pattern="yyyy-MM-dd") 
    private Date vip_Time;

	public String getvip_Name() {
		return vip_Name;
	}
	public void setvip_Name(String vIP_Name) {
		vip_Name = vIP_Name;
	}
	public String getvip_Gender() {
		return vip_Gender;
	}
	public void setvip_Gender(String vIP_Gender) {
		vip_Gender = vIP_Gender;
	}
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	public Date getvip_Birthday() {
		return vip_Birthday;
	}
	public void setvip_Birthday(Date vIP_Birthday) {
		vip_Birthday = vIP_Birthday;
	}
	public String getvip_Telephone() {
		return vip_Telephone;
	}
	public void setvip_Telephone(String vIP_Telephone) {
		vip_Telephone = vIP_Telephone;
	}
	public int getvip_Age() {
		return vip_Age;
	}
	public void setvip_Age(int vIP_Age) {
		vip_Age = vIP_Age;
	}
	public String getvip_Address() {
		return vip_Address;
	}
	public void setvip_Address(String vIP_Address) {
		vip_Address = vIP_Address;
	}

	@Override
	public String toString() {
		return "VIP_InFormation{" +
				"vip_ID=" + vip_ID +
				", vip_Name='" + vip_Name + '\'' +
				", vip_Gender='" + vip_Gender + '\'' +
				", vip_Birthday=" + vip_Birthday +
				", vip_Telephone='" + vip_Telephone + '\'' +
				", vip_Age=" + vip_Age +
				", vip_Address='" + vip_Address + '\'' +
				", vip_Time=" + vip_Time +
				'}';
	}

	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
	public Date getvip_Time() {
		return vip_Time;
	}
	public void setvip_Time(Date vIP_Time) {
		vip_Time = vIP_Time;
	}
	
    
}
