package kr.co.qsolutions.cowork.Util;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.qsolutions.cowork.VO.EmailForm;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

@Component
public class EmailSender {
    @Autowired
    private JavaMailSender mailSender;
    
    public void sendEmail(EmailForm emailForm) throws Exception{
        //메일 발송 기능 제공
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(emailForm.getSubject(), "utf-8"); //메일 제목
        msg.setText(emailForm.getContent(), "utf-8", "html");
        
		/*
		 * msg.setSubject("[안내] 회원가입을 축하합니다.", "utf-8"); String htmlStr =
		 * "<b>안녕하세요</b> 회원님.<br>" + "회원가입을 진심으로 감사드립니다.<br>" +
		 * "<a href=\"http://www.naver.com\">사이트 가기</a>"; msg.setText(htmlStr, "utf-8",
		 * "html");
		 */
        
		msg.setRecipient(RecipientType.TO, new InternetAddress(emailForm.getReceiver()));
		
        try {
        	mailSender.send(msg);
		} catch (MailException ex) {
			ex.printStackTrace();
		}
    }
}