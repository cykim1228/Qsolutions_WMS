package kr.co.qsolutions.cowork.VO;

import java.util.Date;

public class CoworkVO {

	private String userid;
	private String username;
	private String deptname;
	private String positionname;
	private String usermobile;
	private String useremail;
	private String usercompanycode;
	private String companycode;
	private String companyname;
	private String coworkcode;
	private String coworktext;
	private String coworktitle;
	private Date coworkdate;
	private String coworksubject;
	private String startdate;
	private String enddate;
	

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
	public String getCoworksubject() {
		return coworksubject;
	}
	public void setCoworksubject(String coworksubject) {
		this.coworksubject = coworksubject;
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
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}


	public String getPositionname() {
		return positionname;
	}


	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}


	public String getUsermobile() {
		return usermobile;
	}


	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public String getUsercompanycode() {
		return usercompanycode;
	}


	public void setUsercompanycode(String usercompanycode) {
		this.usercompanycode = usercompanycode;
	}


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


	public String getCoworkcode() {
		return coworkcode;
	}


	public void setCoworkcode(String coworkcode) {
		this.coworkcode = coworkcode;
	}


	public String getCoworktext() {
		return coworktext;
	}


	public void setCoworktext(String coworktext) {
		this.coworktext = coworktext;
	}


	public String getCoworktitle() {
		return coworktitle;
	}


	public void setCoworktitle(String coworktitle) {
		this.coworktitle = coworktitle;
	}


	public Date getCoworkdate() {
		return coworkdate;
	}


	public void setCoworkdate(Date coworkdate) {
		this.coworkdate = coworkdate;
	}
	@Override
	public String toString() {
		return "CoworkVO [userid=" + userid + ", username=" + username + ", deptname=" + deptname + ", positionname="
				+ positionname + ", usermobile=" + usermobile + ", useremail=" + useremail + ", usercompanycode="
				+ usercompanycode + ", companycode=" + companycode + ", companyname=" + companyname + ", coworkcode="
				+ coworkcode + ", coworktext=" + coworktext + ", coworktitle=" + coworktitle + ", coworkdate="
				+ coworkdate + ", coworksubject=" + coworksubject + ", startdate=" + startdate + ", enddate=" + enddate
				+ "]";
	}
	
}
