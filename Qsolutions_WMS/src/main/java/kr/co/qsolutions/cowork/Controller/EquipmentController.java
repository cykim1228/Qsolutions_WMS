package kr.co.qsolutions.cowork.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.ContractDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.EquipmentDTO;
import kr.co.qsolutions.cowork.DTO.FileDTO;
import kr.co.qsolutions.cowork.DTO.ModelDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.Service.CoworkService;
import kr.co.qsolutions.cowork.Service.EquipmentService;
import kr.co.qsolutions.cowork.Service.ManagerService;
import kr.co.qsolutions.cowork.Service.UserService;
import kr.co.qsolutions.cowork.Util.AccountControl;
import kr.co.qsolutions.cowork.Util.FileUploadService;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.ContractVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.EquipmentVO;
import kr.co.qsolutions.cowork.VO.ModelVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Controller
public class EquipmentController {
	
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
	
	@Inject
	private EquipmentService equipmentservice;
	
	String returnUrl;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/Equipment/List")
	public String EquipmentList(PagingVO pagingVO, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<EquipmentVO> equipmentlist = equipmentservice.SelectEquipmentList(pagingVO);
		pagingVO.setTotal(equipmentservice.SelectEquipmentCount(pagingVO));
		
//		pagingVO.setTotal(coworkservice.CoworkViewListCount(pagingVO));
//		List<CoworkVO> listvo = coworkservice.CoworkViewListSelect(pagingVO);

		model.addAttribute("equipmentlistvo",equipmentlist);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("userid", loginVO.getUserid());
		
		return "equipment/viewlist";
	}
	
