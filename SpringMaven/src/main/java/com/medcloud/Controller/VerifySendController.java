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
	
	@RequestMapping("Patienteditdashboard")
	public String ShowPage(Model m) {
		return "Patienteditdashboard";
	}
	
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
			session.setAttribute("authemail", email);
			return "Patientverification";	

		}
		else
		return "error";	
	}
	
	@RequestMapping(value="/otpprocess" , method=RequestMethod.POST)
	public String otpverification(@RequestParam("otp") int otp,Model m,HttpSession session)
	{
		int checkotp=(int) session.getAttribute("otp");
		if(checkotp==otp) {
		return "Patienteditdashboard";
		}
		else
		{
			m.addAttribute("otperror", "Entered Wromg otp");
			return "Error";
		}
	}
	
	@RequestMapping(value="/updateprescription",method=RequestMethod.POST)
	public String UpdateData(Model m,@RequestParam("height")Integer height,@RequestParam("weight")Integer weight,@RequestParam("pulse")Integer pulse,
			@RequestParam("bloodpressure")Integer bloodpressure,@RequestParam("sugar")Integer sugar,@RequestParam("id")Integer rid)
	{
		bl.UpdatePrescriptionData(height,weight,pulse,bloodpressure,sugar,rid);
		
		return "Hospitalhome";
	}
	
	@RequestMapping(value="/SendPatientToDoctor", method=RequestMethod.POST)
	public String SendPatient(Model m,@RequestParam("sendpatientemail")String email,HttpSession session)
	{
		
		//PrintWriter out=r 
		try {
		Integer hid=(Integer) session.getAttribute("hospitalidsession");
		String userid=bl.getdataByEmail(email);
		Integer id= Integer.parseInt(userid);
		bl.updatepatientid(id,hid);
		m.addAttribute("sendmsg", "Thank You! "+email+" Patient Added");
		return "Hospitalhome";
		}
		catch (Exception e){
			m.addAttribute("sendpatienterror","Error Adding Patient data");
			return "Hospitalhome";
		
		}
		
	}
}
