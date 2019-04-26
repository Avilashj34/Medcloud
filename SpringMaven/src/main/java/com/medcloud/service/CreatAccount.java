
package com.medcloud.service;

public class CreatAccount {
	
	public static int OtpGen() {
		int otp=(int) ((Math.random()*90000)+10000) ;
		return otp;
		
	}
	
	
	public static int generateAccNo(){
		int hospId=(int)(Math.random()*900000);
		return hospId;
	}

}
