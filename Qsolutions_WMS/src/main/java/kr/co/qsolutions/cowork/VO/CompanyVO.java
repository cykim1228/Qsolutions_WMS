package kr.co.qsolutions.cowork.VO;

import java.util.Date;

public class CompanyVO {

	private String companycode;
	private String companyname;
	private String companyhomepg;
	private String companyzipcode;
	private String companyaddress;
	private String companyaddress2;
	private String companyclass;
	

	

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
	public String getCompanyzipcode() {
		return companyzipcode;
	}
	public void setCompanyzipcode(String companyzipcode) {
		this.companyzipcode = companyzipcode;
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
	public String getCompanyclass() {
		return companyclass;
	}
	public void setCompanyclass(String companyclass) {
		this.companyclass = companyclass;
	}
	
	@Override
	public String toString() {
		return "CompanyVO [companycode=" + companycode + ", companyname=" + companyname + ", companyhomepg="
				+ companyhomepg + ", companyzipcode=" + companyzipcode + ", companyaddress=" + companyaddress
				+ ", companyaddress2=" + companyaddress2 + ", companyclass=" + companyclass + "]";
	}
	
}
