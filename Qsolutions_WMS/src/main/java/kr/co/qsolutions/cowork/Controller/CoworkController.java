package kr.co.qsolutions.cowork.Controller;

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
import org.springframework.expression.spel.ast.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserVO;


@Controller
public class CoworkController {
	
	private static final Logger logger = LoggerFactory.getLogger(CoworkController.class);
	
	@Inject
	private CompanyService companyservice;
	
	@Inject
	private CoworkService coworkservice;
	
	String returnUrl;
	
	@RequestMapping(value = "/Cowork/List")
	public String CoworkList(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");

		pagingVO.setTotal(coworkservice.CoworkViewListCount(pagingVO));
		List<CoworkVO> listvo = coworkservice.CoworkViewListSelect(pagingVO);

		model.addAttribute("coworklistvo",listvo);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("userid", loginVO.getUserid());
		
		return "cowork/viewlist";
	}
	
	@RequestMapping(value = "/Cowork/Calendar")
	public String CoworkCalendar(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");

		List<CoworkVO> listvo = coworkservice.CoworkViewListCalendar(pagingVO);

		model.addAttribute("coworklistvo",listvo);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("userid", loginVO.getUserid());
		
		System.out.println("확인용 : " + listvo);
		
		return "cowork/calendar";
	}
	
	@RequestMapping(value = "/Cowork/Calendar", method = RequestMethod.POST)
	@ResponseBody
	public CoworkVO CoworkCalendarSelect(String coworktitle) throws Exception {
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setCoworktitle(coworktitle);
		CoworkVO coworkVO = coworkservice.CoworkCalendarSelect(coworkDTO);
		
		System.out.println("확인용 : " + coworkVO);
		return coworkVO;
		
	}
	
	@RequestMapping(value = "/Cowork/View")
	public String CoworkView(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		String tmpcode = (String)request.getParameter("coworkcode");
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setCoworkcode(tmpcode);
		CoworkVO coworkVO = coworkservice.CoworkViewSelect(coworkDTO);
		
		System.out.println(coworkVO);
		
		List<SubCoworkVO>subcoworkVO = coworkservice.SubCoworkListSelect(tmpcode);
		
		List<UserVO> userList = coworkservice.SelectCoworkUser(coworkDTO);
		
		System.out.println("userList : " + userList);
		
		System.out.println(subcoworkVO);
		
		model.addAttribute("userList", userList);
		model.addAttribute("CoworkVO", coworkVO);
		model.addAttribute("SubCoworkVO", subcoworkVO);
		
		returnUrl = "cowork/view";
		return returnUrl;
	}
	@RequestMapping(value = "/Cowork/Insertform")
	public String CoworkInsertform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		List<CompanyVO> companyList = coworkservice.CompanyAllSelect();
		String tmpcodeStr = "";
		String tmpstr = "";
		Date date = new Date();
        SimpleDateFormat dt = new SimpleDateFormat("yyyyMMdd");
    	String nowdate = dt.format(date.getTime());
		//coworkcode생성 및 기본 입력 데이터 호출
		String newcoworkcode = coworkservice.CoworkCodeSelect(nowdate);
		if(newcoworkcode == null || newcoworkcode == "") {
			tmpcodeStr = "CW" + nowdate + "00001";
		}else {
			tmpstr = newcoworkcode.substring(10,15);
			int tmpcode = Integer.parseInt(tmpstr,10);
			tmpcodeStr = newcoworkcode.substring(0, 10);
			tmpcode = tmpcode + 1;
			newcoworkcode = tmpcodeStr + tmpcode;
			if( newcoworkcode.length() < 15) {
				for(int i = newcoworkcode.length();i < 15; i++)
				tmpcodeStr = tmpcodeStr + 0;
			}
			tmpcodeStr = tmpcodeStr + tmpcode;
		}
		System.out.println("tmpcodeStr=="+tmpcodeStr);
		//coworkcode생성=========================================================
		CoworkVO coworkVO = new CoworkVO();
		coworkVO.setCoworkcode(tmpcodeStr);
		coworkVO.setUserid(loginVO.getUserid());
		coworkVO.setUsername(loginVO.getUsername());
		
		List<UserVO> usersVO = (List<UserVO>)companyservice.SelectUser();
		
		model.addAttribute("usersVO", usersVO);
		model.addAttribute("CoworkVO", coworkVO);
		model.addAttribute("companyList",companyList);
		
