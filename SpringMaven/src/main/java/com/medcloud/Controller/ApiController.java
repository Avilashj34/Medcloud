package com.medcloud.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.medcloud.Model.Emp;

@RestController
public class ApiController {
	
	@RequestMapping("/empdata")
	public List<Emp> getEmp(){
	List<Emp> em=new ArrayList<>();
	
	Emp e=new Emp();
	e.setId(101);
	e.setName("Avi");
	e.setSalary(80);
	
	Emp e1=new Emp();
	e1.setId(101);
	e1.setName("Avi");
	e1.setSalary(80);
	
	
	em.add(e);
	em.add(e1);
	return em;
	}
}



