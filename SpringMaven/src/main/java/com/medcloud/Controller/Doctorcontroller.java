package com.medcloud.Controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.medcloud.Dao.BlManager;
import com.medcloud.Dao.EmpDao;
import com.medcloud.Dao.LoginDao;
import com.medcloud.Model.Doctor;
import com.medcloud.Model.Hospital;
import com.medcloud.Model.Registration;
import com.medcloud.service.AES;
import com.medcloud.service.CreatAccount;
import com.medcloud.service.EmailService;

@Controller

public class Doctorcontroller {
	
	@Autowired
	EmpDao dao;
	
	@Autowired
	LoginDao dao2;
	
	private static String secretKey = "boooooooooom";

	
	Registration r=new Registration();
	Hospital h=new Hospital();
	Doctor d=new Doctor();
	
	@Autowired
	BlManager bl;

	@RequestMapping("/Doctorregistration")
	public String ShowDoctorForm(Model m)
	{
		//m.addAttribute("command", new Doctor());
		return "Doctorregistration";	
	}
	
	@RequestMapping("/Hospitalregistration")
	public String ShowHospitalregister(Model m)
	{
		//m.addAttribute("command", new Doctor());
		return "Hospitalregistration";		
	}
	
	@RequestMapping("/Hospitallogin")
	public String ShowHospitallogin(Model m)
	{
		//m.addAttribute("command", new Doctor());
		return "Hospitallogin";		
	}
	
	
		
	@RequestMapping("/Hospitalhome")
	public String ShowHospitalhome(Model m)
	{
		//m.addAttribute("command", new Doctor());
		return "Hospitalhome";		
	}
	
	
	@RequestMapping("/Docotp")
	public String DocOtpVerify(Model m)
	{
		return "Docotp";		
	}
	
	
	@RequestMapping("verifyotp")
	public String check(Model m,@RequestParam("otp") String otp,HttpSession session)
	{
		int sessionotp=(int)session.getAttribute("docotp");
		int enterotp=Integer.parseInt(otp);
		if(sessionotp == enterotp)
		{
			m.addAttribute("otpmsg","Login here");
			dao2.updateStatus(sessionotp);
		return "Doctorlogin";
		}
		else
			m.addAttribute("adddoctor","Otp Wrong Entered");
			return "Error";
		
	}
	
	@RequestMapping(value="/doctorprocess",method=RequestMethod.POST)
	public String Doctorsave(@ModelAttribute("doctor")Doctor doctor,@RequestParam("photo") MultipartFile photo
			,@RequestParam("emailid") String email,@RequestParam("phonenumber")String number,@RequestParam("gender")String gender,
			@RequestParam("password")String password,HttpSession session) throws IOException
	{
		//three session hopitalidsession,patientemailsessiondoctoremailsession
		/*try
		{
		int id=(int) session.getAttribute("hospitalidsession");
		System.out.println("Hospital session is"+id);
		}
		catch (Exception e) {
			// TODO: handle exception
		}*/
		byte[] b=photo.getBytes();
		doctor.setImage(b);
		//System.out.println(id);
		int otp=CreatAccount.OtpGen();
		session.setAttribute("docotp", otp);
		doctor.setOtp(otp);
		doctor.setGender(gender);
		doctor.setPhonenumber(number);
		String encryptpass = AES.encrypt(password, secretKey);
		doctor.setPassword(encryptpass);
		doctor.setOtptime(Calendar.getInstance().getTime());
		//h=bl.getDataById(id);
		System.out.println("Object Hospital Session "+h +" "+h.getHospitalId() );
		String subject="Otp";
		String messageText="The Otp For Account Password is "+otp;
		EmailService.sendMail(email, subject, messageText);
		dao.doctorinsert(doctor);
		return "redirect:/Docotp";
	}
	
	@RequestMapping(value="/hospitalprocess",method=RequestMethod.POST)
	public String Hospitalsave(@ModelAttribute("hospital") Hospital hospital,@RequestParam("hospname") String hospname,
			@RequestParam("hospaddress") String hospaddress,@RequestParam("password") String password,
			@RequestParam("city") String city,@RequestParam("longnote") String longnote
			,@RequestParam("mobile") String mobile,Model m,HttpSession session)
	{
		int hospitalID=CreatAccount.generateAccNo();
		System.out.println(hospitalID);
		m.addAttribute("hospId","Your hospital ID for login is "+hospitalID);
		hospital.setHospitalID(hospitalID);
		hospital.setHospitalName(hospname);
		String encryptpass= AES.encrypt(password, secretKey);
		hospital.setPassword(encryptpass);
		hospital.setAddress(hospaddress);
		hospital.setCity(city);
		hospital.setPhone(mobile);
		hospital.setLongnote(longnote);
		hospital.setDate(Calendar.getInstance().getTime());
		dao.hospitalinsert(hospital);
		m.addAttribute("msg","Registration sucesssfull Now Login here");
		return "Hospitallogin";
	}
	
	@RequestMapping(value = "/hospitallogin", method = RequestMethod.POST)
	public String loginCon(@RequestParam("hospId") String hospId,@RequestParam("password") String password
			,Model m,HttpSession session)
	{
		// PatientDao
		//UserMaster u = new UserMaster();
		try
		{
		int id=Integer.parseInt(hospId);
		
		System.out.println(id);
		int idCheck = 0;
		String encryptpass="";
		List<Hospital> list1=dao2.ToDecryptpassword(hospId);
		for(Hospital u:list1) 
		{
			encryptpass=u.getPassword();
		}
		String decryptpassword=AES.decrypt(encryptpass, secretKey);
		List<Hospital> list = dao2.loginhospital(hospId,encryptpass);
		
		for(Hospital u : list)
		{
			idCheck = u.getHospitalID();
			
		}
		System.out.println(  "In Doct "+idCheck+" "+decryptpassword+"E"+encryptpass);
		if((idCheck==id) && decryptpassword.equals(password))
		{
			session.setAttribute("hospitalsession",id);
			System.out.println(session.getId());
			String msg = "Hello "+idCheck+ "Your name"+session.getId();
			m.addAttribute("hospitalmsg", msg);  
	        return "Hospitalhome";  
		}
		else
		{
			String msg = "This "+id+" is not register";
			m.addAttribute("msg", msg);  
	        return "Error";  
		}
	}
		catch(NumberFormatException e) {
			m.addAttribute("numberexception","Please entered hospitalID");
			return "Error";
		}
	}
	
	
	@RequestMapping(value="/List_Of_Doctor")
	public String showdoctor(Model m)
	{
		List<Doctor> list=bl.getDoctorListByName();
		m.addAttribute("doctorlist", list);
		return "List_Of_Doctor";
	}
	
	/*
	 * ,@PathVariable("doctorid") Integer id
	 * */
	
	@RequestMapping(value="/add" ,method=RequestMethod.GET)
	public String show(Model m,HttpSession session)
	{
		System.out.println("DoctorController");
		try {
			int hid=(int) session.getAttribute("hospitalsession");
			//System.out.println(id +" "+id);
			//bl.insertdoctorid(hid,id);
			m.addAttribute("addoctor","Doctor Added to your hospital Sucessfully");
			return"List_Of_Doctor";
		}
		catch (Exception e) {
			// TODO: handle exception
			m.addAttribute("exception","Error Occured while adding doctor");
			return "Error";
			
		}
		
	
		
	}
}
