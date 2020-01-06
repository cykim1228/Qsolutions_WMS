package kr.co.qsolutions.cowork.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.FileDTO;
import kr.co.qsolutions.cowork.DTO.SubCoworkDTO;
import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.Service.UserService;
import kr.co.qsolutions.cowork.Util.FileUploadService;
import kr.co.qsolutions.cowork.VO.UserVO;

@Controller
public class FileUploadController {
	
	/*
	@Autowired
	FileUploadService fileUploadService;

	@RequestMapping( "/form" )
	public String form() {
		return "form";
	}

	@RequestMapping( "/Company/upload" )
	public String upload(HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model,
		@RequestParam("companycode") String companycode,
		@RequestParam("file1") MultipartFile file) {

		String url = fileUploadService.restore(companycode, file);
		
		String path = "C://upload//" + companycode;
		
		File files = new File(path);
		
		if(!files.exists()){
			//���丮 ���� �޼���
			files.mkdirs();
			System.out.println("created directory successfully!");
	    }

		model.addAttribute("url", url);
	    return "company/view";
	}
	*/
	
	/*
	 * @RequestMapping(value = "/Company/List") public String ajaxUpload() { return
	 * "Company/List"; }
	 */
	
	@Inject
	private CompanyService companyservice;
	
	@Inject
	private UserService userservice;
     
	String returnUrl;
	
