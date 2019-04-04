package kr.co.qsolutions.cowork.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.SubCoworkDTO;
import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.Service.CoworkService;
import kr.co.qsolutions.cowork.Service.UserService;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.FileVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Controller
public class DashboardController {
	
	private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	@Inject
	private CompanyService companyservice;
	
	@Inject
	private CoworkService coworkservice;
	
	@Inject
	private UserService userservice;
	
	String returnUrl;
	
	int todaycowork = 0;
	
	@RequestMapping(value = "/")
	public String CoworkList(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		String userid = loginVO.getUserid();
		
		System.out.println("userid : " + userid);

		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setUserid(userid);
		
		UserVO userVO = userservice.UserViewSelect(userid);
		
		model.addAttribute("userVO", userVO);
		
		pagingVO.setTotal(coworkservice.CoworkViewListCount(pagingVO));
		List<CoworkVO> listvo = coworkservice.CoworkViewListSelect(pagingVO);
		
		List<CoworkVO> coworkMyListVO = coworkservice.CoworkMyList(coworkDTO);

		List<SubCoworkVO> subcoworkListVO = coworkservice.SubCoworkDashboardList();
		
		List<CoworkVO> coworkListVO = coworkservice.CoworkDashboardList();
		
		todaycowork = coworkservice.CountTodayCowork(coworkDTO);
		
		FileVO profileVO = userservice.SelectProfile(userid);
		
		System.out.println("subcoworkListVO : " + subcoworkListVO);
		
		System.out.println("coworkMyListVO : " + coworkMyListVO);
		
		System.out.println("coworkListVO : " + coworkListVO);
		
		System.out.println("todaycowork : " + todaycowork);
		
		System.out.println("profileVO : " + profileVO);
		
		model.addAttribute("coworkMyListVO",coworkMyListVO);
		model.addAttribute("coworklistvo",listvo);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("userVO", userVO);
		model.addAttribute("userid", loginVO.getUserid());
		model.addAttribute("subcoworkListVO",subcoworkListVO);
		model.addAttribute("coworkListVO",coworkListVO);
		model.addAttribute("todaycowork",todaycowork);
		model.addAttribute("profileVO",profileVO);
		
		return "Login/dashboard";
	}
	
}
