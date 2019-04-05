package com.medcloud.Dao;

import org.springframework.jdbc.core.JdbcTemplate;

import com.medcloud.Model.RoutineMedicalRecord;

public class RoutineDao {
	
	public JdbcTemplate jdbctemplate;
	
	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}
	
	public int insertroutine(RoutineMedicalRecord r)
	{
		String sql="insert into routine_medical_recored(height,weight,pulse,bloodpressure,sugar) "
				+ "values("+r.getHeight()+","+r.getWeight()+","+r.getPulse()+","+r.getBloodpressure()+","+r.getSugar()+")";
		return jdbctemplate.update(sql);
		
	}
	
	
	
	

}
