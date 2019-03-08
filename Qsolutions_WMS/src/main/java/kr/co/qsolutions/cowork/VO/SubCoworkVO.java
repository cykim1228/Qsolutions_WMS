package kr.co.qsolutions.cowork.VO;

import java.util.Date;

public class SubCoworkVO {

	private int subcoworkcode;
	private String subcoworktext;
	private Date subcoworkdate;
	private String coworkcode;
	private String userid;
	private String username;
	private String companyname;
	private String coworktitle;
	private String companycode;
	

	public int getSubcoworkcode() {
		return subcoworkcode;
	}


	public void setSubcoworkcode(int subcoworkcode) {
		this.subcoworkcode = subcoworkcode;
	}


	public String getSubcoworktext() {
		return subcoworktext;
	}


	public void setSubcoworktext(String subcoworktext) {
		this.subcoworktext = subcoworktext;
	}


	public Date getSubcoworkdate() {
		return subcoworkdate;
	}


	public void setSubcoworkdate(Date subcoworkdate) {
		this.subcoworkdate = subcoworkdate;
	}


	public String getCoworkcode() {
		return coworkcode;
	}


	public void setCoworkcode(String coworkcode) {
		this.coworkcode = coworkcode;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getCompanyname() {
		return companyname;
	}


	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getCoworktitle() {
		return coworktitle;
	}


	public void setCoworktitle(String coworktitle) {
		this.coworktitle = coworktitle;
	}
	
	public String getCompanycode() {
		return companycode;
	}


	public void setCompanycode(String companycode) {
		this.companycode = companycode;
	}

	@Override
	public String toString() {
		return "SubCoworkVO [subcoworkcode=" + subcoworkcode + ", subcoworktext=" + subcoworktext + ", subcoworkdate="
				+ subcoworkdate + ", coworkcode=" + coworkcode + ", userid=" + userid + ", username=" + username
				+ ", companyname=" + companyname + ", coworktitle=" + coworktitle + ", companycode=" + companycode
				+ "]";
	}

}

