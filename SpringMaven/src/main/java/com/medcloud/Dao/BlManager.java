package com.medcloud.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.medcloud.Model.Doctor;
import com.medcloud.Model.Hospital;
import com.medcloud.Model.Prescription;
import com.medcloud.Model.Registration;
import com.medcloud.Model.Report;
import com.medcloud.Model.Temperature;

public class BlManager {
	
	
	@Autowired
	JdbcTemplate jdbctemplate;
	
	Registration r= new Registration();
	Doctor d=new Doctor();
	Prescription p=new Prescription();
	Temperature t=new Temperature();

	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}




	public List<Registration> SearchAccount(String email) {
		// TODO Auto-generated method stub
		return jdbctemplate.query("select * from patientinformation where emailid='"+email+"'", new RowMapper<Registration>(){

			@Override
			public Registration mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				r.setFirstname(rs.getString(2));
				r.setMiddlename(rs.getString(3));
				r.setLastname(rs.getString(4));
				r.setPhonenumber(rs.getString(5));
				r.setEmailid(rs.getString(6));
				r.setAddress(rs.getString(8));
				r.setImage(rs.getBytes(9));
				r.setOtp((rs.getInt(13)));//getting value through index and index start from 1.
				
				System.out.println(r.getEmailid() +" "+ r.getOtp());
				return r;
			}
			
		});
	}
	
	/*
	public Registration getDataByEmail(String emailid) {
		
		String sql="select * from patientinformation where emailid=?";
		return jdbctemplate.queryForObject(sql, new Object[] {emailid} ,new BeanPropertyRowMapper<Registration>(Registration.class));
			
	}*/

	public String getdataByEmail(String email) {
		String sql="select userid from patientinformation where emailid=?";
		return jdbctemplate.queryForObject(sql, new Object[] {email},String.class);
	}
	
	public Registration getDataByEmail(String email) {
		String sql="select * from patientinformation where emailid=?";
		return jdbctemplate.queryForObject(sql, new Object[] {email},new BeanPropertyRowMapper<Registration>(Registration.class));
	}



	public Hospital getDataById(int id) {
		// TODO Auto-generated method stub
		
		String sql="select * from hospital where hid=?";
		
		Hospital s=jdbctemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<Hospital>(Hospital.class));
		System.out.println(s.getHospitalId());
		return s;
	}




	public List<Registration> authenticateemail(String authenticateemail) {
		// TODO Auto-generated method stub
		return jdbctemplate.query("select * from patientinformation where emailid='"+authenticateemail+"'", new RowMapper<Registration>(){

			@Override
			public Registration mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				r.setFirstname(rs.getString(2));
				r.setMiddlename(rs.getString(3));
				r.setLastname(rs.getString(4));
				r.setPhonenumber(rs.getString(5));
				r.setEmailid(rs.getString(6));
				r.setAddress(rs.getString(8));
				r.setImage(rs.getBytes(9));
				r.setOtp((rs.getInt(13)));//getting value through index and index start from 1.
				
				System.out.println(r.getEmailid() +" "+ r.getOtp());
				return r;
			}
			
		});
	}




	public Registration verifyemail(String email) {
		// TODO Auto-generated method stub
		String sql="select emailid from patientinformation where emailid=?";
		return jdbctemplate.queryForObject(sql, new Object[] {email},new BeanPropertyRowMapper<Registration>(Registration.class));
	}




	public String getPatientData(String email) {
		// TODO Auto-generated method stub
		
		String sql="select userid from patientinformation where emailid=?";
		//return jdbctemplate.queryForObject(sql,new Object[] {email},new BeanPropertyRowMapper<Registration>(Registration.class));
		return jdbctemplate.queryForObject(sql, new Object[] {email},String.class);
	}




	public Registration geted(String pid) {
		// TODO Auto-generated method stub
		String sql="select userid from patientinformation where userid=?";
		Registration register=jdbctemplate.queryForObject(sql,new Object[] {pid},new BeanPropertyRowMapper<Registration>(Registration.class));
		return register;
	}




	public String getDoctorData(String demail) {
		// TODO Auto-generated method stub
		
		String sql="select doctorid from doctor where emailid=?";
		return jdbctemplate.queryForObject(sql,new Object[] {demail}, String.class);		
	}

	public void Saveprescription(Prescription p,int id3,int pid) {
		// TODO Auto-generated method stub
		String sql="insert into prescription (medicine1,medicine2,advice,date,doctorid,userid) values('"+p.getMedicine1()+"','"+p.getMedicine2()+"','"+p.getAdvice()+"','"+p.getDate()+"',"+id3+","+pid+")";
		jdbctemplate.update(sql);
		//new Object[] {p.getMedicine1(),p.getMedicine2(),p.getAdvice(),p.getDate(),p.getDoctor(),p.getRegister()})
		//,'"+p.getDoctor()+"','"+p.getRegister()+"'
	}
	
	public void savereport(Report r, Integer pid) {
		// TODO Auto-generated method stub
		String sql="insert into report(report,userid) values(?,?)";
		jdbctemplate.update(sql,new Object[] {r.getReport(),pid});
	}




	public Doctor getdoctorid(int id3) {
		String sql="select doctorid from doctor where doctorid=?";
		Doctor doctor=jdbctemplate.queryForObject(sql,new Object[] {id3},new BeanPropertyRowMapper<Doctor>(Doctor.class));
		return doctor;
	}




	public Prescription getPrescriptionPatientData(int searchID) {
		// TODO Auto-generated method stub
		String sql="select * from prescription where userid=?";
		return jdbctemplate.queryForObject(sql,new Object[] {searchID}, new BeanPropertyRowMapper<Prescription>(Prescription.class));
	}


	public Doctor getDoctorDataById(Doctor searchdoctor) {
		// TODO Auto-generated method stub
		String sql="select * from doctor where doctorid=?";
		return jdbctemplate.queryForObject(sql, new Object[] {searchdoctor},new BeanPropertyRowMapper<Doctor>(Doctor.class));
	}


