package kr.co.qsolutions.cowork.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import kr.co.qsolutions.cowork.Util.AccountControl;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.Service.UserService;
import kr.co.qsolutions.cowork.VO.UserVO;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private UserService userservice;
	
	UserVO uservo = new UserVO();
	
	String errorcode = "";
	String returnUrl;

	//-----------DAO------------------------------------------
	
	
	//----Main Controller
	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "Login/login";
	}
	
	//Login Controller
	@RequestMapping(value = "/Login")
	public String login(UserDTO userDTO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		String userid = userDTO.getUserid();
		String userpw = userDTO.getUserpasswd();				

		AccountControl ac = new AccountControl();
		
		uservo = (UserVO)userservice.UserCheckID(userid);
		
		String tmpPassWD = ac.EncryptPW(uservo.getUserpasswd());

		
		if ( session.getAttribute("login") != null ){
			session.removeAttribute("login"); // �������� ������ �ش�.
        }
		
		if(uservo!=null) {
        	session.setAttribute("login", uservo); 
    		if(tmpPassWD.equals(userpw)) {
    			//Input passwd equals DB Passwd

				session.setAttribute("login", uservo); // ���ǿ� login���̶� �̸����� UserVO ��ü�� ������ ��.

		        // 1. �α����� �����ϸ�, �� �������� �α��� ������ ��Ű�� üũ�� ���·� �α��� ��û�� �Դ����� Ȯ���Ѵ�.
		        if (userDTO.isUseCookie() ){ // dto Ŭ���� �ȿ� useCookie �׸� ������ �Ѿ�� ��Ű��� ����(true/false)�� ������� ����
		            // ��Ű ����Ѵٴ°� üũ�Ǿ� ������...
		            // ��Ű�� �����ϰ� ���� �α��εǾ� ���� �� �����Ǿ��� ������ id�� ��Ű�� �����Ѵ�.
		            Cookie cookie = new Cookie("loginCookie", session.getId());
		            // ��Ű�� ã�� ��θ� ���ؽ�Ʈ ��η� ������ �ְ�...
		            cookie.setPath("/");
		            int amount = 60 * 60 * 24 * 7;
		            cookie.setMaxAge(amount); // ������ (��)������ 7�������� ��ȿ�ð��� ������ �ش�.
		            // ��Ű�� ������ �ش�.
		            response.addCookie(cookie);
		             
		            // currentTimeMills()�� 1/1000�� ���������� 1000���ؼ� ���ؾ���
		            Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
		            // ���� ���� id�� ��ȿ�ð��� ����� ���̺� �����Ѵ�.
		            userservice.keepLogin(userDTO.getUserid(), session.getId(), sessionLimit);
		        }
				
    			returnUrl = "redirect:/Cowork/List/";
    			
    		}else {
    			errorcode = "ERR000002";
    			returnUrl = "redirect:/error/";
    		}
		}else {
			// not found UserID?
			errorcode = "ERR00001"; //ERR00001 = �α��ΰ����� �������� �ʽ��ϴ�.
			returnUrl = "redirect:/error/";
		}
		
		return returnUrl;
	}

	// Logout Controller
    @RequestMapping(value="/Logout")
    public String logout(HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception {

    	if(session == null) {
    		return "redirect:/";
    	}
		UserVO loginvo = (UserVO) session.getAttribute("login");
        Object obj = session.getAttribute("login");

        //Login Date ó�� 
        Date date = new Date(System.currentTimeMillis());
//        UserVO.setUcode(loginVO.getUserID());
//		logDTO.setLogDate(date);
//		logDTO.setLogData("Logout Success");
//		logDTO.setLogType("Account");
//		logDTO.setComDate(null);
//		logservice.InsertLog(logDTO);
        
        if ( obj != null ){
        	UserVO uservo = (UserVO)obj;
            // null�� �ƴ� ��� ����
            session.removeAttribute("login");
            session.invalidate(); // ���� ��ü�� ��������
            //��Ű�� �����ͺ���
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if ( loginCookie != null ){
                // null�� �ƴϸ� �����ϸ�!
                loginCookie.setPath("/");
                // ��Ű�� ���� �� ��ȿ�ð��� 0���� �����ϴ� �� !!! invalidate������ ����.
                loginCookie.setMaxAge(0);
                // ��Ű ������ �����Ѵ�.
                response.addCookie(loginCookie);
                 
                // ����� ���̺����� ��ȿ�Ⱓ�� ����ð����� �ٽ� �����������.
                userservice.keepLogin(uservo.getUserid(), session.getId(), date);
            }
        }
        returnUrl = "redirect:/";
        return returnUrl; // �α׾ƿ� �� �Խñ� ������� �̵��ϵ���
    }
}
