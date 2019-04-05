package com.medcloud.Dao;

import java.io.IOException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.multipart.MultipartFile;

public class ImageDao {
	
	JdbcTemplate jdbctemplate;

	public void setJdbctemplate(JdbcTemplate jdbctemplate) {
		this.jdbctemplate = jdbctemplate;
	}

	public int insertimage(MultipartFile photo) throws IOException {
		// TODO Auto-generated method stub
		byte[] photobytes=photo.getBytes();
		String sql="insert into picupload(image) values(?)";
		return jdbctemplate.update(sql,new Object[] {photobytes});
	}
	

}