//this.jdbcTemplate.update( "update mytable set name = ? where id = ?",  name, id);

	public void changestatus(String otp) {
		// TODO Auto-generated method stub
		String sql="UPDATE patientinformation SET STATUS='1' WHERE otp='"+otp+"'";
		jdbctemplate.update(sql);
	}




	public List<Doctor> getDoctorListByName() {
		return jdbctemplate.query("select * from doctor", new RowMapper<Doctor>(){

			@Override
			public Doctor mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Doctor u = new Doctor();	
				u.setDoctorid(rs.getInt(1));
				u.setFirstname(rs.getString(2));
				u.setLastname(rs.getString(3));
				u.setEmailid(rs.getString(5));
				
				return u;
			}		
		});
	}

	public Doctor getDoctorDataByid(int docid) {
		// TODO Auto-generated method stub
		String sql="select * from doctor where doctorid=?";
		return jdbctemplate.queryForObject(sql,new Object[] {docid}, new BeanPropertyRowMapper<Doctor>(Doctor.class));

	}

	public void insertdoctorid(int hid,Integer id) {
		// TODO Auto-generated method stub
		String sql="update hospital set doctorid='"+id+"' where hid="+hid+"";
		jdbctemplate.update(sql);
	}
	
	public Temperature Taketempdata(String emailid)
	{
		String sql = "select * from SensorData where emailid=?";
		return jdbctemplate.queryForObject(sql, new Object[] {emailid}, new BeanPropertyRowMapper<Temperature>(Temperature.class));
	}
	
	public Doctor SearchDoctor(String email)
	{
		
		String sql="select * from doctor where emailid=?";
		return jdbctemplate.queryForObject(sql,new Object[] {email},new BeanPropertyRowMapper<Doctor>(Doctor.class));
	}

	public void UpdatePrescriptionData(int height,int weight,int pulse,int bloodpressure,int sugar,int rid) {
		String sql=" UPDATE routine_medical_recored SET height= '"+height+"',weight='"+weight+"',pulse='"+pulse+"',bloodpressure='"+bloodpressure+"',sugar='"+sugar+"' WHERE id='"+rid+"'";
		jdbctemplate.update(sql);
	}




	public void savefeedback(String name, String email, String msg) {
		// TODO Auto-generated method stub
		String sql="insert into feedback(name,email,message) values('"+name+"','"+email+"','"+msg+"')";
		jdbctemplate.update(sql);
	}




	public void updatepatientid(Integer id,Integer hid) {
		// TODO Auto-generated method stub
		String sql="UPDATE patientinformation SET hid='"+hid+"' WHERE userid='"+id+"'";
		jdbctemplate.update(sql);
	}


	
}
