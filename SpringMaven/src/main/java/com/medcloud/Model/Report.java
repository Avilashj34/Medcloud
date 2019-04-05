package com.medcloud.Model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Report implements Serializable{

	private Integer id;
	private byte[] report;
	private Integer userid;
	private Integer hid;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public byte[] getReport() {
		return report;
	}
	public void setReport(byte[] report) {
		this.report = report;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getHid() {
		return hid;
	}
	public void setHid(Integer hid) {
		this.hid = hid;
	}
	
	
	
}
