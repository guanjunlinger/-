package com.example.dao.Emp;
import org.springframework.stereotype.Repository;
import com.example.pojo.Emp.Employee;
@Repository
public interface EmpDao {

	public Employee getEmp(String employee_Name);
}
