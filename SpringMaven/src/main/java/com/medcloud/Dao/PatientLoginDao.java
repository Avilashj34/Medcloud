package com.medcloud.Dao;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.medcloud.Model.Doctor;
import com.medcloud.Model.Hospital;
import com.medcloud.Model.Registration;

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
				u.setStatus(rs.getInt(15));
				System.out.println(u.getEmailid());
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
				u.setEmailid(rs.getString(6));
				u.setPassword(rs.getString(11));
				
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
				u.setEmailid(rs.getString(4));
				u.setPassword(rs.getString(5));
				
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
}
