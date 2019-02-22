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
        //���� �߼� ��� ����
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(emailForm.getSubject(), "utf-8"); //���� ����
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
        
        //��Ʈ�� ���۸� �̿��Ͽ� inputStream�� ��Ʈ������ ��ȯ�ϰ� utf-8�� ��ȯ�ϴ� ���
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

           messageHelper.setSubject("[���������ý���] ���ϼ���");
           messageHelper.setText(htmlContent, true);
           messageHelper.setFrom("zzanzzanyoung@gmail.com", "QSolutions");
           messageHelper.setTo(new InternetAddress(userId, "utf-8"));
           
  /*         // ���� ÷��
           messageHelper.addAttachment(MimeUtility.encodeText("����ڰ���.xlsx", "UTF-8", "B"), new FileDataSource("C:/OpenProject/����ڰ���.xlsx"));
           
           // ���� ÷��2 - �̹������ϸ� ����, ������ �̸����� ��� �߰�
           messageHelper.addInline("qwer", new FileDataSource("C:/OpenProject/qwer.jpg"));*/
           
           //���� ������
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