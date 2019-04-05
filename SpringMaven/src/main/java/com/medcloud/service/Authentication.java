package com.medcloud.service;

public class Authentication {
	
	public static int otpGen(){
		int otp=(int)(Math.random()*900000)+100000;
		return otp;
	}

}
