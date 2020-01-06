package kr.co.qsolutions.cowork.VO;

public class EquipmentVO {
	
	private String equipmentcode;
	private String equipmentname;
	private String equipmentcompany;
	private String equipmentsubject;
	private String equipmentdivision;
	private String equipmentspec;
	private String equipmentcount;
	
	public String getEquipmentcode() {
		return equipmentcode;
	}
	public void setEquipmentcode(String equipmentcode) {
		this.equipmentcode = equipmentcode;
	}
	public String getEquipmentname() {
		return equipmentname;
	}
	public void setEquipmentname(String equipmentname) {
		this.equipmentname = equipmentname;
	}
	public String getEquipmentcompany() {
		return equipmentcompany;
	}
	public void setEquipmentcompany(String equipmentcompany) {
		this.equipmentcompany = equipmentcompany;
	}
	public String getEquipmentsubject() {
		return equipmentsubject;
	}
	public void setEquipmentsubject(String equipmentsubject) {
		this.equipmentsubject = equipmentsubject;
	}
	public String getEquipmentdivision() {
		return equipmentdivision;
	}
	public void setEquipmentdivision(String equipmentdivision) {
		this.equipmentdivision = equipmentdivision;
	}
	public String getEquipmentspec() {
		return equipmentspec;
	}
	public void setEquipmentspec(String equipmentspec) {
		this.equipmentspec = equipmentspec;
	}
	public String getEquipmentcount() {
		return equipmentcount;
	}
	public void setEquipmentcount(String equipmentcount) {
		this.equipmentcount = equipmentcount;
	}
	
	@Override
	public String toString() {
		return "EquipmentVO [equipmentcode=" + equipmentcode + ", equipmentname=" + equipmentname
				+ ", equipmentcompany=" + equipmentcompany + ", equipmentsubject=" + equipmentsubject
				+ ", equipmentdivision=" + equipmentdivision + ", equipmentspec=" + equipmentspec + ", equipmentcount="
				+ equipmentcount + "]";
	}
	
}
