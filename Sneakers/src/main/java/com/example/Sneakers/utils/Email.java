package com.example.Sneakers.utils;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	public static final String from = "ducanh21112003@gmail.com";
	public static final String password = "ymfudurkopzezdnn";
	public boolean sendEmail(String to, String subject,String content) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from,password);
			}
		};
		Session session = Session.getInstance(props,auth);
		
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.addHeader("Content-type", "text/html; charset = UTF-8");
			
			msg.setFrom(from);
			
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to,false));
			
			msg.setSubject(subject);
			
			msg.setSentDate(new Date());
			
			msg.setContent(content, "text/html; charset = UTF-8");
			
			Transport.send(msg);
			
			System.out.println("Gửi email thành công !");
			return true;
			
		} catch (Exception e) {
			System.out.println("Gửi email không thành công !");
			e.printStackTrace();
			return false;
		}
	}
}