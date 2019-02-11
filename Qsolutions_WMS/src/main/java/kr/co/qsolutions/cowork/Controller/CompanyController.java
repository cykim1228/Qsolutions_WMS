package kr.co.qsolutions.cowork.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.management.monitor.CounterMonitorMBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.SubCoworkDTO;
import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.Service.CoworkService;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;



/**
 * Handles requests for the application home page.
 */
@Controller
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Inject
	private CompanyService companyservice;
	
	@Inject
	private CoworkService coworkservice;
	
	String returnUrl;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/Company/List")
	public String CoworkList(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<CompanyVO> companylist = companyservice.SelectCompanyList(pagingVO);
		pagingVO.setTotal(companyservice.SelectCompanyCount(pagingVO));
		
//		pagingVO.setTotal(coworkservice.CoworkViewListCount(pagingVO));
//		List<CoworkVO> listvo = coworkservice.CoworkViewListSelect(pagingVO);

		model.addAttribute("companylistvo",companylist);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("userid", loginVO.getUserid());
		
		return "company/viewlist";
	}
	@RequestMapping(value = "/Company/View")
	public String CoworkView(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		String tmpcode = (String)request.getParameter("companycode");
		String tmpname = (String)request.getParameter("companyname");
		
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setCompanycode(tmpcode);
		companyDTO.setCompanyname(tmpname);
		
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setCoworkcompany(tmpcode);
		
		List<UserVO> userList = companyservice.SelectUserCompany(companyDTO);
		
		List<UserVO> companyuserList = companyservice.SelectCompanyUser(companyDTO);
		
		List<CoworkVO> coworkList = companyservice.CoworkViewSelectCompany(tmpcode);
		
		System.out.println("업무 List 컨트롤러 : " + tmpcode);
		
		System.out.println("coworkList : " + coworkList);
		
		System.out.println("companyDTO : " + companyDTO);
		
		System.out.println("companyuserList : " + companyuserList);
		
		System.out.println("userList : " + userList);
		
		CompanyVO companyVO = companyservice.SelectCompanyView(companyDTO);
		//담당자 추가
		model.addAttribute("userList", userList);
		model.addAttribute("coworkList", coworkList);
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("companyuserList", companyuserList);
		
		returnUrl = "company/view";
		return returnUrl;
	}
	
	/*
	 * @RequestMapping(value = "/Company/View", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public List<CoworkVO>
	 * coworkList(@RequestParam("companycode")String companycode) throws Exception {
	 * 
	 * System.out.println("업무 List 컨트롤러" + companycode);
	 * 
	 * List<CoworkVO> coworkVO =
	 * companyservice.CoworkViewSelectCompany(companycode);
	 * 
	 * return coworkVO; }
	 */
	
	
	
	@RequestMapping(value = "/Company/Insertform")
	public String CoworkInsertform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
//		//coworkcode생성 및 기본 입력 데이터 호출
		String companycode = companyservice.SelectCompanyCode();
