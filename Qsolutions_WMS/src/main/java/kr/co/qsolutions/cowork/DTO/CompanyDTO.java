package kr.co.qsolutions.cowork.DTO;

import java.util.Date;

public class CompanyDTO {

	private String companycode;
	private String companyname;
	private String companyhomepg;
	private String companyzipcode;
	private String companyaddress;
	private String companyaddress2;
	private String companyclass;
	
	private int startIndex;
	private int cntPerPage;

	public String getCompanycode() {
		return companycode;
	}
	public void setCompanycode(String companycode) {
		this.companycode = companycode;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getCompanyhomepg() {
		return companyhomepg;
	}
	public void setCompanyhomepg(String companyhomepg) {
		this.companyhomepg = companyhomepg;
	}
	public String getCompanyaddress() {
		return companyaddress;
	}
	public void setCompanyaddress(String companyaddress) {
		this.companyaddress = companyaddress;
	}
	public String getCompanyaddress2() {
		return companyaddress2;
	}
	public void setCompanyaddress2(String companyaddress2) {
		this.companyaddress2 = companyaddress2;
	}
	public String getCompanyzipcode() {
		return companyzipcode;
	}
	public void setCompanyzipcode(String companyzipcode) {
		this.companyzipcode = companyzipcode;
	}
	public String getCompanyclass() {
		return companyclass;
	}
	public void setCompanyclass(String companyclass) {
		this.companyclass = companyclass;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	
	@Override
	public String toString() {
		return "CompanyDTO [companycode=" + companycode + ", companyname=" + companyname + ", companyhomepg="
				+ companyhomepg + ", companyzipcode=" + companyzipcode + ", companyaddress=" + companyaddress
				+ ", companyaddress2=" + companyaddress2 + ", companyclass=" + companyclass + ", startIndex="
				+ startIndex + ", cntPerPage=" + cntPerPage + "]";
	}
	
}
