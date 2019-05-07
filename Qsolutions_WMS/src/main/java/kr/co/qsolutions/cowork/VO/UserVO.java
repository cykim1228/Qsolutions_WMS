package kr.co.qsolutions.cowork.VO;

import java.util.List;

public class UserVO {

	private String userid;
	private String username;
	private String userpasswd;
	private String usermobile;
	private String useremail;
	private String deptcode;
	private String deptname;
	private String positioncode;
	private String positionname;
	private String usercompanyname;
	private boolean useCookie;
	private String gmail;
	private String gname;
	private String oauthcode;
	private String usercompanycode;
	private String companyname;
	
	private List<UserVO> managerList;
	
	private int startIndex;
	private int cntPerPage;

	public String getUserid() {
		return userid;
	}
	public String getUsername() {
		return username;
	}
	public String getUserpasswd() {
		return userpasswd;
	}
	public String getUsermobile() {
		return usermobile;
	}
	public String getUseremail() {
		return useremail;
	}
	public String getDeptcode() {
		return deptcode;
	}
	public String getDeptname() {
		return deptname;
	}
	public String getPositioncode() {
		return positioncode;
	}
	public String getPositionname() {
		return positionname;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setUserpasswd(String userpasswd) {
		this.userpasswd = userpasswd;
	}
	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public void setDeptcode(String deptcode) {
		this.deptcode = deptcode;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public void setPositioncode(String positioncode) {
		this.positioncode = positioncode;
	}

	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	public String getGmail() {
		return gmail;
	}
	public void setGmail(String gmail) {
		this.gmail = gmail;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getOauthcode() {
		return oauthcode;
	}
	public void setOauthcode(String oauthcode) {
		this.oauthcode = oauthcode;
	}
	public String getUsercompanyname() {
		return usercompanyname;
	}
	public void setUsercompanyname(String usercompanyname) {
		this.usercompanyname = usercompanyname;
	}
	public String getUsercompanycode() {
		return usercompanycode;
	}
	public void setUsercompanycode(String usercompanycode) {
		this.usercompanycode = usercompanycode;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public List<UserVO> getManagerList() {
		return managerList;
	}
	public void setManagerList(List<UserVO> managerList) {
		this.managerList = managerList;
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
		return "UserVO [userid=" + userid + ", username=" + username + ", userpasswd=" + userpasswd + ", usermobile="
				+ usermobile + ", useremail=" + useremail + ", deptcode=" + deptcode + ", deptname=" + deptname
				+ ", positioncode=" + positioncode + ", positionname=" + positionname + ", usercompanyname="
				+ usercompanyname + ", useCookie=" + useCookie + ", gmail=" + gmail + ", gname=" + gname
				+ ", oauthcode=" + oauthcode + ", usercompanycode=" + usercompanycode + ", companyname=" + companyname
				+ ", managerList=" + managerList + ", startIndex=" + startIndex + ", cntPerPage=" + cntPerPage + "]";
	}
	
}
