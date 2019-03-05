package kr.co.qsolutions.cowork.Controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.qsolutions.cowork.Util.FileUploadService;

public class FileUploadController {
	
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
	  
}
