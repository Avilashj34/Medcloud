
package com.medcloud.Model;

import java.util.Date;

public class RoutineMedicalRecord {
	
	private Integer id;
	private int height ;
	private int weight;
	private int pulse;
	private int bloodpressure;
	private int sugar;
	private Date date;
	private Integer userid;
	
	
	public RoutineMedicalRecord() {
		super();
	}
	public RoutineMedicalRecord(int id, int height, int weight, int pulse, int bloodpressure, int sugar,Date date,Integer userid) {
		super();
		this.id = id;
		this.height = height;
		this.weight = weight;
		this.pulse = pulse;
		this.bloodpressure = bloodpressure;
		this.sugar = sugar;
		this.date=date;
		this.userid=userid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getPulse() {
		return pulse;
	}
	public void setPulse(int pulse) {
		this.pulse = pulse;
	}
	public int getBloodpressure() {
		return bloodpressure;
	}
	public void setBloodpressure(int bloodpressure) {
		this.bloodpressure = bloodpressure;
	}
	public int getSugar() {
		return sugar;
	}
	public void setSugar(int sugar) {
		this.sugar = sugar;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	
	
	

}
