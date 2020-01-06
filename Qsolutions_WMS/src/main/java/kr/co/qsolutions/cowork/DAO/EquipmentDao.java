package kr.co.qsolutions.cowork.DAO;

import java.util.List;

import kr.co.qsolutions.cowork.DTO.ContractDTO;
import kr.co.qsolutions.cowork.DTO.EquipmentDTO;
import kr.co.qsolutions.cowork.DTO.ModelDTO;
import kr.co.qsolutions.cowork.VO.EquipmentVO;
import kr.co.qsolutions.cowork.VO.ModelVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

public interface EquipmentDao {

	public List<EquipmentVO> SelectEquipmentList(PagingVO pagingVO) throws Exception;

	public int SelectEquipmentCount(PagingVO pagingVO) throws Exception;

	public EquipmentVO ViewEquipment(EquipmentDTO equipmentDTO) throws Exception;

	public int InsertEquipment(EquipmentDTO equipmentDTO) throws Exception;

	public int UpdateEquipment(EquipmentDTO equipmentDTO) throws Exception;

	public int DeleteEquipment(EquipmentDTO equipmentDTO) throws Exception;

	public String SelectEquipmentCode() throws Exception;

	public List<EquipmentVO> EquipmentAllSelect() throws Exception;

	public int InsertContractEquipment(EquipmentDTO equipmentDTO) throws Exception;

	public String SelectModelCode() throws Exception;

	public int InsertModel(ModelDTO modelDTO) throws Exception;

	public List<UserVO> SelectModelList(EquipmentDTO equipmentDTO) throws Exception;

	public ModelVO ViewSelectModel(ModelDTO modelDTO) throws Exception;

	public List<ModelVO> SelectContractModelList(ContractDTO contractDTO) throws Exception;

	public int DeleteContractModel(ModelDTO modelDTO) throws Exception;

	public int DeleteEquipmentModel(EquipmentDTO equipmentDTO) throws Exception;

	public int DeleteModel(ModelDTO modelDTO) throws Exception;

	public int UpdateModel(ModelDTO modelDTO) throws Exception;

	public List<ModelVO> SelectModel() throws Exception;

	public int UpdateContractModel(ModelDTO modelDTO) throws Exception;

}
