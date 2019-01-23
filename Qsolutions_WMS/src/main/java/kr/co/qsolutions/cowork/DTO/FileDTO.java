package kr.co.qsolutions.cowork.DTO;

import org.springframework.web.multipart.MultipartFile;

public class FileDTO {

    private String fname;
    private MultipartFile uploadFile;

    public FileDTO() {
    }
    
    public String getFname() {
        return fname;
    }
    public void setFname(String fname) {
        this.fname = fname;
    }
    public MultipartFile getuploadFile() {
        return uploadFile;
    }

    public void setuploadFile(MultipartFile uploadFile) {
        this.uploadFile = uploadFile;
    }

	@Override
	public String toString() {
		return "PagingDto [fname=" + fname + ", uploadFile=" + uploadFile + "]";
	}
}
