package kr.co.qsolutions.cowork.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.ManagerDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.Service.CoworkService;
import kr.co.qsolutions.cowork.Service.ManagerService;
import kr.co.qsolutions.cowork.Service.UserService;
import kr.co.qsolutions.cowork.Util.AccountControl;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.ManagerVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Controller
public class ManagerController {

private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Inject
	private UserService userservice;
	
	@Inject
	private CompanyService companyservice;
	
	@Inject
	private CoworkService coworkservice;
	
	@Inject
	private ManagerService managerservice;
	
	@Autowired
    private GoogleConnectionFactory googleConnectionFactory;
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
 
    private OAuth2Operations oauthOperations;
	
	String returnUrl;
	
	@RequestMapping(value = "/Manager/List")
	public String ManagerList(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<ManagerVO> managerVO = managerservice.SelectManagerList(pagingVO);
		
		int totalpage = managerservice.SelectManagerCount();
		pagingVO.setTotal(totalpage);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("managerVO",managerVO);
		
		System.out.println("managerVO : " + managerVO);
		
		return "manager/viewlist";
	}
	@RequestMapping(value = "/Manager/View")
	public String ManagerView(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		String viewmanagerid = request.getParameter("managerid");
		
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setUserid(viewmanagerid);
		
		List<CoworkVO> coworkVO  = managerservice.selectUserCowork(coworkDTO);
		
		List<CoworkVO> managerCoworkVO  = managerservice.selectManagerCowork(coworkDTO);

		ManagerVO managerVO = managerservice.ManagerViewSelect(viewmanagerid);
		
		model.addAttribute("managerVO", managerVO);
		model.addAttribute("coworkVO", coworkVO);
		model.addAttribute("managerCoworkVO", managerCoworkVO);
		
		System.out.println("coworkVO : " + coworkVO);
		System.out.println("managerCoworkVO : " + managerCoworkVO);
		
		returnUrl = "manager/view";
		return returnUrl;
	}
	@RequestMapping(value = "/Manager/Insertform")
	public String ManagerInsertform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<CompanyVO> companyVO = (List<CompanyVO>) coworkservice.CompanyAllSelect();
		
		List<UserVO> deptVO = (List<UserVO>)userservice.SelectDeptList();
		List<UserVO> positionVO = (List<UserVO>)userservice.SelectPositionList();
		
		model.addAttribute("deptVO", deptVO);
		model.addAttribute("positionVO", positionVO);
		model.addAttribute("companyVO", companyVO);
		
		System.out.println("deptVO : " + deptVO);
		
		returnUrl = "manager/insert";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Manager/Insert")
	public String ManagerInsert(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		ManagerDTO managerDTO = mapper.readValue(body, ManagerDTO.class);
        String jsonStr = mapper.writeValueAsString(managerDTO);

        
//        if(userDTO.getCompanyusercode()==0) {
//        	userDTO.setDeptcode(deptcode);("");
//        }
        
        managerservice.InsertManager(managerDTO);
        
		returnUrl = "redirect:/Manager/List";
		return returnUrl;
	}

	@RequestMapping(value = "/Manager/Updateform")
	public String ManagerUpdateform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		String tmpID = request.getParameter("managerid");
		
		List<CompanyVO> companyVO = (List<CompanyVO>) coworkservice.CompanyAllSelect();
		
		ManagerVO managerVO = (ManagerVO)managerservice.ManagerViewSelect(tmpID);
		List<ManagerVO> positionVO = (List<ManagerVO>)managerservice.SelectPositionList();
		
		model.addAttribute("positionVO", positionVO);
		model.addAttribute("managerVO", managerVO);
		model.addAttribute("companyVO", companyVO);
		
		returnUrl = "manager/modify";
		return returnUrl;
	}
	@RequestMapping(value = "/Manager/Update")
	public String ManagerUpdate(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        ManagerDTO managerDTO = mapper.readValue(body, ManagerDTO.class);
        String jsonStr = mapper.writeValueAsString(managerDTO);
        
        managerservice.UpdateManager(managerDTO);
		
		returnUrl = "redirect:/Manager/List";
		return returnUrl;
	}
	@RequestMapping(value = "/Manager/Delete")
	public String ManagerDelete(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        ManagerDTO managerDTO = mapper.readValue(body, ManagerDTO.class);
        String jsonStr = mapper.writeValueAsString(managerDTO);
		
        managerservice.DeleteManager(managerDTO);
		
		returnUrl = "redirect:/Manager/List";
		return returnUrl;
	}
	
}
