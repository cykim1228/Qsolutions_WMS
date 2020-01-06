package kr.co.qsolutions.cowork.VO;

public class ModelVO {

	private String modelcode;
	private String equipmentcode;
	private String contractcode;
	private String modelname;
	private String modelserial;
	private String modelmac;
	private String modeldetail;
	private String contracttitle;
	private String contractcompany;
	private String companyname;
	private String startdate;
	private String enddate;
	private String equipmentname;
	
	public String getModelcode() {
		return modelcode;
	}
	public void setModelcode(String modelcode) {
		this.modelcode = modelcode;
	}
	public String getEquipmentcode() {
		return equipmentcode;
	}
	public void setEquipmentcode(String equipmentcode) {
		this.equipmentcode = equipmentcode;
	}
	public String getContractcode() {
		return contractcode;
	}
	public void setContractcode(String contractcode) {
		this.contractcode = contractcode;
	}
	public String getModelname() {
		return modelname;
	}
	public void setModelname(String modelname) {
		this.modelname = modelname;
	}
	public String getModelserial() {
		return modelserial;
	}
	public void setModelserial(String modelserial) {
		this.modelserial = modelserial;
	}
	public String getModelmac() {
		return modelmac;
	}
	public void setModelmac(String modelmac) {
		this.modelmac = modelmac;
	}
	public String getModeldetail() {
		return modeldetail;
	}
	public void setModeldetail(String modeldetail) {
		this.modeldetail = modeldetail;
	}
	public String getContracttitle() {
		return contracttitle;
	}
	public void setContracttitle(String contracttitle) {
		this.contracttitle = contracttitle;
	}
	public String getContractcompany() {
		return contractcompany;
	}
	public void setContractcompany(String contractcompany) {
		this.contractcompany = contractcompany;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
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
	public String getEquipmentname() {
		return equipmentname;
	}
	public void setEquipmentname(String equipmentname) {
		this.equipmentname = equipmentname;
	}
	
	@Override
	public String toString() {
		return "ModelVO [modelcode=" + modelcode + ", equipmentcode=" + equipmentcode + ", contractcode=" + contractcode
				+ ", modelname=" + modelname + ", modelserial=" + modelserial + ", modelmac=" + modelmac
				+ ", modeldetail=" + modeldetail + ", contracttitle=" + contracttitle + ", contractcompany="
				+ contractcompany + ", companyname=" + companyname + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", equipmentname=" + equipmentname + "]";
	}

}
