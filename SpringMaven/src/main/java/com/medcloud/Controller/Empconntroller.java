package com.medcloud.Controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.medcloud.Dao.BlManager;
import com.medcloud.Dao.EmpDao;
import com.medcloud.Model.Emp;
import com.medcloud.Model.Hospital;
import com.medcloud.Model.Registration;
import com.medcloud.service.AES;
import com.medcloud.service.CreatAccount;
import com.medcloud.service.EmailService;

@Controller
public class Empconntroller {
	    
	@Autowired
	EmpDao dao;
	@Autowired
	BlManager bl;
	
	Hospital hospital;
	private static String secretKey = "boooooooooom";
	
	@RequestMapping("/empform")
	public String showform(Model m)
	{
		m.addAttribute("command", new Emp());
		return "empform";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String save(@ModelAttribute("emp")Emp emp)
	{
		dao.save(emp);
		return "redirect:/";
	}
	//The name in the Requeatmapping is th jsp file name the c0ntroller will map the request 
	// Every time this need to declare (MODEL)n else the page will not shown
	
	@RequestMapping("/registration")
	public String showpatientform(Model m)
	{
		//m.addAttribute("command", new Registration());
		return "registration";
	}
	
	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public String insert(@ModelAttribute("register")Registration register,@RequestParam("firstname") String firstname ,
			@RequestParam("emailid") String email,@RequestParam("photo") MultipartFile photo,
			@RequestParam("password") String password,HttpServletRequest request,@RequestParam("phonenumber") Integer phonenumber,
			HttpServletResponse response,Model m) throws IOException
	{
		String checkEmail="";
		boolean flag=false;
		List<Registration> list=bl.authenticateemail(email);
		for(Registration r:list)
		{
			checkEmail=r.getEmailid();
			if(checkEmail.equals(email))
			{
				flag=true;
			}
		}
		if(flag)
		{
			m.addAttribute("warning", "Email Already exist login here");
			return "Patientlogin";
		}
		else
		
		register.setEmailid(email);
		String encryptpassword=AES.encrypt(password, secretKey);
		System.out.println(encryptpassword);
		register.setPassword(encryptpassword);
		byte[] b=photo.getBytes();
		register.setImage(b);
		int otp=CreatAccount.OtpGen();
		register.setOtp(otp);
		register.setPhonenumber(phonenumber);
		register.setOtptime(Calendar.getInstance().getTime());
		String subject="Application for account";
		String messageText="Hi"+firstname+", /n Please enter this OTP "+otp+" valid for only 10 min";
		EmailService.sendMail(email, subject, messageText);
		dao.insert(register);
		
		return "redirect:/optEnter";	
		//There was an error here 
		//Neither BindingResult nor plain target object for bean name available as request attribute [duplicate]
		// It was because i have written (return "empform") else it has to be (return "redirect:/empform")
	}
	
	
	
	
}
