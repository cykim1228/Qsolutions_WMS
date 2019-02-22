package kr.co.qsolutions.cowork.Util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.qsolutions.cowork.VO.EmailForm;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

@Component
public class EmailSender {
    @Autowired
    private JavaMailSender mailSender;
    
    /*
    public void sendEmail(EmailForm emailForm) throws Exception{
        //메일 발송 기능 제공
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(emailForm.getSubject(), "utf-8"); //메일 제목
        msg.setText(emailForm.getContent(), "utf-8", "html");
        
		msg.setRecipient(RecipientType.TO, new InternetAddress(emailForm.getReceiver()));
		
        try {
        	mailSender.send(msg);
		} catch (MailException ex) {
			ex.printStackTrace();
		}
    }
    */
    
    public void sendMail(String userId, String filePath, HttpSession session) throws IOException {

    	MimeMessage message = mailSender.createMimeMessage();

        String file = session.getServletContext().getRealPath("WEB-INF/views") + filePath;
        InputStream is = new FileInputStream(file);
        String htmlContent = "";
        
        //스트링 버퍼를 이용하여 inputStream을 스트링으로 변환하고 utf-8로 변환하는 방법
        String UTF8 = "utf8";
        StringBuffer buffer = new StringBuffer();
        int BUFFER_SIZE = 8192;
        BufferedReader br = new BufferedReader(new InputStreamReader(is, UTF8), BUFFER_SIZE);
        String str;
        
        while ((str = br.readLine()) != null) {
           htmlContent += str;
        }

        try {

           MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

           messageHelper.setSubject("[업무관리시스템] 메일서비스");
           messageHelper.setText(htmlContent, true);
           messageHelper.setFrom("zzanzzanyoung@gmail.com", "QSolutions");
           messageHelper.setTo(new InternetAddress(userId, "utf-8"));
           
  /*         // 파일 첨부
           messageHelper.addAttachment(MimeUtility.encodeText("사용자관리.xlsx", "UTF-8", "B"), new FileDataSource("C:/OpenProject/사용자관리.xlsx"));
           
           // 파일 첨부2 - 이미지파일만 가능, 본문에 미리보기 기능 추가
           messageHelper.addInline("qwer", new FileDataSource("C:/OpenProject/qwer.jpg"));*/
           
           //메일 보내기
           mailSender.send(message);
           
        } catch (MailException e) {
        	e.printStackTrace();
        	return;
        } catch (Throwable e) {
        	e.printStackTrace();
        	return;
        }
        
    }
    
}