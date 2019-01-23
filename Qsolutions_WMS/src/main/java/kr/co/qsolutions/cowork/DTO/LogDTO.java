package kr.co.qsolutions.cowork.DTO;

import java.util.Date;


public class LogDTO {
	private int	Seq = 0;
	private String Ucode = "";
	private String LogData = "";
	private String LogType = "";
	private Date LogDate = new Date();
	private Date ComDate = new Date();
	private String StartLogDate = "";
	private String EndLogDate = "";
	
	public int getSeq() {
		return Seq;
	}
	public void setSeq(int seq) {
		Seq = seq;
	}
	public String getUcode() {
		return Ucode;
	}
	public void setUcode(String ucode) {
		Ucode = ucode;
	}
	public String getLogData() {
		return LogData;
	}
	public void setLogData(String logData) {
		LogData = logData;
	}
	public String getLogType() {
		return LogType;
	}
	public void setLogType(String logType) {
		LogType = logType;
	}
	public Date getLogDate() {
		return LogDate;
	}
	public void setLogDate(Date logDate) {
		System.out.println("LogDate===="+logDate);
		System.out.println("startLogDate===="+logDate);
		LogDate = logDate;
	}
	public Date getComDate() {
		return ComDate;
	}
	public void setComDate(Date comDate) {
		System.out.println("comDate===="+comDate);
		ComDate = comDate;
	}
	public String getStartLogDate() {
		return StartLogDate;
	}
	public void setStartLogDate(String startLogDate) {
		startLogDate+=" 00:00:00";
		System.out.println("startLogDate===="+startLogDate);
		StartLogDate = startLogDate;
	}
	public String getEndLogDate() {
		return EndLogDate;
	}
	public void setEndLogDate(String endLogDate) {
		endLogDate+=" 12:59:59";
		System.out.println("endLogDate==="+endLogDate);
		EndLogDate = endLogDate;
	}

}
