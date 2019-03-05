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
import kr.co.qsolutions.cowork.Service.UserService;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserVO;



/**
 * Handles requests for the application home page.
 */
@Controller
public class ExcelController {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Inject
	private CompanyService companyservice;
	
	@Inject
	private UserService userservice;
	
	@Inject
	private CoworkService coworkservice;
	
	String returnUrl;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/toExcel/companyListToExcel")
	public String CoworkList(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<CompanyVO> companylist = companyservice.SelectCompanyListToExcel(pagingVO);
		pagingVO.setTotal(companyservice.SelectCompanyCount(pagingVO));
		
		List<UserVO> userVO = userservice.SelectUserList(pagingVO);
		
//		pagingVO.setTotal(coworkservice.CoworkViewListCount(pagingVO));
//		List<CoworkVO> listvo = coworkservice.CoworkViewListSelect(pagingVO);

		model.addAttribute("companylistvo",companylist);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("userid", loginVO.getUserid());
		model.addAttribute("userVO", userVO);
		
		return "toExcel/companyListToExcel";
	}
	
	@RequestMapping(value = "/toExcel/companyViewToExcel")
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
		
		returnUrl = "toExcel/companyViewToExcel";
		return returnUrl;
	}
	
}
