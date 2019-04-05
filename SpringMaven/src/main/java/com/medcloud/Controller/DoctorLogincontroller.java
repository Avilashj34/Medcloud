package com.medcloud.Controller;

import java.util.List;
import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.medcloud.Dao.BlManager;
import com.medcloud.Dao.LoginDao;
import com.medcloud.Model.Doctor;
import com.medcloud.Model.Prescription;
import com.medcloud.Model.Registration;
import com.medcloud.test.Doctorlogin;

@Controller
public class DoctorLogincontroller {
	
	
	@Autowired
	LoginDao dao2;
	
	@Autowired
	BlManager bl;

	@RequestMapping("/Doctorlogin")
	public String Showlogin(Model m)
	{
		m.addAttribute("command", new Doctorlogin());
		return "Doctorlogin";
	}
	
	@RequestMapping("/Doctordashboard")
	public String Showdashboard(Model m)
	{
		return "Doctordashboard";
	}
	
	//@RequestMapping("")
	
	
	@RequestMapping(value = "/doctorlogin", method = RequestMethod.POST)
	public String loginCon(@RequestParam("emailid") String email,@RequestParam("password") String password
			,Model m,HttpSession session)
	{
		//UserMaster u = new UserMaster();
		String emailCheck = "";
		String name="";
		String passwordcheck="";
		List<Doctor> list = dao2.getDataById(email,password);
		for(Doctor u : list)
		{
			emailCheck = u.getEmailid();
			passwordcheck=u.getPassword();
			name=u.getFirstname();
		}
		if(emailCheck.equals(email) && passwordcheck.equals(password))
		{
			String msg = "Hello "+emailCheck+ "Your name" +name;
			session.setAttribute("doctoremailsession",email);
			m.addAttribute("msg", msg);  
	        return "Doctordashboard";  
		}
		else
		{
			String msg = "This "+email+" is not register";
			m.addAttribute("msg", msg);  
	        return "Error";  
		}
	}
	
	
	@RequestMapping(value="prescription" , method=RequestMethod.POST)
	public String ShowPrecption(Model m,@RequestParam("pemail")String pemail,HttpSession session)
	{
		String patientID=bl.getdataByEmail(pemail);
		//int patientID=Integer.parseInt(id);
		session.setAttribute("patientID", patientID);
		System.out.println(patientID);
		//m.addAttribute("email",r.getEmailid());
		return "Patientprescription";
	}

	@RequestMapping("/Patientprescription")
	public String ShowPrescription(Model m)
	{
		return "Patientprescription";
	}
	
	

	@RequestMapping(value="prescriptionprocess", method=RequestMethod.POST)
	public String Show(Model m,@RequestParam("medicine1") String m1,@RequestParam("medicine2") String m2,
			@RequestParam("advice")String advice,@ModelAttribute("prescription")Prescription prescription,HttpSession session)
	{
		String patientid=(String) session.getAttribute("patientID");
		String demail=(String) session.getAttribute("doctoremailsession");
		//String pid=bl.getPatientData(email);
		String did=bl.getDoctorData(demail);
		int id3=Integer.parseInt(did);
		int pid=Integer.parseInt(patientid);
		System.out.println(pid);
		System.out.println("Session INfo"+pid +" "+demail +" "+pid +" "+id3  );
		Registration r=bl.geted(patientid);
		Doctor d=bl.getdoctorid(id3);
		prescription.setMedicine1(m1);
		prescription.setMedicine2(m2);
		prescription.setAdvice(advice);
		Timestamp tm=new Timestamp(System.currentTimeMillis());
		prescription.setDate(tm);
		prescription.setRegister(r);
		
		bl.Saveprescription(prescription,id3,pid);
		
		return "redirect:/Doctordashboard";
	}

}
