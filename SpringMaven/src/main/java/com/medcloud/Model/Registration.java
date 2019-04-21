package com.medcloud.Model;

import java.io.Serializable;
import java.util.Date;

public class Registration implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4441937601387772910L;
	private Integer  userid;
	private String firstname;
	private String middlename;
	private String lastname;
	private String phonenumber;
	private String emailid;
	private String country;
	private String gender;
	private byte[] image;
	private String address;
	private String kyc;
	private String password;
	private int age;
	private Integer otp;
	private Date otptime;
	private int status;
	private Hospital hospital;


	
	
	public Registration(Integer userid, String firstname, String middlename, String lastname, String phonenumber,
			String emailid, String country, byte[] image, String address, String kyc, String password, int age, Integer otp,
			Date otptime, Hospital hospital) {
		super();
		this.userid = userid;
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.phonenumber = phonenumber;
		this.emailid = emailid;
		this.country = country;
		this.image = image;
		this.address = address;
		this.kyc = kyc;
		this.password = password;
		this.age = age;
		this.otp = otp;
		this.otptime = otptime;
		this.hospital = hospital;
	}

	public Registration() {
		// TODO Auto-generated constructor stub
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}


	public String getFirstname() {
		return firstname;
	}


	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getMiddlename() {
		return middlename;
	}


	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}


	public String getLastname() {
		return lastname;
	}


	public void setLastname(String lastname) {
		this.lastname = lastname;
	}


	public String getPhonenumber() {
		return phonenumber;
	}


	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}


	public String getEmailid() {
		return emailid;
	}


	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public byte[] getImage() {
		return image;
	}


	public void setImage(byte[] image) {
		this.image = image;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getKyc() {
		return kyc;
	}


	public void setKyc(String kyc) {
		this.kyc = kyc;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
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

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
}
