package kr.co.qsolutions.cowork.Task;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.qsolutions.cowork.Service.CompanyServiceImpl;
import kr.co.qsolutions.cowork.VO.EmailForm;

@Component
public class ExpiredEmailTask {
	
	@Autowired
    private JavaMailSender mailSender;
	
	@Scheduled(cron="*/30 * * * * *")
	public void expiredEmailSend() throws Exception {
		System.out.println("expiredEmailSend......");
		System.out.println(new Date());
	}
	
	public void ExpiredContractSend() throws Exception {
    	
    	EmailForm mailForm = new EmailForm();
    	
    	String receiver = "chanyoung.kim@qsolutions.co.kr";
    	String subject = "[업무관리시스템] 메일서비스";
    	String content = "<h1>Hello world</h1>";
    	
    	System.out.println("receiver : " + receiver);
    	System.out.println("subject : " + subject);
    	System.out.println("content : " + content);
    	
    	mailForm.setReceiver(receiver);
    	mailForm.setSubject(subject);
    	mailForm.setContent(content);
    	
    	MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(subject, "utf-8"); //메일 제목
        msg.setText(content, "utf-8", "html");
        msg.setFrom(new InternetAddress("chanyoung.kim@qsolutions.co.kr","QSolutions"));
        
		msg.setRecipient(RecipientType.TO, new InternetAddress(receiver));
		
		try {
        	mailSender.send(msg);
		} catch (MailException ex) {
			ex.printStackTrace();
		}
		
    }
	
	public void sendEmail(EmailForm emailForm) throws Exception{
        //메일 발송 기능 제공
    	
    	System.out.println("sendEmail......");
    	
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(emailForm.getSubject(), "utf-8"); //메일 제목
        msg.setText(emailForm.getContent(), "utf-8", "html");
        msg.setFrom(new InternetAddress("chanyoung.kim@qsolutions.co.kr","QSolutions"));
        
		msg.setRecipient(RecipientType.TO, new InternetAddress(emailForm.getReceiver()));
		
        try {
        	mailSender.send(msg);
		} catch (MailException ex) {
			ex.printStackTrace();
		}
    }
	
}
