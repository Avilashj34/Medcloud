package com.medcloud.Controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.medcloud.Dao.BlManager;
import com.medcloud.Dao.PatientLoginDao;
import com.medcloud.Model.Doctor;
import com.medcloud.Model.Hospital;
import com.medcloud.Model.Registration;
import com.medcloud.Model.Report;

@Controller
public class EntryController {
	
	@Autowired
	PatientLoginDao patientdao;
	
	@Autowired
	BlManager bl;
	
	@RequestMapping("/pr")
	public String Showtemp(Model m){
		return "pr";
	}
	
	@RequestMapping("/Graph")
	public String ShowGraph(Model m){
		return "Graph";
	}
	
	@RequestMapping("/header")
	public String Showho(Model m){
		return "header";
	}
	
	@RequestMapping("/Single")
	public String Showh(Model m){
		return "Single";
	}
	
	@RequestMapping("/Viewreport")
	public String Showreportpage(Model m,HttpSession session){
		/*String email=(String) session.getAttribute("patientemailsession");
		String id=bl.getdataByEmail(email);
		int userid=Integer.parseInt(id);
		System.out.println(userid);
		List<Report> l=patientdao.getReportData(userid);
		m.addAttribute("list",l);
		*/
		return "Viewreport";
	}
	
	
	@RequestMapping("/Home")
	public String Showhome(Model m){
		List<Doctor> listd = patientdao.ShowTop3ResultOfDoctor();
		m.addAttribute("doctorlist", listd);
		return "Home";
	}
	
	@RequestMapping("/Error")
	public String ShowErrorPage(Model m){
		return "Error";
	}
	
	
	@RequestMapping("/Patientverification")
	public String ShowAuthenticationPage(Model m){
		return "Patientverification";
	}
	
	
	@RequestMapping("/Otpverification")
	public String ShowOtpPage(Model m){
		return "Otpverification";
	}
	
	
	
	@RequestMapping("/AddDoctor")
	public String ShowAdminPag8(Model m){
		return "AddDoctor";
	}
	
	@RequestMapping("/admin")
	public String ShowAdminPag(Model m){
		return "Adminfiles/admin";
	}
	
	@RequestMapping("/adminlogin")
	public String ShowAdminlogin(Model m){
		return "Adminfiles/adminlogin";
	}
	
	@RequestMapping("adminloginverify")
	public String AdminVerify(Model m,@RequestParam("id") int id,@RequestParam("password") String password)
	{
		if(id==8097 && password=="avilashjha")
		{
		return "admin";
		}
		else {
		m.addAttribute("adminerror", "Not An authorised Admin");	
		return "Error";
		}
	}
	
	@RequestMapping("/AddHospital")
	public String ShowAdminPag1(Model m){
		return "Adminfiles/AddHospital";
	}
	
	@RequestMapping("/Doctor")
	public String ShowAdminPag2(Model m){
		List<Doctor> d=patientdao.getDoctor();
		m.addAttribute("list", d);
		return "Adminfiles/Doctor";
	}
	
	@RequestMapping("/Hospital")
	public String ShowAdminPag3(Model m){
		List<Hospital> h=patientdao.getHospital();
		m.addAttribute("list", h);
		return "Adminfiles/Hospital";
	}
	
	@RequestMapping("/Patient")
	public String ShowAdminPag4(Model m){
		List<Registration> p=patientdao.getEmployees();
		m.addAttribute("list", p);
		return "Adminfiles/Patient";
	}
	
	@RequestMapping("/Prescription")
	public String ShowAdminPag5(Model m){
		return "Adminfiles/Prescription";
	}
	
	
	@RequestMapping("/Routine")
	public String ShowAdminPag6(Model m){
		return "Adminfiles/Routine";
	}
	
	
	@RequestMapping(value="/GetPic/{id}")
	public void GetPic(@PathVariable("id") int id,HttpServletResponse response) throws Exception
	{
		response.setContentType("image/jpeg");
		
		Blob ph=patientdao.getPhotoById(id);
		byte[] bytes=ph.getBytes(1, (int)ph.length());
		InputStream inputStream=new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	}
	
	@RequestMapping(value="/GetDoctorPic/{id}")
	public void GetDoctorPic(@PathVariable("id") int id,HttpServletResponse response) throws Exception
	{
		System.out.println(id);
		response.setContentType("image/jpeg");
		Blob ph=patientdao.getDoctorPhotoById(id);
		byte[] bytes=ph.getBytes(1, (int)ph.length());
		InputStream inputStream=new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	}
	
	
	@RequestMapping(value="/GetReportPic/{id}")
	public void GetReportPic(@PathVariable("id") int id,HttpServletResponse response) throws Exception
	{
		response.setContentType("image/jpeg");
		
		Blob ph=patientdao.getReportById(id);
		byte[] bytes=ph.getBytes(1, (int)ph.length());
		InputStream inputStream=new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	}
	
}

