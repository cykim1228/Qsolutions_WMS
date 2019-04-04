package kr.co.qsolutions.cowork.Controller;

import java.io.BufferedReader;
import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.FileDTO;
import kr.co.qsolutions.cowork.DTO.SubCoworkDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.Service.CoworkService;
import kr.co.qsolutions.cowork.Service.UserService;
import kr.co.qsolutions.cowork.Util.AccountControl;
import kr.co.qsolutions.cowork.Util.FileUploadService;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.FileVO;
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
    
    @Autowired
	FileUploadService fileUploadService;
	
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
		
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setUserid(viewuserid);
		
		List<CoworkVO> coworkVO  = userservice.selectUserCowork(coworkDTO);
		
		List<CoworkVO> managerCoworkVO  = userservice.selectManagerCowork(coworkDTO);

		UserVO userVO = userservice.UserViewSelect(viewuserid);
		
		model.addAttribute("loginVO", loginVO);
		model.addAttribute("userVO", userVO);
		model.addAttribute("coworkVO", coworkVO);
		model.addAttribute("managerCoworkVO", managerCoworkVO);
		
		System.out.println("userVO : " + userVO);
		System.out.println("coworkVO : " + coworkVO);
		System.out.println("managerCoworkVO : " + managerCoworkVO);
		
		returnUrl = "user/view";
		return returnUrl;
	}
	@RequestMapping(value = "/User/Insertform")
	public String UserInsertform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		UserVO userVO = new UserVO();
		
		List<CompanyVO> companyVO = (List<CompanyVO>) coworkservice.CompanyAllSelect();
		
		List<UserVO> deptVO = (List<UserVO>)userservice.SelectDeptList();
		List<UserVO> positionVO = (List<UserVO>)userservice.SelectPositionList();
		
		model.addAttribute("deptVO", deptVO);
		model.addAttribute("positionVO", positionVO);
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("userVO", userVO);
		
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

        String tmpcodeStr = "";
		String tmpstr = "";
		Date date = new Date();
        SimpleDateFormat dt = new SimpleDateFormat("yyyyMMdd");
    	String nowdate = dt.format(date.getTime());
		// userid 생성 및 기본 입력 데이터 호출
		String newuserid = userservice.UserIdSelect(nowdate);
		
		if(newuserid == null || newuserid == "") {
			tmpcodeStr = "U" + nowdate + "00001";
		} else {
			tmpstr = newuserid.substring(9,14);
			int tmpcode = Integer.parseInt(tmpstr,10);
			tmpcodeStr = newuserid.substring(0, 9);
			tmpcode = tmpcode + 1;
			newuserid = tmpcodeStr + tmpcode;
			if( newuserid.length() < 14) {
				for(int i = newuserid.length();i < 14; i++)
				tmpcodeStr = tmpcodeStr + 0;
			}
			tmpcodeStr = tmpcodeStr + tmpcode;
		}
		System.out.println("tmpcodeStr=="+tmpcodeStr);
		//coworkcode생성=========================================================
		UserVO userVO = new UserVO();
		userVO.setUserid(tmpcodeStr);
		
		userDTO.setUserid(tmpcodeStr);
        
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
	
	@RequestMapping(value = "/User/Updateforms")
	public String UsersUpdateform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
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
		
		returnUrl = "user/modifyUser";
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
	
	
	@RequestMapping(value = "/User/Setting")
	public String UserSetting(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		System.out.println("loginVO : " + loginVO);
		
		String userid = loginVO.getUserid();
		
		String tmpID = request.getParameter("userid");
		
		List<CompanyVO> companyVO = (List<CompanyVO>) coworkservice.CompanyAllSelect();
		
		UserVO userVO = (UserVO)userservice.UserViewSelect(userid);
		List<UserVO> deptVO = (List<UserVO>)userservice.SelectDeptList();
		List<UserVO> positionVO = (List<UserVO>)userservice.SelectPositionList();
		
		FileVO usercolorVO = userservice.SelectUserColor(userid);
		
		System.out.println("--usercolorVO : " + usercolorVO);
		model.addAttribute("deptVO", deptVO);
		model.addAttribute("positionVO", positionVO);
		model.addAttribute("userVO", userVO);
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("usercolorVO", usercolorVO);
		
		returnUrl = "user/setting";
		return returnUrl;
	}
	
	@RequestMapping(value = "/User/Color")
	public String ColorUpdate(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		FileDTO fileDTO = mapper.readValue(body, FileDTO.class);
        String jsonStr = mapper.writeValueAsString(fileDTO);
        
        System.out.println("fileDTO : " + fileDTO);
        
        userservice.InsertUserColor(fileDTO);
		
		returnUrl = "redirect:/";
		return returnUrl;
	}
	
	@RequestMapping(value = "/User/Upload")
	public String upload(HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model, @RequestParam("file") MultipartFile file) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		String userid = loginVO.getUserid();
		
		String path = "C://upload//" + userid;
		
		System.out.println("userid : " + userid);
		
		File files = new File(path);
		
		if(!files.exists()){
			//디렉토리 생성 메서드
			files.mkdirs();
			System.out.println("created directory successfully!");
		}
		
		String url = fileUploadService.restore(userid, file);
		
		FileDTO fileDTO = new FileDTO();
		fileDTO.setUserid(userid);
        
        System.out.println("fileDTO : " + fileDTO);
        
        userservice.InsertProfileUpload(fileDTO);
		
		model.addAttribute("url", url);
		
	    return "Login/dashboard";
	}

}