	@RequestMapping(value = "/Equipment/View")
	public String EquipmentView(HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		String tmpcode = (String)request.getParameter("contractcompany");
		String equipmentcode = (String)request.getParameter("equipmentcode");
		
		System.out.println("equipmentcode = " + equipmentcode);
		
		CompanyDTO companyDTO = new CompanyDTO();
		companyDTO.setCompanycode(tmpcode);
		
		CoworkDTO coworkDTO = new CoworkDTO();
		coworkDTO.setCoworkcompany(tmpcode);
		
		EquipmentDTO equipmentDTO = new EquipmentDTO();
		equipmentDTO.setEquipmentcode(equipmentcode);
		
		System.out.println("equipmentDTO = " + equipmentDTO);
		
		EquipmentVO equipmentVO = equipmentservice.ViewEquipment(equipmentDTO);
		
		List<UserVO> modelList = equipmentservice.SelectModelList(equipmentDTO);
		
		System.out.println("equipmentVO = " + equipmentVO);
		
		model.addAttribute("equipmentVO", equipmentVO);
		
		model.addAttribute("modelList", modelList);
		
		returnUrl = "equipment/view";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/Insert")
	public String EquipmentInsert(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
	
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		EquipmentDTO equipmentDTO = mapper.readValue(body, EquipmentDTO.class);
        String jsonStr = mapper.writeValueAsString(equipmentDTO);
        
//		//coworkcode생성 및 기본 입력 데이터 호출
		String equipmentcode = equipmentservice.SelectEquipmentCode();
//		String newcoworkcode = coworkservice.SelectCompanyCode(nowdate.substring(1,8));
		
		System.out.println("equipmentcode : " + equipmentcode);
		
		String tmpstr = equipmentcode.substring(1,8);
		String tmpcodeStr = "E";
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
		
		equipmentcode = tmpcodeStr + tmpcode;
		EquipmentVO equipmentVO = new EquipmentVO();
		equipmentVO.setEquipmentcode(equipmentcode);
		
		equipmentDTO.setEquipmentcode(equipmentcode);
        
        equipmentservice.InsertEquipment(equipmentDTO);
        
		returnUrl = "redirect:/Equipment/List";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/Insertform")
	public String EquipmentInsertform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");

		EquipmentDTO equipmentDTO = new EquipmentDTO();
		
		returnUrl = "equipment/insert";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/Updateform")
	public String EquipmentUpdateform(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		String tmpcode = (String)request.getParameter("equipmentcode");
		EquipmentDTO equipmentDTO = new EquipmentDTO();
		equipmentDTO.setEquipmentcode(tmpcode);
		
		EquipmentVO equipmentVO = equipmentservice.ViewEquipment(equipmentDTO);
		model.addAttribute("equipmentVO", equipmentVO);
		
		returnUrl = "equipment/modify";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/Update")
	public String EquipmentUpdate(@RequestBody String body, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		EquipmentDTO equipmentDTO = mapper.readValue(body, EquipmentDTO.class);
        String jsonStr = mapper.writeValueAsString(equipmentDTO);
        
        System.out.println("equipmentDTO : " + equipmentDTO);
        System.out.println("jsonStr : " + jsonStr);
        
        equipmentservice.UpdateEquipment(equipmentDTO);

		returnUrl = "redirect:/Equipment/List";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/Delete")
	public String EquipmentDelete(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		String tmpcode = (String)request.getParameter("equipmentcode");
		
		EquipmentDTO equipmentDTO = new EquipmentDTO();
		equipmentDTO.setEquipmentcode(tmpcode);
		
		System.out.println("tmpcode : " + tmpcode);
		
        equipmentservice.DeleteEquipment(equipmentDTO);
        equipmentservice.DeleteEquipmentModel(equipmentDTO);
		
		returnUrl = "redirect:/Equipment/List";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/InsertModelForm")
	public String InsertModelForm(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		List<EquipmentVO> equipmentList = equipmentservice.EquipmentAllSelect();
		String equipmentcode = (String)request.getParameter("equipmentcode");

		List<ContractVO> contractList = companyservice.ContractAllSelect();
		
		model.addAttribute("equipmentList",equipmentList);
		model.addAttribute("contractList",contractList);
		model.addAttribute("equipmentcode", equipmentcode);
		
		returnUrl = "model/insert";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/InsertModel")
	public String InsertModel(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
	
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		ModelDTO modelDTO = mapper.readValue(body, ModelDTO.class);
        String jsonStr = mapper.writeValueAsString(modelDTO);
        
        String equipmentcode = modelDTO.getEquipmentcode();
        
		/*
		 * String modelcode = equipmentservice.SelectModelCode(); // String
		 * newcoworkcode = coworkservice.SelectCompanyCode(nowdate.substring(1,8));
		 * 
		 * if (modelcode == null) { modelcode = "M00000"; }
		 * 
		 * System.out.println("modelcode : " + modelcode);
		 * 
		 * String tmpstr = modelcode.substring(1,4); String tmpcodeStr = "E"; int
		 * tmpcode = Integer.parseInt(tmpstr,8); tmpcode = tmpcode + 1;
		 * 
		 * if( tmpcodeStr.length() < 5) { for(int i = String.valueOf(tmpcode).length();i
		 * < 5; i++) { tmpcodeStr = tmpcodeStr + 0; }
		 * 
		 * }
		 * 
		 * // String tmpcodes = String.format("%07d", tmpcode);
		 * 
		 * 
		 * System.out.println("tmpcode : " + tmpcode);
		 * System.out.println("tmpcodeStr : " + tmpcodeStr);
		 * 
		 * modelcode = tmpcodeStr + tmpcode; ModelVO modelVO = new ModelVO();
		 * modelVO.setModelcode(modelcode);
		 * 
		 * modelDTO.setModelcode(modelcode);
		 */
        
        equipmentservice.InsertModel(modelDTO);
        
		returnUrl = "redirect:/Equipment/View?equipmentcode"+equipmentcode;
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/ViewSelectModel")
	public String ViewSelectModel(HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		String modelcode = (String)request.getParameter("modelcode");
		
		System.out.println("modelcode = " + modelcode);
		
		ModelDTO modelDTO = new ModelDTO();
		modelDTO.setModelcode(modelcode);
		
		ModelVO modelVO = equipmentservice.ViewSelectModel(modelDTO);
		
		returnUrl = "equipment/view";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/ViewSelectModel", method = RequestMethod.POST)
	@ResponseBody
	public ModelVO ViewSelectModel(String modelcode) throws Exception {
		ModelDTO modelDTO = new ModelDTO();
		modelDTO.setModelcode(modelcode);
		ModelVO modelVO = equipmentservice.ViewSelectModel(modelDTO);
		
		System.out.println("확인용 : " + modelVO);
		return modelVO;
		
	}
	
	@RequestMapping(value = "/Company/DeleteContractModel")
    public String DeleteContractModel(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		ModelDTO modelDTO = mapper.readValue(body, ModelDTO.class);
        String jsonStr = mapper.writeValueAsString(modelDTO);
        
        equipmentservice.DeleteContractModel(modelDTO);
        
        String equipmentcode = modelDTO.getEquipmentcode();
        String modelcode = modelDTO.getModelcode();
		
		returnUrl = "redirect:/Company/Contract?contractcompany=" + equipmentcode + "&contractcode=" + modelcode;
		return returnUrl;
    }
	
	@RequestMapping(value = "/Equipment/DeleteModel")
    public String DeleteModel(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		ModelDTO modelDTO = mapper.readValue(body, ModelDTO.class);
        String jsonStr = mapper.writeValueAsString(modelDTO);
        
        equipmentservice.DeleteModel(modelDTO);
        
        String equipmentcode = modelDTO.getEquipmentcode();
		
		returnUrl = "redirect:/Equipment/View?equipmentcode=" + equipmentcode;
		return returnUrl;
    }
	
	@RequestMapping(value = "/Equipment/UpdateModelForm")
	public String UpdateModelForm(HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		String tmpcode = (String)request.getParameter("modelcode");
		ModelDTO modelDTO = new ModelDTO();
		modelDTO.setModelcode(tmpcode);
		
		List<ContractVO> contractList = companyservice.ContractAllSelect();
		
		model.addAttribute("contractList",contractList);
		
		ModelVO modelVO = equipmentservice.ViewSelectModel(modelDTO);
		model.addAttribute("modelVO", modelVO);
		
		System.out.println("modelVO" + modelVO);
		
		returnUrl = "model/modify";
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/UpdateModel")
	public String UpdateModel(@RequestBody String body, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		ModelDTO modelDTO = mapper.readValue(body, ModelDTO.class);
        String jsonStr = mapper.writeValueAsString(modelDTO);
        
        System.out.println("equipmentDTO : " + modelDTO);
        System.out.println("jsonStr : " + jsonStr);
        
        if(modelDTO.getContractcode() == "") {
        	modelDTO.setContractcode(null);
        }
        
        equipmentservice.UpdateModel(modelDTO);
        
        String equipmentcode = modelDTO.getEquipmentcode();

        returnUrl = "redirect:/Equipment/View?equipmentcode=" + equipmentcode;
		return returnUrl;
	}
	
	@RequestMapping(value = "/Equipment/UploadModelExcel")
	public String UploadModelExcel(HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model, @RequestParam("file") MultipartFile file) throws Exception {

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
	
	@RequestMapping(value = "/Equipment/ExcelConvert")
	public void ExcelConvert(@RequestBody String body, HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {
		//파일을 읽기위해 엑셀파일을 가져온다
		FileInputStream fis=new FileInputStream("D:\\roqkffhwk2.xlsx");
		XSSFWorkbook workbook=new XSSFWorkbook(fis);
		int rowindex=0;
		int columnindex=0;
		//시트 수 (첫번째에만 존재하므로 0을 준다)
		//만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
		XSSFSheet sheet=workbook.getSheetAt(0);
		//행의 수
		int rows=sheet.getPhysicalNumberOfRows();
		for(rowindex=1;rowindex<rows;rowindex++){
		    //행을읽는다
		    XSSFRow row=sheet.getRow(rowindex);
		    if(row !=null){
		        //셀의 수
		        int cells=row.getPhysicalNumberOfCells();
		        for(columnindex=0;columnindex<=cells;columnindex++){
		            //셀값을 읽는다
		            XSSFCell cell=row.getCell(columnindex);
		            String value="";
		            //셀이 빈값일경우를 위한 널체크
		            if(cell==null){
		                continue;
		            }else{
		                //타입별로 내용 읽기
		                switch (cell.getCellType()){
		                case FORMULA:
		                    value=cell.getCellFormula();
		                    break;
		                case NUMERIC:
		                    value=cell.getNumericCellValue()+"";
		                    break;
		                case STRING:
		                    value=cell.getStringCellValue()+"";
		                    break;
		                case BLANK:
		                    value=cell.getBooleanCellValue()+"";
		                    break;
		                case ERROR:
		                    value=cell.getErrorCellValue()+"";
		                    break;
		                }
		            }
		            System.out.println("각 셀 내용 :"+value);
		        }
		    }
		}

	}
	
}
