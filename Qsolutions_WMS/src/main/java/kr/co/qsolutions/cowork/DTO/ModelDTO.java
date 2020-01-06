package kr.co.qsolutions.cowork.DTO;

public class ModelDTO {

	private String modelcode;
	private String equipmentcode;
	private String contractcode;
	private String modelname;
	private String modelserial;
	private String modelmac;
	private String modeldetail;
	
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
	
	@Override
	public String toString() {
		return "ModelDTO [modelcode=" + modelcode + ", equipmentcode=" + equipmentcode + ", contractcode="
				+ contractcode + ", modelname=" + modelname + ", modelserial=" + modelserial + ", modelmac=" + modelmac
				+ ", modeldetail=" + modeldetail + "]";
	}
	
}
