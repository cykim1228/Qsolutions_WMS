package kr.co.qsolutions.cowork.Service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.qsolutions.cowork.DAO.CompanyDao;
import kr.co.qsolutions.cowork.DAO.EquipmentDao;
import kr.co.qsolutions.cowork.DTO.ContractDTO;
import kr.co.qsolutions.cowork.DTO.EquipmentDTO;
import kr.co.qsolutions.cowork.DTO.ModelDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.EquipmentVO;
import kr.co.qsolutions.cowork.VO.ModelVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Service
public class EquipmentServiceImpl implements EquipmentService {
	
	private static final Logger logger = LoggerFactory.getLogger(EquipmentServiceImpl.class);

	   @Inject
	   private EquipmentDao dao;
	   
		@Override
		public List<EquipmentVO> SelectEquipmentList(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
			System.out.println("Service===="+pagingVO);
	       return dao.SelectEquipmentList(pagingVO);
		}

		@Override
		public int SelectEquipmentCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
	       return dao.SelectEquipmentCount(pagingVO);
		}

		@Override
		public EquipmentVO ViewEquipment(EquipmentDTO equipmentDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.ViewEquipment(equipmentDTO);
		}

		@Override
		public int InsertEquipment(EquipmentDTO equipmentDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.InsertEquipment(equipmentDTO);
		}

		@Override
		public int UpdateEquipment(EquipmentDTO equipmentDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.UpdateEquipment(equipmentDTO);
		}

		@Override
		public int DeleteEquipment(EquipmentDTO equipmentDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.DeleteEquipment(equipmentDTO);
		}

		@Override
		public String SelectEquipmentCode() throws Exception {
			// TODO Auto-generated method stub
			return dao.SelectEquipmentCode();
		}

		@Override
		public List<EquipmentVO> EquipmentAllSelect() throws Exception {
			// TODO Auto-generated method stub
			return dao.EquipmentAllSelect();
		}

		@Override
		public int InsertContractEquipment(EquipmentDTO equipmentDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.InsertContractEquipment(equipmentDTO);
		}

		@Override
		public String SelectModelCode() throws Exception {
			// TODO Auto-generated method stub
			return dao.SelectModelCode();
		}

		@Override
		public int InsertModel(ModelDTO modelDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.InsertModel(modelDTO);
		}

		@Override
		public List<UserVO> SelectModelList(EquipmentDTO equipmentDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.SelectModelList(equipmentDTO);
		}

		@Override
		public ModelVO ViewSelectModel(ModelDTO modelDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.ViewSelectModel(modelDTO);
		}

		@Override
		public List<ModelVO> SelectContractModelList(ContractDTO contractDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.SelectContractModelList(contractDTO);
		}

		@Override
		public int DeleteContractModel(ModelDTO modelDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.DeleteContractModel(modelDTO);
		}

		@Override
		public int DeleteEquipmentModel(EquipmentDTO equipmentDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.DeleteEquipmentModel(equipmentDTO);
		}

		@Override
		public int DeleteModel(ModelDTO modelDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.DeleteModel(modelDTO);
		}

		@Override
		public int UpdateModel(ModelDTO modelDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.UpdateModel(modelDTO);
		}

		@Override
		public List<ModelVO> SelectModel() throws Exception {
			// TODO Auto-generated method stub
			return dao.SelectModel();
		}

		@Override
		public int UpdateContractModel(ModelDTO modelDTO) throws Exception {
			// TODO Auto-generated method stub
			return dao.UpdateContractModel(modelDTO);
		}
}
