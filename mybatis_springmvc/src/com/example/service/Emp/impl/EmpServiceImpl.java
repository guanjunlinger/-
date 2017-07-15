package com.example.service.Emp.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.example.dao.Emp.EmpDao;
import com.example.pojo.Emp.Employee;
import com.example.service.Emp.EmpService;

@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpDao empDao;	
	@Transactional(propagation=Propagation.REQUIRES_NEW,isolation=Isolation.REPEATABLE_READ)
	@Override
	public Employee getEmp(String employee_Name) {
		return empDao.getEmp(employee_Name);
	}
}
