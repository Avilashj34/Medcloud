package com.medcloud.Controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.medcloud.Dao.BlManager;
import com.medcloud.Dao.PatientLoginDao;
import com.medcloud.Model.Doctor;
import com.medcloud.Model.Prescription;
import com.medcloud.Model.Registration;
import com.medcloud.Model.Report;
import com.medcloud.service.AES;
import java.util.Map;

@Controller
public class PatientLoginController extends HttpServlet {

	/**
	 * 
	 */
	
	//All Record display
	private static final long serialVersionUID = 377036863363458261L;

	@Autowired 
	PatientLoginDao patientdao;
	
	@Autowired
	BlManager bl;
	
	Prescription pres=new Prescription();
	Doctor doc=new Doctor();
	
	private static String secretKey = "boooooooooom";
	
	
	
	@RequestMapping("/Patientlogin")
	public String ShowDoctorForm(Model m)
	{
		//m.addAttribute("command", new Patientlogin());
		return "Patientlogin";		
	}
	
	@RequestMapping("/Patientdashboard")
	public String Showdashboard()
	{
		return "Patientdashboard";
	}
	
	@RequestMapping("/Updatereport")
	public String Showreport(Model m)
	{
		return "Updatereport";
		
	}
	
	@RequestMapping("/ResendOtp")
	public String Resendpage(Model m)
	{
		return "ResendOtp";
	}
	
	@RequestMapping("/logout")
	public String logout()
	{
		return "logout";
	}
	
	
	@RequestMapping("/Patientprofile")
	public ModelAndView show() {
		return new ModelAndView("Patientprofile");
	}
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginCon(@RequestParam("emailid") String email,@RequestParam("password") String password,
			Model m,HttpSession session)
	{
		String emailCheck = "";
		String encryptpass="";
		int status=0;
		List<Registration> list1=patientdao.ToDecryptpassword(email);
		for(Registration u:list1) 
		{
			encryptpass=u.getPassword();
		}
		String decryptpassword=AES.decrypt(encryptpass, secretKey);
		System.out.println(decryptpassword);
		List<Registration> list = patientdao.getDataById(email,encryptpass);
		
		for(Registration u : list)
		{
			emailCheck = u.getEmailid();
			status=u.getStatus();
		}
		System.out.println(emailCheck);
		if(status==1) 
		{
			if(emailCheck.equals(email) && decryptpassword.equals(password))
			{
				String msg = "Hello "+emailCheck;
				session.setAttribute("patientemailsession",email);
				m.addAttribute("msg", msg);  
				return "Patientdashboard";  
			}
			else
			{
				String msg = "This"+emailCheck+" is not register";
				m.addAttribute("status", msg);  
				return "redirect:/Error";
			}
		}
		else
		{
			m.addAttribute("resendotp", "Your ACCOUNT iS nOt Activated");
			return "ResendOtp";
		}
	}
	
	@RequestMapping(value="/Patientprofile" , method=RequestMethod.GET)
	public String Showpatientprofile(Map<String, Object> map,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {

		String email=(String) session.getAttribute("patientemailsession");
		
		System.out.println(email);
		if(email==null){
			return "Home";
		}else
		{
		Registration r=bl.getDataByEmail(email);
		int searchID=r.getUserid();
		System.out.println(searchID);
		pres=bl.getPrescriptionPatientData(searchID);
		System.out.println(r.getUserid()+"   "+pres.getMedicine2());
		int docid=pres.getDoctorid();
		doc=bl.getDoctorDataByid(docid);
		System.out.println("doctor Id"+docid+"DocName"+doc.getEmailid());
		map.put("docname", doc.getFirstname());
		map.put("userid", r.getUserid());
		map.put("fname",r.getFirstname());
		map.put("mname", r.getMiddlename());
		map.put("lname", r.getLastname());
		map.put("image",r.getImage());
		map.put("medicine", pres.getMedicine1());
		return "Patientprofile";
		}		
	}
	
	@RequestMapping(value="/reportprocess",method=RequestMethod.POST)
	public String Showreportpage(Model m,HttpServletRequest request,@RequestParam("image") MultipartFile image,Report r) throws IOException {
		
		HttpSession session=request.getSession(false);
		String email=(String) session.getAttribute("patientemailsession");
		byte[] img=image.getBytes();
		r.setReport(img);
		String userid=bl.getdataByEmail(email);
		int pid=Integer.parseInt(userid);
		System.out.println(email +" "+pid);
		bl.savereport(r,pid);
		return "Patientdashboard";	
	}
}
