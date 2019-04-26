package com.medcloud.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.medcloud.Model.Doctor;
import com.medcloud.Model.Hospital;

public class LoginDao {
	
JdbcTemplate jdbctemplate;
	
	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}	
	/*public String validatedoctor(Doctorlogin dl)
	{
		String em=dl.getEmailid();
		String pass=dl.getPassword();
		
		
		jdbctemplate.execute("select emailid from doctor where emailid="+em+"and password="+pass);
		//System.out.println(sql);
		/*try
		{
			 String docid1=jdbctemplate.queryForObject(sql, new Object[]{
				dl.getEmailid(),dl.getPassword()},String.class);
			
			return docid1;
		} catch (Exception e) {
			// TODO: handle exception
			
			System.out.println(e);
			return null;
		}
		//PreparedStatement ps=null;
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
		
	}
	
	public Doctor validatedoctor(String emailid, String password) {
		// TODO Auto-generated method stub
		DetachedCriteria dec=DetachedCriteria.forClass(Doctor.class);
		dec.add(Restrictions.eq("emailid", emailid));
		dec.add(Restrictions.eq("password", password));
		
		return null;
	}
	
	public String loginUser(String email, String password)
	{		
			String sql = "select email from doctor where emailid=? AND password=?";		
			return sql;
	}
*/
	public List<Doctor> getDataById(String email, String password) {
		return jdbctemplate.query("select * from doctor where emailid ='"+email+"' and password='"+password+"'", new RowMapper<Doctor>(){

			@Override
			public Doctor mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Doctor u = new Doctor();	
				
				u.setEmailid(rs.getString(5));
				u.setPassword(rs.getString(6));//getting value through index and index start from 1.
				
				System.out.println(u.getEmailid() +" "+ u.getPassword());
				return u;
			}
			
		});
	}
	public List<Hospital> loginhospital(String hospId, String password) {
		// TODO Auto-generated method stub
		return jdbctemplate.query("select * from hospital where hospitalid ='"+hospId+"' and password='"+password+"'", new RowMapper<Hospital>(){

			@Override
			public Hospital mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Hospital h = new Hospital();		
				h.setHospitalID(rs.getInt(11));
				h.setPassword(rs.getString(3));//getting value through index and index start from 1.
				
				System.out.println(h.getHospitalID() +" "+ h.getPassword());
				return h;
			}		
		});
	}
	public List<Hospital> ToDecryptpassword(String hospId) {
		return jdbctemplate.query("select * from hospital where hospitalid ='"+hospId+"' or phoneno='"+hospId+"'", new RowMapper<Hospital>(){

			@Override
			public Hospital mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Hospital u = new Hospital();	
				
				//u.setEmailid(rs.getString(6));
				u.setPassword(rs.getString(3));
				
				System.out.println( u.getPassword());
				return u;
			}
			
		});
	}
	public List<Doctor> Togetencryptpassword(String email) {
		return jdbctemplate.query("select * from doctor where emailid ='"+email+"' or phonenumber='"+email+"'", new RowMapper<Doctor>(){

			@Override
			public Doctor mapRow(ResultSet rs, int arg1) throws SQLException 
			{
				Doctor u = new Doctor();	
				
				//u.setEmailid(rs.getString(6));
				u.setPassword(rs.getString(6));
				
				System.out.println( u.getPassword());
				return u;
			}
			
		});
	}
	public void updateStatus(int otp) {
		// TODO Auto-generated method stub
		
		String sql=" UPDATE doctor SET STATUS=1 WHERE otp="+otp+"";
		jdbctemplate.update(sql);
		
	}

}
