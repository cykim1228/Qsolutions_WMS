package kr.co.qsolutions.cowork.Controller;

import java.io.File;
import java.util.Iterator;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import kr.co.qsolutions.cowork.Util.FileUploadService;

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
			//디렉토리 생성 메서드
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
     
	String returnUrl;
	
    @RequestMapping(value = "/Company/fileUpload")
    public String fileUp(MultipartHttpServletRequest multi) throws Exception {
         
    	String companycode = multi.getParameter("companycode");
    	String filename = multi.getParameter("filename");
    	
        // 저장 경로 설정
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = "C://upload//" + companycode + "/";
        String filepathname = "upload/" + companycode +"/";
         
        String newFileName = ""; // 업로드 되는 파일명
        
        File dir = new File(path);
		/*
		 * if(!dir.isDirectory()){ dir.mkdir(); }
		 */
        if(!dir.exists()){
			//디렉토리 생성 메서드
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
            System.out.println("실제 파일 이름 : " +fileName);
            
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
    
}
