package kr.co.qsolutions.cowork.Controller;

import java.io.File;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.FileDTO;
import kr.co.qsolutions.cowork.DTO.SubCoworkDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.Service.CoworkService;
import kr.co.qsolutions.cowork.Service.ManagerService;
import kr.co.qsolutions.cowork.Service.UserService;
import kr.co.qsolutions.cowork.Util.AccountControl;
import kr.co.qsolutions.cowork.Util.FileUploadService;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkPagingVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.FileVO;
import kr.co.qsolutions.cowork.VO.ManagerVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.PagingViewVO;
import kr.co.qsolutions.cowork.VO.UserPagingVO;
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
	
	@Inject
	private UserService userservice;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Inject
	private ManagerService managerservice;
	
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
	
	@RequestMapping(value = "/Company/Upload")
	public String upload(HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model, @RequestParam("file") MultipartFile file) throws Exception {

		String companycode = (String)request.getParameter("companycode");
		
		
		String path = "C://upload//" + companycode;
		
		System.out.println("companycode : " + companycode);
		
		File files = new File(path);
		
		if(!files.exists()){
			//디렉토리 생성 메서드
			files.mkdirs();
			System.out.println("created directory successfully!");
		}
		
		String url = fileUploadService.restore(companycode, file);
		
		FileDTO fileDTO = new FileDTO();
		fileDTO.setCompanycode(companycode);
        
        System.out.println("fileDTO : " + fileDTO);
        
        companyservice.InsertFileUpload(fileDTO);
		
		model.addAttribute("url", url);
		
	    return "company/viewlist";
	}
	
	/*
	@RequestMapping(value = "/fileUpload") // method = RequestMethod.GET 
	public Map fileUpload(HttpServletRequest req, HttpServletResponse rep) { 
		//파일이 저장될 path 설정 
		String path = "c://aaa"; 
		Map returnObject = new HashMap(); 
		try { 
			// MultipartHttpServletRequest 생성 
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
			Iterator iter = mhsr.getFileNames(); 
			
			MultipartFile mfile = null; 
			String fieldName = ""; 
			List resultList = new ArrayList(); 
			
			// 디레토리가 없다면 생성 
			File dir = new File(path); 
			if (!dir.isDirectory()) { 
				dir.mkdirs(); 
			} 
			
			// 값이 나올때까지 
			while (iter.hasNext()) { 
				fieldName = iter.next(); // 내용을 가져와서 
				mfile = mhsr.getFile(fieldName); 
				String origName; 
				
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 
				
				// 파일명이 없다면 
				if ("".equals(origName)) { 
					continue; 
				} 
				
				// 파일 명 변경(uuid로 암호화) 
				String ext = origName.substring(origName.lastIndexOf('.')); // 확장자 
				String saveFileName = getUuid() + ext; 
				
				// 설정한 path에 파일저장 
				File serverFile = new File(path + File.separator + saveFileName); 
				mfile.transferTo(serverFile); 
				
				Map file = new HashMap(); 
				file.put("origName", origName); 
				file.put("sfile", serverFile); 
				resultList.add(file); 
		} 
			
		returnObject.put("files", resultList); 
		returnObject.put("params", mhsr.getParameterMap()); 
		
		} catch (UnsupportedEncodingException e) { 
			// TODO Auto-generated catch block e.printStackTrace(); 
		}catch (IllegalStateException e) { 
			// TODO Auto-generated catch block e.printStackTrace(); 
		} catch (IOException e) { 
			// TODO Auto-generated catch block e.printStackTrace(); 
		} return null; 
	} 
	
	//uuid생성 
	public static String getUuid() { 
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}
	*/
	
	@RequestMapping(value = "/Company/View")
	public String CoworkView(HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model, UserPagingVO userPagingVO, CoworkPagingVO coworkpagingVO) throws Exception {
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		String tmpcode = (String)request.getParameter("companycode");
		String tmpname = (String)request.getParameter("companyname");
		
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setCompanycode(tmpcode);
		companyDTO.setCompanyname(tmpname);
		
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setCoworkcompany(tmpcode);
		
		userPagingVO.setCompanycode(tmpcode);
		coworkpagingVO.setCompanycode(tmpcode);
		
		// 전체 직원 수
		// List<UserVO> companyuserslist = companyservice.SelectUserCompanyList(userPagingVO);
		// userPagingVO.setTotal(companyservice.SelectUserCompanyCount(companyDTO));
		
		// int userCnt = companyservice.SelectUserCompanyCount(companyDTO);
		
		// System.out.println("userCnt : " + userCnt);
		
		// 전체 업무 수 
		// List<CoworkVO> coworksList = companyservice.CoworkViewSelectCompanyList(coworkpagingVO);
		// coworkpagingVO.setTotal(companyservice.CoworkViewSelectCompanyCount(companyDTO));
		// int coworkCnt = companyservice.CoworkViewSelectCompanyCount(companyDTO);
		
		// System.out.println("coworkCnt : " + coworkCnt);
		
		// 전체 파일 수 
		int fileCnt = companyservice.SelectFileUploadCount(companyDTO);
		
		System.out.println("fileCnt : " + fileCnt);
		
		// PagingViewVO pagingViewVO = new PagingViewVO(userCnt, curPage);
		
		// companyDTO.setStartIndex(pagingViewVO.getStartIndex());
		// companyDTO.setCntPerPage(pagingViewVO.getPageSize());
		
		List<UserVO> userList = companyservice.SelectUserCompany(companyDTO);
		
		List<UserVO> companyuserList = companyservice.SelectCompanyUser(companyDTO);
		
		List<CoworkVO> coworkList = companyservice.CoworkViewSelectCompany(tmpcode);
		
		List<FileVO> fileList = companyservice.SelectFileUpload(companyDTO);
		
		System.out.println("업무 List 컨트롤러 : " + tmpcode);
		
		System.out.println("coworkList : " + coworkList);
		
		System.out.println("companyDTO : " + companyDTO);
		
		System.out.println("companyuserList : " + companyuserList);
		
		System.out.println("userList : " + userList);
		
		System.out.println("loginVO : " + loginVO);
		
		System.out.println("fileList : " + fileList);
		
		System.out.println("userPagingVO : " + userPagingVO);
		
		System.out.println("coworkpagingVO : " + coworkpagingVO);
		
		CompanyVO companyVO = companyservice.SelectCompanyView(companyDTO);
		//담당자 추가
		
		model.addAttribute("loginVO", loginVO);
		model.addAttribute("userList", userList);
		model.addAttribute("coworkList", coworkList);
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("companyuserList", companyuserList);
		model.addAttribute("fileList", fileList);
		// model.addAttribute("companyuserslist",companyuserslist);
		model.addAttribute("userPagingVO", userPagingVO);
		// model.addAttribute("coworksList", coworksList);
		model.addAttribute("coworkpagingVO", coworkpagingVO);
		
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

		CompanyDTO companyDTO = new CompanyDTO();
		List<UserVO> managerList = companyservice.SelectCompanyUser(companyDTO);
        
		List<UserVO> usersVO = (List<UserVO>)companyservice.SelectUser();
        
		// model.addAttribute("userVO", userVO);
			
		System.out.println("usersVO : " + usersVO);
		
		System.out.println("managerList : " + managerList);
		
		model.addAttribute("usersVO", usersVO);
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
		
		companyDTO.setCompanycode(companycode);
        
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
		
		System.out.println("tmpcode : " + tmpcode);
		
		companyservice.DeleteCompany(companyDTO);
		companyservice.DeleteCompanyCowork(companyDTO);
		
		returnUrl = "redirect:/Company/List";
		return returnUrl;
	}
	
	@ResponseBody
	@RequestMapping(value = "/Company/PagingUser", method = RequestMethod.GET)
	public List<UserVO> PagingUser(@RequestParam(value="companycode")String companycode, Model model) throws Exception {

		System.out.println("companycode : " + companycode);
		
        // 전체 직원 수
		List<UserVO> companyuserslist = companyservice.SelectUserCompanyList(companycode);
     	
     	System.out.println("companyuserslist : " + companyuserslist);
     	
		return companyuserslist;
	}
	
	@ResponseBody
	@RequestMapping(value = "/Company/PagingCowork", method = RequestMethod.GET)
	public List<CoworkVO> PagingCowork(@RequestParam(value="companycode")String companycode, Model model) throws Exception {

		System.out.println("companycode : " + companycode);
		
        // 전체 직원 수
		List<CoworkVO> companycoworkslist = companyservice.CoworkViewSelectCompanyList(companycode);
     	
     	System.out.println("companycoworkslist : " + companycoworkslist);
     	
		return companycoworkslist;
	}
	
