package kr.co.qsolutions.cowork.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.qsolutions.cowork.DTO.ContractDTO;
import kr.co.qsolutions.cowork.DTO.EquipmentDTO;
import kr.co.qsolutions.cowork.DTO.ModelDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.EquipmentVO;
import kr.co.qsolutions.cowork.VO.ModelVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Repository
public class EquipmentDaoImpl implements EquipmentDao {
	
	@Autowired
    private SqlSession sqlSession;

    private static final String Namespace = "co.kr.qsolutions.mapper.equipmentMapper";
    
	private static final Logger logger = LoggerFactory.getLogger(EquipmentDaoImpl.class);
	
	@Override
	public List<EquipmentVO> SelectEquipmentList(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectList(Namespace+".SelectEquipmentList",pagingVO);
	}

	@Override
	public int SelectEquipmentCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectOne(Namespace+".SelectEquipmentCount");
	}

	@Override
	public EquipmentVO ViewEquipment(EquipmentDTO equipmentDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".ViewEquipment", equipmentDTO);
	}

	@Override
	public int InsertEquipment(EquipmentDTO equipmentDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".InsertEquipment", equipmentDTO);
	}

	@Override
	public int UpdateEquipment(EquipmentDTO equipmentDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".UpdateEquipment", equipmentDTO);
	}

	@Override
	public int DeleteEquipment(EquipmentDTO equipmentDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".DeleteEquipment", equipmentDTO);
	}

	@Override
	public String SelectEquipmentCode() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".SelectEquipmentCode");
	}

	@Override
	public List<EquipmentVO> EquipmentAllSelect() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".EquipmentAllSelect");
	}

	@Override
	public int InsertContractEquipment(EquipmentDTO equipmentDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".InsertContractEquipment", equipmentDTO);
	}

	@Override
	public String SelectModelCode() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".SelectModelCode");
	}

	@Override
	public int InsertModel(ModelDTO modelDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".InsertModel", modelDTO);
	}

	@Override
	public List<UserVO> SelectModelList(EquipmentDTO equipmentDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectModelList", equipmentDTO);
	}

	@Override
	public ModelVO ViewSelectModel(ModelDTO modelDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".ViewSelectModel", modelDTO);
	}

	@Override
	public List<ModelVO> SelectContractModelList(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectContractModelList", contractDTO);
	}

	@Override
	public int DeleteContractModel(ModelDTO modelDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".DeleteContractModel", modelDTO);
	}

	@Override
	public int DeleteEquipmentModel(EquipmentDTO equipmentDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".DeleteEquipmentModel", equipmentDTO);
	}

	@Override
	public int DeleteModel(ModelDTO modelDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".DeleteModel", modelDTO);
	}

	@Override
	public int UpdateModel(ModelDTO modelDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".UpdateModel", modelDTO);
	}

	@Override
	public List<ModelVO> SelectModel() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectModel");
	}

	@Override
	public int UpdateContractModel(ModelDTO modelDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".UpdateContractModel", modelDTO);
	}
	
}
