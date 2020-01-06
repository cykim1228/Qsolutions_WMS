package kr.co.qsolutions.cowork.DTO;

public class ContractDTO {

	private String contractcode;
	private String contractcompany;
	private String contractsubject;
	private String startdate;
	private String enddate;
	private String contractname;
	private String contracttitle;
	
	public String getContractcode() {
		return contractcode;
	}
	public void setContractcode(String contractcode) {
		this.contractcode = contractcode;
	}
	public String getContractcompany() {
		return contractcompany;
	}
	public void setContractcompany(String contractcompany) {
		this.contractcompany = contractcompany;
	}
	public String getContractsubject() {
		return contractsubject;
	}
	public void setContractsubject(String contractsubject) {
		this.contractsubject = contractsubject;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getContractname() {
		return contractname;
	}
	public void setContractname(String contractname) {
		this.contractname = contractname;
	}
	public String getContracttitle() {
		return contracttitle;
	}
	public void setContracttitle(String contracttitle) {
		this.contracttitle = contracttitle;
	}
	
	@Override
	public String toString() {
		return "ContractDTO [contractcode=" + contractcode + ", contractcompany=" + contractcompany
				+ ", contractsubject=" + contractsubject + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", contractname=" + contractname + ", contracttitle=" + contracttitle + "]";
	}
	
	
}
