package kr.co.qsolutions.cowork.Controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.management.monitor.CounterMonitorMBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ast.TypeReference;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.SubCoworkDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.Service.CoworkService;
import kr.co.qsolutions.cowork.Service.UserService;
import kr.co.qsolutions.cowork.Util.AccountControl;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserVO;



@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService userservice;
	
	@Inject
	private CompanyService companyservice;
	
	@Inject
	private CoworkService coworkservice;
	
	@Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
 
    private OAuth2Operations oauthOperations;
	
	String returnUrl;
	
	
	@RequestMapping(value = "/User/List")
	public String UserList(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<UserVO> userVO = userservice.SelectUserList(pagingVO);
		
		int totalpage = userservice.SelectUserCount();
		pagingVO.setTotal(totalpage);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("userVO",userVO);
		
		System.out.println("userVO : " + userVO);
		
		return "user/viewlist";
	}
	@RequestMapping(value = "/User/View")
	public String UserView(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		String viewuserid = request.getParameter("userid");
        

		UserVO userVO = userservice.UserViewSelect(viewuserid);
		model.addAttribute("userVO", userVO);
		
		returnUrl = "user/view";
		return returnUrl;
	}
	@RequestMapping(value = "/User/Insertform")
	public String UserInsertform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<CompanyVO> companyVO = (List<CompanyVO>) coworkservice.CompanyAllSelect();
		
		List<UserVO> deptVO = (List<UserVO>)userservice.SelectDeptList();
		List<UserVO> positionVO = (List<UserVO>)userservice.SelectPositionList();
		
		model.addAttribute("deptVO", deptVO);
		model.addAttribute("positionVO", positionVO);
		model.addAttribute("companyVO", companyVO);
		
		System.out.println("deptVO : " + deptVO);
		
		returnUrl = "user/insert";
		return returnUrl;
	}
	
	@RequestMapping(value = "/User/Insert")
	public String UserInsert(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        UserDTO userDTO = mapper.readValue(body, UserDTO.class);
        String jsonStr = mapper.writeValueAsString(userDTO);

        
//        if(userDTO.getCompanyusercode()==0) {
//        	userDTO.setDeptcode(deptcode);("");
//        }
        
        userDTO.setUserpasswd(AccountControl.CryptPW(userDTO.getUserpasswd()));
        userservice.InsertUser(userDTO);
        
		
        
		returnUrl = "redirect:/User/List";
		return returnUrl;
	}

	@RequestMapping(value = "/User/Updateform")
	public String UserUpdateform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		String tmpID = request.getParameter("userid");
		
		List<CompanyVO> companyVO = (List<CompanyVO>) coworkservice.CompanyAllSelect();
		
		UserVO userVO = (UserVO)userservice.UserViewSelect(tmpID);
		List<UserVO> deptVO = (List<UserVO>)userservice.SelectDeptList();
		List<UserVO> positionVO = (List<UserVO>)userservice.SelectPositionList();
		
		model.addAttribute("deptVO", deptVO);
		model.addAttribute("positionVO", positionVO);
		model.addAttribute("userVO", userVO);
		model.addAttribute("companyVO", companyVO);
		
		returnUrl = "user/modify";
		return returnUrl;
	}
	@RequestMapping(value = "/User/Update")
	public String UserUpdate(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        UserDTO userDTO = mapper.readValue(body, UserDTO.class);
        String jsonStr = mapper.writeValueAsString(userDTO);
        
        userDTO.setUserpasswd(AccountControl.CryptPW(userDTO.getUserpasswd()));
        userservice.UpdateUser(userDTO);
		
		returnUrl = "redirect:/User/List";
		return returnUrl;
	}
	@RequestMapping(value = "/User/Delete")
	public String UserDelete(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        UserDTO userDTO = mapper.readValue(body, UserDTO.class);
        String jsonStr = mapper.writeValueAsString(userDTO);
		
        userservice.DeleteUser(userDTO);
		
		returnUrl = "redirect:/User/List";
		return returnUrl;
	}
	
	


}
