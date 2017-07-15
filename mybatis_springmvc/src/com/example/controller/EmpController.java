package com.example.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.pojo.Emp.Employee;
import com.example.service.Emp.EmpService;
@Controller
@RequestMapping(value="/emp")
public class EmpController {

	@Autowired
	private EmpService empService;
	
	@ResponseBody 
	@RequestMapping(value="/login",produces="application/json;charset=UTF-8")
	public int login(@ModelAttribute("emp")Employee emp){
		System.out.println(emp.toString());
		Employee toemp=empService.getEmp(emp.getEmployee_Name());
		if(toemp!=null)
		{
			if(toemp.getEmployee_Password().equals(emp.getEmployee_Password()))
			{
				return 2;
			}
			else
				return 1;
		}
		return 0;		
	}
}
