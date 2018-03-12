package com.example.controller.Employee;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.pojo.Emp.Employee;
import com.example.service.Emp.EmpService;

@Controller
@RequestMapping(value = "/emp")
public class EmpController {

    @Autowired
    private EmpService empService;

    @ResponseBody
    @RequestMapping(value = "/login", produces = "application/json;charset=UTF-8")
    public int login(@ModelAttribute("emp") Employee emp, HttpServletRequest req) {
        Employee employee = empService.getEmp(emp.getEmployee_Name());
        if (employee != null) {
            if (employee.getEmployee_Password().equals(emp.getEmployee_Password())) {
                req.getSession().setAttribute("employee", employee);
                return 2;
            } else
                return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "/addEmp", produces = "application/json;charset=UTF-8")
    public int addEmp(@ModelAttribute("emp") Employee emp) {
        return empService.addEmp(emp);
    }

    @ResponseBody
    @RequestMapping(value = "/updateEmp", produces = "application/json;charset=UTF-8")
    public int updateEmp(Employee emp, HttpServletRequest req) {
        Employee employee = (Employee) req.getSession().getAttribute("employee");
        employee.setEmployee_Password(emp.getEmployee_Password());
        return empService.updateEmp(employee);
    }
}
