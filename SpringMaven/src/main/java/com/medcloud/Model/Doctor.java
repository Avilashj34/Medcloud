package com.medcloud.Model;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Doctor implements Serializable{
	
	private Integer  doctorid;
	private String firstname;
	private String lastname;
	private String emailid;
	private byte[] image;
	private String password;
	//private String confirmpassword;
	private String description;
	private String phonenumber;
	private String specialty;
	private String gender;
	private Integer otp;
	private Date otptime;
	private Hospital hospId;
	public Integer getDoctorid() {
		return doctorid;
	}
	public void setDoctorid(Integer doctorid) {
		this.doctorid = doctorid;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public Integer getOtp() {
		return otp;
	}
	public void setOtp(Integer otp) {
		this.otp = otp;
	}
	public Date getOtptime() {
		return otptime;
	}
	public void setOtptime(Date otptime) {
		this.otptime = otptime;
	}
	public Hospital getHospId() {
		return hospId;
	}
	public void setHospId(Hospital hospId) {
		this.hospId = hospId;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	
	
}