//	@RequestMapping(value = "/Company/InsertUserForm")
//	public String UserInsertform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
//		UserVO loginVO = (UserVO)session.getAttribute("login");
//		
//		UserVO userVO = new UserVO();
//		
//		List<CompanyVO> companyVO = (List<CompanyVO>) coworkservice.CompanyAllSelect();
//		
//		List<UserVO> deptVO = (List<UserVO>)userservice.SelectDeptList();
//		List<UserVO> positionVO = (List<UserVO>)userservice.SelectPositionList();
//		
//		model.addAttribute("deptVO", deptVO);
//		model.addAttribute("positionVO", positionVO);
//		model.addAttribute("companyVO", companyVO);
//		model.addAttribute("userVO", userVO);
//		
//		System.out.println("deptVO : " + deptVO);
//		
//		returnUrl = "company/insertCompanyUser";
//		return returnUrl;
//	}
//	
	@RequestMapping(value = "/Company/InsertUser")
	public String UserInsert(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		String companycode = (String)request.getParameter("companycode");
		
		System.out.println("companycode : " + companycode);
		
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
	
	@RequestMapping(value = "/Company/InsertUserForm")
	public String UserInsertform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		String tmpID = request.getParameter("userid");
		String tmpcode = (String)request.getParameter("companycode");
		
		List<CompanyVO> companyVO = (List<CompanyVO>) coworkservice.CompanyAllSelect();
		
		UserVO userVO = (UserVO)userservice.UserViewSelect(tmpID);
		List<UserVO> deptVO = (List<UserVO>)userservice.SelectDeptList();
		List<UserVO> positionVO = (List<UserVO>)userservice.SelectPositionList();
		
		model.addAttribute("deptVO", deptVO);
		model.addAttribute("positionVO", positionVO);
		model.addAttribute("userVO", userVO);
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("tmpcode", tmpcode);
		
		returnUrl = "user/insertCompanyUser";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Company/InsertCoworkForm")
	public String CompanyInsertCoworkform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		List<CompanyVO> companyList = coworkservice.CompanyAllSelect();
		String tmpcode = (String)request.getParameter("companycode");
		
		CoworkVO coworkVO = new CoworkVO();
		
		coworkVO.setUserid(loginVO.getUserid());
		coworkVO.setUsername(loginVO.getUsername());
		
		List<ManagerVO> managerVO = (List<ManagerVO>)managerservice.SelectManager();
		
		List<UserVO> usersVO = (List<UserVO>)companyservice.SelectUser();
		
		System.out.println("loginVO : " + loginVO);
		System.out.println("managerVO : " + managerVO);
		System.out.println("usersVO : " + usersVO);
		
		model.addAttribute("managerVO", managerVO);
		model.addAttribute("usersVO", usersVO);
		model.addAttribute("CoworkVO", coworkVO);
		model.addAttribute("companyList",companyList);
		model.addAttribute("tmpcode", tmpcode);
		
		returnUrl = "cowork/insertCompanyCowork";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Company/InsertSelectManager")
	public void InsertSelectManager(@RequestParam(value="selectsManager[]") List<String> arrayParams, @RequestParam(value="comcode") String companycode, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		/*
		UserVO loginVO = (UserVO)session.getAttribute("login");
		ObjectMapper mapper = new ObjectMapper();
		
		System.out.println("mapper : "+mapper);
		*/
		
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

		String coworkcode = tmpcodeStr;
		
		System.out.println("arrayParams-------------->" + arrayParams); 

		System.out.println("companycode-------------->" + companycode); 
		
		System.out.println("coworkcode-------------->" + coworkcode); 
		
		CoworkDTO coworkDTO = new CoworkDTO();
		
		coworkDTO.setCoworkcode(coworkcode);
		coworkDTO.setCompanycode(companycode);
		
		for (int i = 0; i < arrayParams.size(); i++) {
			String userid = arrayParams.get(i);
			System.out.println("manager-------------->" + userid); 
			
			coworkDTO.setUserid(userid);
			coworkservice.InsertCoworkManager(coworkDTO);
			
		}
		
		/*
		for(UserVO str : body.getManagerList()) {

			System.out.println("name-------------->"+str.getUserid()); 

			// System.out.println("userId-------------->"+str.get()); 

		}

		 */
		/*
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		
		CoworkDTO coworkDTO = mapper.readValue(body, CoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(coworkDTO);
        System.out.println("JsonTest : "+jsonStr);

        coworkservice.InsertCoworkManager(coworkDTO);
		*/
		
	}
	
	@RequestMapping(value = "/Company/InsertCompanyCowork")
	public String CoworkInsert(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        CoworkDTO coworkDTO = mapper.readValue(body, CoworkDTO.class);
        String jsonStr = mapper.writeValueAsString(coworkDTO);
        
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
		
		coworkDTO.setCoworkcode(tmpcodeStr);
        
        coworkservice.CoworkViewInsert(coworkDTO);
        		
		returnUrl = "redirect:/Cowork/List";
		return returnUrl;
	}
	
}
