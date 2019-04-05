package com.medcloud.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.medcloud.Dao.BlManager;
import com.medcloud.Model.Registration;

@Controller
public class OtpCheckController {
	
	Registration r=new Registration();
	@Autowired
	BlManager bl;
	@RequestMapping("/optEnter")
	public String show(Model m)
	{
		return "optEnter";
	}
	
	
	@RequestMapping( value="/checkotp" , method=RequestMethod.POST)
	public String check(@RequestParam("otp")String otp,@RequestParam("email")String email)
	{
		int verifyotp=0;
		System.out.println(email);
		int otp1=Integer.parseInt(otp);

		System.out.println(otp1);
		List<Registration> list=	bl.SearchAccount(email);	
		for(Registration r:list)
		{
			verifyotp=r.getOtp();
		}
		//System.out.println(r.getOtp()+" "+r.getEmailid());
		System.out.println(r.getOtp());
		System.out.println(verifyotp);
		if(otp1==verifyotp)
		{
			bl.changestatus(otp);
		return "Patientlogin";
		}
		else
			return "redirect:/Error";
		
	}

}
