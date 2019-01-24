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
import kr.co.qsolutions.cowork.VO.UserVO;

@Controller
public class SearchController {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Inject
	private SearchService searchservice;
	
	String returnUrl;
	
	@RequestMapping(value = "/Search/List")
	public String CompanySearchList(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<CompanyVO> searchcompanylist = searchservice.SearchCompanyAll(pagingVO);
		List<UserVO> searchuserlist = searchservice.SearchUserAll(pagingVO);
		List<CoworkVO> searchcoworklist = searchservice.SearchCoworkAll(pagingVO);
		
		pagingVO.setTotal(searchservice.SearchCompanyCount(pagingVO));
		model.addAttribute("companypagingVO", pagingVO);
		
		pagingVO.setTotal(searchservice.SearchUserCount(pagingVO));
		model.addAttribute("userpagingVO", pagingVO);
		
		pagingVO.setTotal(searchservice.SearchCoworkCount(pagingVO));
		model.addAttribute("coworkpagingVO", pagingVO);
		
//		pagingVO.setTotal(coworkservice.CoworkViewListCount(pagingVO));
//		List<CoworkVO> listvo = coworkservice.CoworkViewListSelect(pagingVO);

		model.addAttribute("searchcompanylist",searchcompanylist);
		model.addAttribute("searchuserlist",searchuserlist);
		model.addAttribute("searchcoworklist",searchcoworklist);
		
		model.addAttribute("userid", loginVO.getUserid());
		
		return "search/viewlist";
	}
	
	
}
