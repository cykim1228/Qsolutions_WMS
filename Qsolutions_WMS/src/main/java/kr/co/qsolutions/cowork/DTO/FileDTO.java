package kr.co.qsolutions.cowork.DTO;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileDTO {

	private String companycode;
	private String filename;
	private String filepathname;
	private Date uploaddate;
	
    private String fname;
    private MultipartFile uploadFile;
    
    private String userid;
    private String profilepathname;
    private String usercolor;
    
    public FileDTO() {
    }
    
    public String getFname() {
        return fname;
    }
    public void setFname(String fname) {
        this.fname = fname;
    }
    
	public String getCompanycode() {
		return companycode;
	}

	public void setCompanycode(String companycode) {
		this.companycode = companycode;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepathname() {
		return filepathname;
	}

	public void setFilepathname(String filepathname) {
		this.filepathname = filepathname;
	}

	public Date getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getProfilepathname() {
		return profilepathname;
	}

	public void setProfilepathname(String profilepathname) {
		this.profilepathname = profilepathname;
	}

	public String getUsercolor() {
		return usercolor;
	}

	public void setUsercolor(String usercolor) {
		this.usercolor = usercolor;
	}

	@Override
	public String toString() {
		return "FileDTO [companycode=" + companycode + ", filename=" + filename + ", filepathname=" + filepathname
				+ ", uploaddate=" + uploaddate + ", fname=" + fname + ", uploadFile=" + uploadFile + ", userid="
				+ userid + ", profilepathname=" + profilepathname + ", usercolor=" + usercolor + "]";
	}

}
