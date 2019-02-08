package kr.co.qsolutions.cowork.Controller;

import java.io.IOException;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
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
			session.removeAttribute("login"); // 기존값을 제거해 준다.
        }
		
		if(uservo!=null) {
        	session.setAttribute("login", uservo); 
    		if(tmpPassWD.equals(userpw)) {
    			//Input passwd equals DB Passwd

				session.setAttribute("login", uservo); // 세션에 login인이란 이름으로 UserVO 객체를 저장해 놈.

		        // 1. 로그인이 성공하면, 그 다음으로 로그인 폼에서 쿠키가 체크된 상태로 로그인 요청이 왔는지를 확인한다.
		        if (userDTO.isUseCookie() ){ // dto 클래스 안에 useCookie 항목에 폼에서 넘어온 쿠키사용 여부(true/false)가 들어있을 것임
		            // 쿠키 사용한다는게 체크되어 있으면...
		            // 쿠키를 생성하고 현재 로그인되어 있을 때 생성되었던 세션의 id를 쿠키에 저장한다.
		            Cookie cookie = new Cookie("loginCookie", session.getId());
		            // 쿠키를 찾을 경로를 컨텍스트 경로로 변경해 주고...
		            cookie.setPath("/");
		            int amount = 60 * 60 * 24 * 7;
		            cookie.setMaxAge(amount); // 단위는 (초)임으로 7일정도로 유효시간을 설정해 준다.
		            // 쿠키를 적용해 준다.
		            response.addCookie(cookie);
		             
		            // currentTimeMills()가 1/1000초 단위임으로 1000곱해서 더해야함
		            Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
		            // 현재 세션 id와 유효시간을 사용자 테이블에 저장한다.
		            userservice.keepLogin(userDTO.getUserid(), session.getId(), sessionLimit);
		        }
				
    			returnUrl = "redirect:/Cowork/List/";
    			
    		}else {
    			errorcode = "ERR000002";
    			returnUrl = "redirect:/error/";
    		}
		}else {
			// not found UserID?
			errorcode = "ERR00001"; //ERR00001 = 로그인계정이 존재하지 않습니다.
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

        //Login Date 처리 
        Date date = new Date(System.currentTimeMillis());
//        UserVO.setUcode(loginVO.getUserID());
//		logDTO.setLogDate(date);
//		logDTO.setLogData("Logout Success");
//		logDTO.setLogType("Account");
//		logDTO.setComDate(null);
//		logservice.InsertLog(logDTO);
        
        if ( obj != null ){
        	UserVO uservo = (UserVO)obj;
            // null이 아닐 경우 제거
            session.removeAttribute("login");
            session.invalidate(); // 세션 전체를 날려버림
            //쿠키를 가져와보고
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if ( loginCookie != null ){
                // null이 아니면 존재하면!
                loginCookie.setPath("/");
                // 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.
                loginCookie.setMaxAge(0);
                // 쿠키 설정을 적용한다.
                response.addCookie(loginCookie);
                 
                // 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅해줘야함.
                userservice.keepLogin(uservo.getUserid(), session.getId(), date);
            }
        }
        returnUrl = "redirect:/";
        return returnUrl; // 로그아웃 후 게시글 목록으로 이동하도록
    }
    
	// 로그인 첫 화면 요청 메소드
 	@RequestMapping(value = "/Login/googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
 	public String login(Model model, HttpSession session) {

 		/* 구글code 발행 */
 		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
 		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

 		System.out.println("구글:" + url);

 		model.addAttribute("google_url", url);

 		/* 생성한 인증 URL을 View로 전달 */
 		return "Login/googleLogin";
 	}

	// 구글 Callback호출 메소드
 	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
 	public String googleCallback(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, @RequestParam String code) throws Exception {
 		System.out.println("여기는 googleCallback");

 		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(), null);
        
        String accessToken = accessGrant.getAccessToken();
        Long expireTime = accessGrant.getExpireTime();
        
        if (expireTime != null && expireTime < System.currentTimeMillis()) {
            accessToken = accessGrant.getRefreshToken();
            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
        }
         
        Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
        Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
        
        PlusOperations plusOperations = google.plusOperations();
        Person profile = plusOperations.getGoogleProfile();

 		
 		//Save into DB
        UserDTO userDTO = new UserDTO();
        userDTO.setGmail(profile.getAccountEmail());
        userDTO.setGname(profile.getDisplayName());
        userDTO.setOauthcode(profile.getId());
        
        userservice.googleLogin(userDTO);
        
        // set info session userid
        session.setAttribute("gmail", profile.getAboutMe());
        session.setAttribute("gname", profile.getDisplayName());
        session.setAttribute("imageUrl", profile.getImageUrl());
        session.setAttribute("oauthcode", profile.getBirthday());
        
 		return "Login/googleSuccess";
 	}
}