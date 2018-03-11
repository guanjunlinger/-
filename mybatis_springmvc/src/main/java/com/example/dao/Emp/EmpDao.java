package com.example.dao.Emp;
import org.springframework.stereotype.Repository;
import com.example.pojo.Emp.Employee;
@Repository
public interface EmpDao {

	 Employee getEmp(String employee_Name);
	
	 int addEmp(Employee emp);
	
	 int updateEmp(Employee emp);
}
