package com.medcloud.Dao;

import org.springframework.jdbc.core.JdbcTemplate;

import com.medcloud.Model.Doctor;
import com.medcloud.Model.Emp;
import com.medcloud.Model.Hospital;
import com.medcloud.Model.Registration;
import com.medcloud.test.Patientlogin;

public class EmpDao {
	
	JdbcTemplate jdbctemplate;
	
	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}

	public int save(Emp p) {
		// TODO Auto-generated method stub
		String sql="insert into Emp99(name,salary) values('"+p.getName()+"',"+p.getSalary()+")";
		//)+"',"+p.getSalary()+",'"+p.getDesignation()+"')";    
	    return jdbctemplate.update(sql);    
	}
	
	
	public int insert(Registration r)
	{
		//Image  Insertion to be done using prepared statement else it pass the value address
		String sql="insert into patientinformation(firstname,middlename,lastname,phonenumber,emailid,country,address,photo,kyc,password,age,otp,otptime,status) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbctemplate.update(sql,new Object[] {r.getFirstname(),r.getMiddlename(),r.getLastname(),r.getPhonenumber(),r.getEmailid(),r.getCountry(),r.getAddress(),r.getImage(),r.getKyc(),r.getPassword(),r.getAge(),r.getOtp(),r.getOtptime(),0});
	}
	
	
	public String validatepatient(Patientlogin l)
	{
		String sql="SELECT emailid,password FROM patientinformation WHERE emailid='"+l.getEmailid()+"' and password="+l.getPassword()+";";
		return sql;
	}


	public int doctorinsert(Doctor d) {
		// TODO Auto-generated method stub
		//ERROR
		// /WEB-INF/jsp/Doctorregistration.jsp (line: 33, column: 61) equal symbol expected
		String sql="insert into doctor(firstname,lastname,emailid,password,photo,description,specialty,otp,otptime)"
				+ "values(?,?,?,?,?,?,?,?,?)";
		return jdbctemplate.update(sql ,new Object[] {d.getFirstname(),d.getLastname(),d.getEmailid(),d.getPassword(),d.getImage(),d.getDescription(),d.getSpecialty(),d.getOtp(),d.getOtptime()});
	}

	public int hospitalinsert(Hospital h) {
		// TODO Auto-generated method stub
		String sql="insert into hospital(hid,hospitalname,password,address,city,phoneno,longnote,time)"
				+ "values(?,?,?,?,?,?,?,?)";
		return jdbctemplate.update(sql ,new Object[] {h.getHospitalId(),h.getHospitalName(),h.getPassword(),h.getAddress(),h.getCity(),h.getPhone(),h.getLongnote(),h.getDate()});
		
	}
}
