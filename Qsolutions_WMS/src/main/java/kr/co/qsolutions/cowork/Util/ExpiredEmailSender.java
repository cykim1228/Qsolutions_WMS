package kr.co.qsolutions.cowork.Util;

import java.util.List;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.VO.ContractVO;
import kr.co.qsolutions.cowork.VO.EmailForm;

@Service
public class ExpiredEmailSender {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	CompanyService companyservice;
	
	@Async
	public void ExpiredContractSend() throws Exception {
    	
    	List<ContractVO> contractVO = companyservice.ExpiredContractSend();
    	
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
		
        
    	
    }
	
}