//		String newcoworkcode = coworkservice.SelectCompanyCode(nowdate.substring(1,8));
//		
//		//흠 어떻게 처리하냐? 이말이야
//		// 날짜 + 카운트?/ 
		
		System.out.println("companycode : " + companycode);
		
		String tmpstr = companycode.substring(1,8);
		String tmpcodeStr = "C";
		int tmpcode = Integer.parseInt(tmpstr,10);
		tmpcode = tmpcode + 1;
		
		if( tmpcodeStr.length() < 7) {
			for(int i = String.valueOf(tmpcode).length();i < 7; i++) {
				tmpcodeStr = tmpcodeStr + 0;
			}
			
		}
		
		// String tmpcodes = String.format("%07d", tmpcode);
		
		
		System.out.println("tmpcode : " + tmpcode);
		System.out.println("tmpcodeStr : " + tmpcodeStr);
		
		companycode = tmpcodeStr + tmpcode;
		CompanyVO companyVO = new CompanyVO();
		companyVO.setCompanycode(companycode);
		
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setCompanycode(companycode);
		
		List<UserVO> managerList = companyservice.SelectCompanyUser(companyDTO);
        
		List<UserVO> usersVO = (List<UserVO>)companyservice.SelectUser();
        
		// model.addAttribute("userVO", userVO);
			
		System.out.println("usersVO : " + usersVO);
		
		System.out.println("managerList : " + managerList);
		
		model.addAttribute("usersVO", usersVO);
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("managerList", managerList);
		
		returnUrl = "company/insert";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Company/Insert")
	public String CompanyInsert(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
	
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        CompanyDTO companyDTO = mapper.readValue(body, CompanyDTO.class);
        String jsonStr = mapper.writeValueAsString(companyDTO);
        
        companyservice.InsertCompany(companyDTO);
        
		returnUrl = "redirect:/Company/List";
		return returnUrl;
	}
	
	@ResponseBody
	@RequestMapping(value = "/Company/SelectManager", method = RequestMethod.POST)
	public List<UserVO> managerList(@ModelAttribute UserVO userVO) throws Exception {
		
		String companycode = companyservice.SelectCompanyCode();
		
		System.out.println("companycode : " + companycode);
		
		String tmpstr = companycode.substring(1,8);
		String tmpcodeStr = "C";
		int tmpcode = Integer.parseInt(tmpstr,10);
		tmpcode = tmpcode + 1;
		
		if( tmpcodeStr.length() < 7) {
			for(int i = String.valueOf(tmpcode).length();i < 7; i++) {
				tmpcodeStr = tmpcodeStr + 0;
			}
			
		}
		
		// String tmpcodes = String.format("%07d", tmpcode);
		
		
		System.out.println("tmpcode : " + tmpcode);
		System.out.println("tmpcodeStr : " + tmpcodeStr);
		
		companycode = tmpcodeStr + tmpcode;
		
		/*
		 * JSONObject managerList = new JSONObject();
		 * 
		 * managerList.put("userid", userid);
		 */
		
		System.out.println("담당자 List 컨트롤러" + companycode);
		
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setCompanycode(companycode);
		
		List<UserVO> managerList = companyservice.SelectCompanyUser(companyDTO);
		
		System.out.println("managerList : " + managerList);
		
		return managerList;
	}
	
	
	/*
	 * public void SelectManager(HttpServletResponse response, HttpServletRequest
	 * request, HttpSession session ,Model model) throws Exception { UserVO loginVO
	 * = (UserVO)session.getAttribute("login");
	 * 
	 * String companycode = companyservice.SelectCompanyCode();
	 * 
	 * System.out.println("companycode : " + companycode);
	 * 
	 * String tmpstr = companycode.substring(1,8); String tmpcodeStr = "C"; int
	 * tmpcode = Integer.parseInt(tmpstr,10); tmpcode = tmpcode + 1;
	 * 
	 * if( tmpcodeStr.length() < 7) { for(int i = String.valueOf(tmpcode).length();i
	 * < 7; i++) { tmpcodeStr = tmpcodeStr + 0; }
	 * 
	 * }
	 * 
	 * // String tmpcodes = String.format("%07d", tmpcode);
	 * 
	 * 
	 * System.out.println("tmpcode : " + tmpcode);
	 * System.out.println("tmpcodeStr : " + tmpcodeStr);
	 * 
	 * companycode = tmpcodeStr + tmpcode; CompanyVO companyVO = new CompanyVO();
	 * companyVO.setCompanycode(companycode);
	 * 
	 * CompanyDTO companyDTO = new CompanyDTO();
	 * companyDTO.setCompanycode(companycode);
	 * 
	 * List<UserVO> managerList = companyservice.SelectCompanyUser(companyDTO);
	 * 
	 * List<UserVO> usersVO = (List<UserVO>)companyservice.SelectUser();
	 * 
	 * // model.addAttribute("userVO", userVO);
	 * 
	 * System.out.println("usersVO : " + usersVO);
	 * 
	 * System.out.println("managerList : " + managerList);
	 * 
	 * model.addAttribute("usersVO", usersVO); model.addAttribute("companyVO",
	 * companyVO); model.addAttribute("managerList", managerList);
	 * 
	 * }
	 */
	
	@RequestMapping(value = "/Company/InsertManager")
	public void InsertManager(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		
		CoworkDTO coworkDTO = mapper.readValue(body, CoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(coworkDTO);
        System.out.println("JsonTest"+jsonStr);

        companyservice.InsertManager(coworkDTO);
        
	}
	
	@RequestMapping(value = "/Company/DeleteManager")
	public void DeleteManager(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		CoworkDTO coworkDTO = mapper.readValue(body, CoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(coworkDTO);
        System.out.println("JsonDeleteTest"+jsonStr);

        companyservice.DeleteManager(coworkDTO);
        
	}
	
	@RequestMapping(value = "/Company/Updateform")
	public String CompanyUpdateform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		String tmpcode = (String)request.getParameter("companycode");
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setCompanycode(tmpcode);
		
		CompanyVO companyVO = companyservice.SelectCompanyView(companyDTO);	
		model.addAttribute("companyVO", companyVO);
		
		List<UserVO> managerList = companyservice.SelectCompanyUser(companyDTO);
        
		List<UserVO> usersVO = (List<UserVO>)companyservice.SelectUser();
        
		model.addAttribute("usersVO", usersVO);
		
		System.out.println("managerList : " + managerList);
		
		model.addAttribute("managerList", managerList);
		
		returnUrl = "company/modify";
		return returnUrl;
	}
	@RequestMapping(value = "/Company/Update")
	public String CompanyUpdate(@RequestBody String body, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        CompanyDTO companyDTO = mapper.readValue(body, CompanyDTO.class);
        String jsonStr = mapper.writeValueAsString(companyDTO);
        
        companyservice.UpdateCompany(companyDTO);

		
		returnUrl = "redirect:/Company/List";
		return returnUrl;
	}
	
	@ResponseBody
	@RequestMapping(value = "/Company/SelectManagerUpdate", method = RequestMethod.GET)
	public List<UserVO> managerListUpdate(@ModelAttribute UserVO userVO, HttpServletRequest request) throws Exception {
		
		String companycode = (String)request.getParameter("companycode");
		
		System.out.println("companycode : " + companycode);
		
		/*
		 * JSONObject managerList = new JSONObject();
		 * 
		 * managerList.put("userid", userid);
		 */
		
		System.out.println("담당자 List 컨트롤러" + companycode);
		
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setCompanycode(companycode);
		
		List<UserVO> managerList = companyservice.SelectCompanyUser(companyDTO);
		
		System.out.println("managerList : " + managerList);
		
		return managerList;
	}
	
	@RequestMapping(value = "/Company/Delete")
	public String CoworkDelete(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		String tmpcode = (String)request.getParameter("companycode");
		
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setCompanycode(tmpcode);
		
		companyservice.DeleteCompany(companyDTO);
		
		returnUrl = "redirect:/Company/List";
		return returnUrl;
	}
	
}
