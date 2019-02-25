package kr.co.qsolutions.cowork.DTO;

public class ManagerDTO {

	private int managerid;
	private String managername;
	private String managermobile;
	private String manageremail;
	private String managerdeptname;
	private String managerpositioncode;
	private String positionname;
	private String managercompanycode;
	private String companyname;
	
	public int getManagerid() {
		return managerid;
	}
	public void setManagerid(int managerid) {
		this.managerid = managerid;
	}
	public String getManagername() {
		return managername;
	}
	public void setManagername(String managername) {
		this.managername = managername;
	}
	public String getManagermobile() {
		return managermobile;
	}
	public void setManagermobile(String managermobile) {
		this.managermobile = managermobile;
	}
	public String getManageremail() {
		return manageremail;
	}
	public void setManageremail(String manageremail) {
		this.manageremail = manageremail;
	}
	public String getManagerdeptname() {
		return managerdeptname;
	}
	public void setManagerdeptname(String managerdeptname) {
		this.managerdeptname = managerdeptname;
	}
	public String getManagerpositioncode() {
		return managerpositioncode;
	}
	public void setManagerpositioncode(String managerpositioncode) {
		this.managerpositioncode = managerpositioncode;
	}
	public String getPositionname() {
		return positionname;
	}
	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}
	public String getManagercompanycode() {
		return managercompanycode;
	}
	public void setManagercompanycode(String managercompanycode) {
		this.managercompanycode = managercompanycode;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	
	@Override
	public String toString() {
		return "ManagerDTO [managerid=" + managerid + ", managername=" + managername + ", managermobile="
				+ managermobile + ", manageremail=" + manageremail + ", managerdeptname=" + managerdeptname
				+ ", managerpositioncode=" + managerpositioncode + ", positionname=" + positionname
				+ ", managercompanycode=" + managercompanycode + ", companyname=" + companyname + "]";
	}
	
}
