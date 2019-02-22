package kr.co.qsolutions.cowork.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.Service.CoworkService;
import kr.co.qsolutions.cowork.Util.EmailSender;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.EmailForm;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Controller
public class EmailController {
        
	@Inject
	private CompanyService companyservice;
	
	@Inject
	private CoworkService coworkservice;
	
    @Autowired
    private EmailSender emailSender;
        
        /*
        @RequestMapping(value="/Cowork/send",method=RequestMethod.GET)
        public String formback() {
            return "cowork/mailform";
        }
        */
        
    @RequestMapping(value="/toMail/Send",method=RequestMethod.POST)
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
    	
        return "redirect:/Cowork/List";
    }
    
    @RequestMapping(value="/toMail/coworkViewToMail",method=RequestMethod.POST)
    public String CoworkViewToMail(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
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
    	
    	String userId = (String)request.getParameter("receiver");
    	
    	System.out.println("receiver : " + userId);
    	
		String filePath = "/toMail/coworkViewToMail.jsp";
    	
    	emailSender.sendMail(userId, filePath, session);
    	
        return "redirect:/Cowork/List";
    }
    
}