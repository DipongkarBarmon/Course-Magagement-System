package com.dip;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	
		public String getRandom() {
			 
			  int code = (int)(Math.random() * 900000) + 100000;
			
			return String.valueOf(code);
		}
		
	public boolean sendVerificationEmail(String toEmail, String msg) {
		
		boolean test=false;
	    String fromEmail = "dipongkarbarman314@gmail.com";
	    String password = "xttczpgjqjgihsps";

	    Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");

	    Session session = Session.getInstance(props, new Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(fromEmail, password);
	        }
	    });

	    try {
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(fromEmail));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
	        message.setSubject("Verify your email");
	        message.setContent(msg, "text/html; charset=utf-8");

	        Transport.send(message);
	        test=true;
	        System.out.println("Verification email sent.");
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
	    
	    return test;
	}
	
	  
}
