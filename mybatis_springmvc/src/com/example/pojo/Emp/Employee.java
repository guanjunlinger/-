package com.example.pojo.Emp;

public class Employee {

	private String employee_Name;
	private String employee_Password;
	private String employee_Level;
	public String getEmployee_Name() {
		return employee_Name;
	}
	public void setEmployee_Name(String employee_Name) {
		this.employee_Name = employee_Name;
	}
	public String getEmployee_Password() {
		return employee_Password;
	}
	public void setEmployee_Password(String employee_Password) {
		this.employee_Password = employee_Password;
	}
	public String getEmployee_Level() {
		return employee_Level;
	}
	public void setEmployee_Level(String employee_Level) {
		this.employee_Level = employee_Level;
	}
	@Override
	public String toString() {
		return "Employee [employee_Name=" + employee_Name + ", employee_Password=" + employee_Password
				+ ", employee_Level=" + employee_Level + "]";
	}
	
	
	
	
}
