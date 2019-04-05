package com.medcloud.Model;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Prescription implements Serializable{
	
	

	private String medicine1;
	private String medicine2;
	private String advice;
	private Date date;
	private Registration register;
	private Integer doctorid;
	public String getMedicine1() {
		return medicine1;
	}
	public void setMedicine1(String medicine1) {
		this.medicine1 = medicine1;
	}
	public String getMedicine2() {
		return medicine2;
	}
	public void setMedicine2(String medicine2) {
		this.medicine2 = medicine2;
	}
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	public Registration getRegister() {
		return register;
	}
	public void setRegister(Registration register) {
		this.register = register;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getDoctorid() {
		return doctorid;
	}
	public void setDoctorid(Integer doctorid) {
		this.doctorid = doctorid;
	}
	
	

}
