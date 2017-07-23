package com.example.service.Emp;

import com.example.pojo.Emp.Employee;

public interface EmpService {

	public Employee getEmp(String employee_Name);
	
	public int addEmp(Employee emp);
	
	public int updateEmp(Employee emp);
}
