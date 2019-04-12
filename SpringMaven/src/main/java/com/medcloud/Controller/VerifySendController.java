package com.medcloud.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.medcloud.Dao.BlManager;
import com.medcloud.Model.Registration;
import com.medcloud.service.CreatAccount;
import com.medcloud.service.EmailService;

@Controller
public class VerifySendController {

	@Autowired
	BlManager bl;
	//https://stackoverflow.com/questions/42484197/how-to-fetch-data-from-database-to-select-tag-in-php
	
	@RequestMapping(value="/patientauthentication" ,method=RequestMethod.POST)
	public String Authenticate(@RequestParam("authenticationemail") String email,Model m,HttpSession session) {
	
		Registration r=bl.verifyemail(email);
		System.out.println(r.getEmailid());
		String emailcheck=r.getEmailid();
		m.addAttribute("otpmsg", "Enter otp here");
		int otp=CreatAccount.OtpGen();
		session.setAttribute("otp",otp);
		String subject="Otp";
		String messageText="The Otp of for your account is "+otp+"";
		System.out.println(otp);
		EmailService.sendMail(email, subject, messageText);
		if(emailcheck.equals(email))
		{
			return "Patientverification";	

		}
		else
		return "error";	
	}
	
	@RequestMapping(value="/otpprocess" , method=RequestMethod.GET)
	public String otpverification(@RequestParam("otp") int otp,Model m,HttpSession session)
	{
		int checkotp=(int) session.getAttribute("otp");
		if(checkotp==otp) {
		return "Dashboard";
		}
		else
			m.addAttribute("otperror", "Entered Wromg otp");
			return "Error";
	}
	
	@RequestMapping(value="/SendPatientToDoctor", method=RequestMethod.POST)
	public String SendPatient(Model m,@RequestParam("sendpatientemail")String email)
	{
		
		//PrintWriter out=r 
		
		m.addAttribute("msg", "Patient Registered");
		return "Hospitalhome";
		
	}
}
