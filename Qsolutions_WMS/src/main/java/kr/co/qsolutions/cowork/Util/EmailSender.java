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
        //���� �߼� ��� ����
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(emailForm.getSubject(), "utf-8"); //���� ����
        msg.setText(emailForm.getContent(), "utf-8", "html");
        
		/*
		 * msg.setSubject("[�ȳ�] ȸ�������� �����մϴ�.", "utf-8"); String htmlStr =
		 * "<b>�ȳ��ϼ���</b> ȸ����.<br>" + "ȸ�������� �������� ����帳�ϴ�.<br>" +
		 * "<a href=\"http://www.naver.com\">����Ʈ ����</a>"; msg.setText(htmlStr, "utf-8",
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