		returnUrl = "cowork/insert";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Cowork/Insert")
	public String CoworkInsert(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        CoworkDTO coworkDTO = mapper.readValue(body, CoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(coworkDTO);
        coworkservice.CoworkViewInsert(coworkDTO);
        		
		returnUrl = "redirect:/Cowork/List";
		return returnUrl;
	}
	
	@ResponseBody
	@RequestMapping(value = "/Cowork/SelectManager", method = RequestMethod.POST)
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
		
		String coworkcode = coworkservice.SelectCoworkCode();
		
		System.out.println("coworkcode : " + coworkcode);
		
		String tmpcoworknum = coworkcode.substring(2,15);
		System.out.println("tmpcoworknum : " + tmpcoworknum);
		String tmpcoworkStr = "CW";
		System.out.println("tmpcoworkStr : " + tmpcoworkStr);
		Long tmpcowork = Long.parseLong(tmpcoworknum);
		System.out.println("tmpcowork : " + tmpcowork);
		tmpcowork = tmpcowork + 1;
		
		
		
		System.out.println("tmpcowork : " + tmpcowork);
		System.out.println("tmpcoworkStr : " + tmpcoworkStr);
		
		coworkcode = tmpcoworkStr + tmpcowork;
		
		// String tmpcodes = String.format("%07d", tmpcode);
		
		
		System.out.println("tmpcode : " + tmpcode);
		System.out.println("tmpcodeStr : " + tmpcodeStr);
		
		companycode = tmpcodeStr + tmpcode;
		
		/*
		 * JSONObject managerList = new JSONObject();
		 * 
		 * managerList.put("userid", userid);
		 */
		
		System.out.println("담당자 List 컨트롤러" + coworkcode);
		
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setCoworkcode(coworkcode);
		
		List<UserVO> managerList = coworkservice.SelectCoworkUser(coworkDTO);
		
		System.out.println("managerList : " + managerList);
		
		return managerList;
	}
	
	@RequestMapping(value = "/Cowork/InsertManager")
	public void InsertManager(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		
		CoworkDTO coworkDTO = mapper.readValue(body, CoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(coworkDTO);
        System.out.println("JsonTest"+jsonStr);

        coworkservice.InsertCoworkManager(coworkDTO);
        
	}
	
	@RequestMapping(value = "/Cowork/DeleteManager")
	public void DeleteManager(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		CoworkDTO coworkDTO = mapper.readValue(body, CoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(coworkDTO);
        System.out.println("JsonDeleteTest"+jsonStr);

        coworkservice.DeleteCoworkManager(coworkDTO);
        
	}
	
	@ResponseBody
	@RequestMapping(value = "/Cowork/SelectManagerUpdate", method = RequestMethod.GET)
	public List<UserVO> managerListUpdate(@ModelAttribute UserVO userVO, HttpServletRequest request) throws Exception {
		
		String companycode = (String)request.getParameter("companycode");
		
		System.out.println("companycode : " + companycode);
		
		String coworkcode = (String)request.getParameter("coworkcode");
		
		System.out.println("coworkcode : " + coworkcode);
		
		
		
		/*
		 * JSONObject managerList = new JSONObject();
		 * 
		 * managerList.put("userid", userid);
		 */
		
		System.out.println("담당자 List 컨트롤러" + coworkcode);
		
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setCoworkcode(coworkcode);
		
		List<UserVO> managerList = coworkservice.SelectCoworkUser(coworkDTO);
		
		System.out.println("managerList : " + managerList);
		
		return managerList;
	}

	@RequestMapping(value = "/Cowork/Updateform")
	public String CoworkUpdateform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		List<CompanyVO> companyList = coworkservice.CompanyAllSelect();

		String tmpcode = (String)request.getParameter("coworkcode");
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setCoworkcode(tmpcode);
		CoworkVO coworkVO = coworkservice.CoworkViewSelect(coworkDTO);	
		
		List<UserVO> usersVO = (List<UserVO>)companyservice.SelectUser();
		
		model.addAttribute("usersVO", usersVO);
		model.addAttribute("CoworkVO", coworkVO);
		model.addAttribute("companyList",companyList);
		
		returnUrl = "cowork/modify";
		return returnUrl;
	}
	@RequestMapping(value = "/Cowork/Update")
	public String CoworkUpdate(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        CoworkDTO coworkDTO = mapper.readValue(body, CoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(coworkDTO);
        coworkservice.CoworkViewUpdate(coworkDTO);
		
		returnUrl = "redirect:/Cowork/List";
		return returnUrl;
	}
	@RequestMapping(value = "/Cowork/Delete")
	public String CoworkDelete(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		String coworkcode = request.getParameter("coworkcode");
		System.out.println("coworkcode??=="+coworkcode);
        coworkservice.CoworkViewDelete(coworkcode);
        
		returnUrl = "redirect:/cowork/List";
		return returnUrl;
	}


	@RequestMapping(value = "/Cowork/SubCoworkInsert")
	public String SubCoworkInsert(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		
		SubCoworkDTO subcoworkDTO = mapper.readValue(body, SubCoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(subcoworkDTO);
        System.out.println("JsonTest"+jsonStr);
        subcoworkDTO.setUserid(loginVO.getUserid());

        coworkservice.SubCoworkListInsert(subcoworkDTO);
        		
		returnUrl = "redirect:/Cowork/List";
		return returnUrl;
	}

	@RequestMapping(value = "/Cowork/SubCoworkDelete")
	public String SubCoworkDelete(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		SubCoworkDTO subcoworkDTO = mapper.readValue(body, SubCoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(subcoworkDTO);

        coworkservice.SubCoworkListDelete(subcoworkDTO);
        		
		returnUrl = "redirect:/Cowork/List";
		return returnUrl;
	}
}
