package com.medcloud.Dao;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.medcloud.Model.Doctor;
import com.medcloud.Model.Hospital;
import com.medcloud.Model.Registration;
import com.medcloud.Model.Report;
import com.medcloud.Model.RoutineMedicalRecord;
import com.medcloud.Model.Temperature;

public class PatientLoginDao {
	
	
	@Autowired
	JdbcTemplate jdbctemplate;
	
	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}
		
	public String loginUser(Registration user)
	{		
			String sql = "select * from patientinformation where emailid=? AND password=?";		
			try 
			{
				String userId = jdbctemplate.queryForObject(sql, new Object[] {user.getEmailid(), user.getPassword()}, String.class);
				return userId;
				
			} catch (Exception e) {
				return null;
			}		
	}

	public List<Registration> getDataById(String email, String password) {
		return jdbctemplate.query("select * from patientinformation where emailid ='"+email+"' or phonenumber='"+email+"' and password='"+password+"'", new RowMapper<Registration>(){

			@Override
			public Registration mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Registration u = new Registration();	
				u.setEmailid(rs.getString(6));
				u.setStatus(rs.getInt(16));
				u.setUserid(rs.getInt(1));
				System.out.println(u.getEmailid()+ " "+u.getStatus());
				return u;
			}
			
		});
	}


	public List<Registration> ToDecryptpassword(String email) {
		return jdbctemplate.query("select * from patientinformation where emailid ='"+email+"' or phonenumber='"+email+"'", new RowMapper<Registration>(){

			@Override
			public Registration mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Registration u = new Registration();	
				
				//u.setEmailid(rs.getString(6));
				u.setPassword(rs.getString(11));
				
				System.out.println( u.getPassword());
				return u;
			}
			
		});
	}
	
	public List<Registration> getEmployees() {
		
		
		return jdbctemplate.query("select * from patientinformation", new RowMapper<Registration>(){

			@Override
			public Registration mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Registration u = new Registration();	
				u.setUserid(rs.getInt(1));
				u.setFirstname(rs.getString(2));
				u.setMiddlename(rs.getString(3));
				u.setLastname(rs.getString(4));
				u.setEmailid(rs.getString(6));
				u.setPassword(rs.getString(11));
				u.setAddress(rs.getString(8));
				u.setCountry(rs.getString(7));
				u.setPhonenumber(rs.getString(5));
				System.out.println(u.getEmailid() );
				return u;
			}
			
		});
	}




	public List<Hospital> getHospital() {
		return jdbctemplate.query("select * from hospital", new RowMapper<Hospital>(){

			@Override
			public Hospital mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Hospital u = new Hospital();	
				u.setHospitalId(rs.getInt(1));
				u.setHospitalName(rs.getString(2));
				u.setAddress(rs.getString(4));
				u.setCity(rs.getString(5));
				u.setPassword(rs.getString(3));
				u.setLongnote(rs.getString(7));
				
				return u;
			}
			
		});
	}

	
	public List<Doctor> getDoctor() {
		return jdbctemplate.query("select * from doctor", new RowMapper<Doctor>(){

			@Override
			public Doctor mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Doctor u = new Doctor();	
				u.setDoctorid(rs.getInt(1));
				u.setFirstname(rs.getString(2));
				u.setLastname(rs.getString(3));
				u.setEmailid(rs.getString(5));
				u.setPassword(rs.getString(6));
				u.setDescription(rs.getString(9));
				u.setSpecialty(rs.getString(10));
				return u;
			}		
		});
	}

	public Blob getPhotoById(int id) {
		// TODO Auto-generated method stub
		String sql="select photo from patientinformation where userid=?";
		Blob photo=jdbctemplate.queryForObject(sql,new Object[] {id},Blob.class);
		return photo;
	}
	
	public Blob getDoctorPhotoById(int id) {
		// TODO Auto-generated method stub
		String sql="select photo from doctor where doctorid=?";
		Blob photo=jdbctemplate.queryForObject(sql,new Object[] {id},Blob.class);
		return photo;
	}
	
	public Blob getReportById(int id) {
		// TODO Auto-generated method stub
		String sql="select report from report where id=?";
		Blob photo=jdbctemplate.queryForObject(sql,new Object[] {id},Blob.class);
		return photo;
	}

	public List<Doctor> ShowTop3ResultOfDoctor() {
		return jdbctemplate.query("SELECT * FROM doctor LIMIT 3", new RowMapper<Doctor>(){

			@Override
			public Doctor mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Doctor u = new Doctor();	
				u.setDoctorid(rs.getInt(1));
				u.setFirstname(rs.getString(2));
				u.setLastname(rs.getString(3));
				u.setEmailid(rs.getString(4));
				u.setPassword(rs.getString(6));
				
				return u;
			}		
		});
	}

	public RoutineMedicalRecord getPrescription(int id) {
		// TODO Auto-generated method stub		
		String sql="SELECT * FROM routine_medical_recored WHERE userid=?";
		return jdbctemplate.queryForObject(sql, new Object[] {id},new BeanPropertyRowMapper<RoutineMedicalRecord>(RoutineMedicalRecord.class));
	}

	public List<Temperature> getSensorData() {
		// TODO Auto-generated method stub
		return jdbctemplate.query("select * from SensorData", new RowMapper<Temperature>() {

			@Override
			public Temperature mapRow(ResultSet rs, int arg1) throws SQLException {
				// TODO Auto-generated method stub
				System.out.println(arg1);
				Temperature t=new Temperature();
				t.setTemperature(rs.getInt(3));
				t.setBpm(rs.getInt(2));
				t.setDate(rs.getDate(4));
				return t;
			}
			
			
		});
	}

	public List<Report> getReportData(int userid) {
		// 
		String sql="select * from report where userid='"+userid+"'";
		List<Report> list=new ArrayList<Report>();
		return jdbctemplate.query(sql, new RowMapper<Report>(){
			@Override
			public Report mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Report u = new Report();	
				u.setReport(rs.getBytes(2));
				u.setUserid(rs.getInt(3));
				u.setHid(rs.getInt(4));
				return u;
			}		
		});
	}	
	
	
	
}
