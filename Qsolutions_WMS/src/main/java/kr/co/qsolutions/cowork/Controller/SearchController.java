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

import kr.co.qsolutions.cowork.Service.SearchService;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SearchVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private SearchService searchservice;
	
	String returnUrl;
	
	int searchcompanycount = 0;
	
	int searchusercount = 0;
	
	int searchcoworkcount = 0;
	
	@RequestMapping(value = "/Search/List")
	public String CompanySearchList(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<CompanyVO> searchcompanylist = searchservice.SearchCompanyAll(pagingVO);
		List<UserVO> searchuserlist = searchservice.SearchUserAll(pagingVO);
		List<CoworkVO> searchcoworklist = searchservice.SearchCoworkAll(pagingVO);
		
		List<SearchVO> SearchCompanyCountvo = searchservice.SearchCompanyCountvo(pagingVO);
		System.out.println("SearchCompanyCountvo : " + SearchCompanyCountvo);
		model.addAttribute("SearchCompanyCountvo",SearchCompanyCountvo);
		List<SearchVO> SearchUserCountvo = searchservice.SearchUserCountvo(pagingVO);
		model.addAttribute("SearchUserCountvo",SearchUserCountvo);
		List<SearchVO> SearchCoworkCountvo = searchservice.SearchCoworkCountvo(pagingVO);
		model.addAttribute("SearchCoworkCountvo",SearchCoworkCountvo);
		
		searchcompanycount = searchservice.SearchCompanyCount();
		searchusercount = searchservice.SearchUserCount();
		searchcoworkcount = searchservice.SearchCoworkCount();
		
		pagingVO.setTotal(searchservice.SearchCompanyCount(pagingVO));
		model.addAttribute("companypagingVO", pagingVO);
		
		System.out.println("searchcompanylist : " + searchcompanylist);
		System.out.println("companypagingVO : " + pagingVO);
		System.out.println("searchcompanycount : " + searchcompanycount);
		
		pagingVO.setTotal(searchservice.SearchUserCount(pagingVO));
		model.addAttribute("userpagingVO", pagingVO);
		
		System.out.println("searchuserlist : " + searchuserlist);
		System.out.println("userpagingVO : " + pagingVO);
		System.out.println("searchusercount : " + searchusercount);
		
		pagingVO.setTotal(searchservice.SearchCoworkCount(pagingVO));
		model.addAttribute("coworkpagingVO", pagingVO);
		
		System.out.println("searchcoworklist : " + searchcoworklist);
		System.out.println("coworkpagingVO : " + pagingVO);
		System.out.println("searchcoworkcount : " + searchcoworkcount);
		
//		pagingVO.setTotal(coworkservice.CoworkViewListCount(pagingVO));
//		List<CoworkVO> listvo = coworkservice.CoworkViewListSelect(pagingVO);

		model.addAttribute("searchcompanycount",searchcompanycount);
		model.addAttribute("searchusercount",searchusercount);
		model.addAttribute("searchcoworkcount",searchcoworkcount);
		
		model.addAttribute("searchcompanylist",searchcompanylist);
		model.addAttribute("searchuserlist",searchuserlist);
		model.addAttribute("searchcoworklist",searchcoworklist);
		
		model.addAttribute("userid", loginVO.getUserid());
		
		return "search/viewlist";
	}
	
	
}