    @RequestMapping(value = "/Company/fileUpload")
    public String fileUp(MultipartHttpServletRequest multi) throws Exception {
         
    	String companycode = multi.getParameter("companycode");
    	String filename = multi.getParameter("filename");
    	
        // ���� ��� ����
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = "C://upload//" + companycode + "/";
        String filepathname = "upload/" + companycode +"/";
         
        String newFileName = ""; // ���ε� �Ǵ� ���ϸ�
        
        File dir = new File(path);
		/*
		 * if(!dir.isDirectory()){ dir.mkdir(); }
		 */
        if(!dir.exists()){
			//���丮 ���� �޼���
        	dir.mkdirs();
			System.out.println("created directory successfully!");
		}
        
        System.out.println("filename : " +filename);
        
        FileDTO fileDTO = new FileDTO();
		fileDTO.setCompanycode(companycode);
		fileDTO.setFilename(filename);
		
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
            
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("���� ���� �̸� : " +fileName);
            
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
            try {
                mFile.transferTo(new File(path+newFileName));
                System.out.println("filepathname : " + newFileName);
                fileDTO.setFilepathname(filepathname+newFileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
		System.out.println("fileDTO : " + fileDTO);
		
        companyservice.InsertFileUpload(fileDTO);
        
        System.out.println("filename : " + multi.getParameter("filename"));
        // System.out.println("id : " + multi.getParameter("id"));
        // System.out.println("pw : " + multi.getParameter("pw"));
        
        return "company/viewlist";
    }
	
    @RequestMapping(value = "/Company/fileDelete")
    public String fileDelete(@RequestBody String body,HttpServletResponse response, HttpServletRequest request, HttpSession session ,Model model) throws Exception {

		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
		FileDTO fileDTO = mapper.readValue(body, FileDTO.class);
        String jsonStr = mapper.writeValueAsString(fileDTO);
        
        companyservice.DeleteFile(fileDTO);
		
		returnUrl = "redirect:/Company/List";
		return returnUrl;
    }
    
    @RequestMapping(value = "/User/profileUpload")
    public String profileUp(MultipartHttpServletRequest multi) throws Exception {
        
    	String userid = multi.getParameter("userid");
    	
    	System.out.println("userid : " +userid);
    	
        // ���� ��� ����
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = "C://upload//" + userid + "/";
        String filepathname = "upload/" + userid +"/";
         
        String newFileName = ""; // ���ε� �Ǵ� ���ϸ�
        
        File dir = new File(path);
		/*
		 * if(!dir.isDirectory()){ dir.mkdir(); }
		 */
        if(!dir.exists()){
			//���丮 ���� �޼���
        	dir.mkdirs();
			System.out.println("created directory successfully!");
		}
        
        FileDTO fileDTO = new FileDTO();
		fileDTO.setUserid(userid);
		
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
            
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("���� ������ �̸� : " +fileName);
            
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
            try {
                mFile.transferTo(new File(path+newFileName));
                System.out.println("filepathname : " + newFileName);
                fileDTO.setProfilepathname(filepathname+newFileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
		System.out.println("fileDTO : " + fileDTO);
		
		userservice.InsertProfileUpload(fileDTO);
        
        System.out.println("filename : " + multi.getParameter("filename"));
        // System.out.println("id : " + multi.getParameter("id"));
        // System.out.println("pw : " + multi.getParameter("pw"));
        
        return "/Login/dashboard";
    }
    
    @SuppressWarnings("resource")
	@RequestMapping(value = "/Equipment/fileUpload")
    public String EquipmentFileUpload(MultipartHttpServletRequest multi) throws Exception {
         
    	String equipmentcode = multi.getParameter("equipmentcode");
    	String filename = multi.getParameter("filename");
    	
        // ���� ��� ����
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = "C://upload//" + equipmentcode + "/";
        String filepathname = "upload/" + equipmentcode +"/";
        
        System.out.println("path : " + path);
        System.out.println("filepathname : " + filepathname);
         
        String newFileName = ""; // ���ε� �Ǵ� ���ϸ�
        
        File dir = new File(path);
		/*
		 * if(!dir.isDirectory()){ dir.mkdir(); }
		 */
        if(!dir.exists()){
			//���丮 ���� �޼���
        	dir.mkdirs();
			System.out.println("created directory successfully!");
		}
        
        System.out.println("filename : " +filename);
        
        FileDTO fileDTO = new FileDTO();
		fileDTO.setEquipmentcode(equipmentcode);
		fileDTO.setFilename(filename);
		
        Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
            
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            System.out.println("���� ���� �̸� : " +fileName);
            
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
            try {
                mFile.transferTo(new File(path+newFileName));
                System.out.println("filepathname : " + newFileName);
                fileDTO.setFilepathname(filepathname+newFileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
		System.out.println("fileDTO : " + fileDTO);
		
        System.out.println("filename : " + multi.getParameter("filename"));
        // System.out.println("id : " + multi.getParameter("id"));
        // System.out.println("pw : " + multi.getParameter("pw"));
        
      //������ �б����� ���������� �����´�
      		FileInputStream fis=new FileInputStream(path + newFileName);
      		XSSFWorkbook workbook=new XSSFWorkbook(fis);
      		int rowindex=0;
      		int columnindex=0;
      		//��Ʈ �� (ù��°���� �����ϹǷ� 0�� �ش�)
      		//���� �� ��Ʈ�� �б����ؼ��� FOR���� �ѹ��� �����ش�
      		XSSFSheet sheet=workbook.getSheetAt(0);
      		//���� ��
      		int rows=sheet.getPhysicalNumberOfRows();
      		for(rowindex=1;rowindex<rows;rowindex++){
      		    //�����д´�
      		    XSSFRow row=sheet.getRow(rowindex);
      		    if(row !=null){
      		        //���� ��
      		        int cells=row.getPhysicalNumberOfCells();
      		        for(columnindex=0;columnindex<=cells;columnindex++){
      		            //������ �д´�
      		            XSSFCell cell=row.getCell(columnindex);
      		            String value="";
      		            //���� ���ϰ�츦 ���� ��üũ
      		            if(cell==null){
      		                continue;
      		            }else{
      		                //Ÿ�Ժ��� ���� �б�
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
      		            System.out.println("�� �� ���� :"+value);
      		        }
      		    }
      		}
        
        return "equipment/view";
    }
    
}
