package com.medcloud.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailService {

	public static void sendMail(String to, String subject, String messageText) {
		// TODO Auto-generated method stub
		
		//  https://myaccount.google.com/lesssecureapps   first make less secure by turning to this link 
		//String host="avilashj34@gmail.com";
		
		String from="finalyearbeproject2019@gmail.com";
		String password="finalyear2019";
		
		try{
			Properties properties = System.getProperties();
			properties.put("mail.smtp.host","smtp.gmail.com");
			properties.put("mail.smtp.starttls.enable", "true");
	        properties.put("mail.smtp.auth", "true");
	        properties.put("mail.smtp.port", "587");
	        
	        Session session = Session.getDefaultInstance(properties,new javax.mail.Authenticator() 
	         {  
	           protected PasswordAuthentication getPasswordAuthentication() 
	            {  
	               return new PasswordAuthentication(from,password);  
	            }  
	        });  
	        
	        MimeMessage message=new MimeMessage(session);
	        message.setFrom(new InternetAddress(from));  
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
            message.setSubject(subject);  // dynamic
            message.setText(messageText);         // dynamic
            Transport.send(message);  
            System.out.println("Done"); 
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		 
		
	}
	
	
	

}
