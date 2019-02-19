package kr.co.qsolutions.cowork.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.qsolutions.cowork.Util.EmailSender;
import kr.co.qsolutions.cowork.VO.EmailForm;

@Controller
public class EmailController {
        
        @Autowired
        private EmailSender emailSender;
            
        @RequestMapping(value="/Cowork/send",method=RequestMethod.GET)
        public String formback() {
            return "cowork/mailform";
        }
        
        @RequestMapping(value="/Cowork/send",method=RequestMethod.POST)
        public String submit(EmailForm form) throws Exception{
            emailSender.sendEmail(form);
            
            
            
            return "redirect:/Cowork/List";
        }
        
        
        
}