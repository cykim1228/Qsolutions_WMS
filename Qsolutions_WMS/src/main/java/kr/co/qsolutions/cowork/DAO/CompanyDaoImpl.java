package kr.co.qsolutions.cowork.DAO;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.ContractDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.FileDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.ContractVO;
import kr.co.qsolutions.cowork.VO.CoworkPagingVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.FileVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserPagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;
 
@Repository
public class CompanyDaoImpl implements CompanyDao  {
 
    @Autowired
    private SqlSession sqlSession;

    private static final String Namespace = "co.kr.qsolutions.mapper.companyMapper";
    
	private static final Logger logger = LoggerFactory.getLogger(CompanyDaoImpl.class);
	
	@Override
	public List<CompanyVO> SelectCompanyList(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectList(Namespace+".SelectCompanyList",pagingVO);
	}

	@Override
	public int SelectCompanyCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectOne(Namespace+".SelectCompanyCount");
	}
	@Override
	public CompanyVO SelectCompanyView(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectOne(Namespace+".SelectCompanyView",companyDTO);
	}
	
	@Override
	public int InsertCompany(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.insert(Namespace+".InsertCompany", companyDTO);
	}
	@Override
	public int UpdateCompany(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.update(Namespace+".UpdateCompany", companyDTO);
	}
	@Override
	public int DeleteCompany(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.update(Namespace+".DeleteCompany", companyDTO);
	}
	@Override
    public String SelectCompanyCode() throws Exception{
    	return sqlSession.selectOne(Namespace+".SelectCompanyCode");
    }

	@Override
    public List<UserVO> SelectCompanyUser(CompanyDTO companyDTO) throws Exception{
    	return sqlSession.selectList(Namespace+".SelectCompanyUser", companyDTO);
    }
	
	@Override
	public List<UserVO> SelectUser() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectUser");
	}

	@Override
	public String CompanyCodeSelect(String nowdate) throws Exception{
		return sqlSession.selectOne(Namespace+".CompanyCodeSelect",nowdate);
	}
	
	@Override
	public List<CompanyVO> CompanyAllSelect() throws Exception{
		return sqlSession.selectList(Namespace+".CompanyAllSelect");
	}

	@Override
	public List<CoworkVO> CoworkViewSelectCompany(String coworkcode) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectList(Namespace+".CoworkViewSelectCompany",coworkcode);
	}

	@Override
	public int InsertManager(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".InsertManager",coworkDTO);
	}

	@Override
	public int DeleteManager(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace+".DeleteManager",coworkDTO);
	}

	@Override
	public List<UserVO> SelectUserCompany(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectUserCompany",companyDTO);
	}

	@Override
	public int DeleteCompanyCowork(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".DeleteCompanyCowork", companyDTO);
	}

	@Override
	public List<CompanyVO> SelectCompanyListToExcel(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectList(Namespace+".SelectCompanyListToExcel",pagingVO);
	}

	@Override
	public int InsertFileUpload(FileDTO fileDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".InsertFileUpload", fileDTO);
	}

	@Override
	public List<FileVO> SelectFileUpload(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectFileUpload", companyDTO);
	}

	@Override
	public int DeleteFile(FileDTO fileDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(Namespace+".DeleteFile", fileDTO);
	}

	@Override
	public int SelectUserCompanyCount(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".SelectUserCompanyCount", companyDTO);
	}

	@Override
	public int CoworkViewSelectCompanyCount(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".CoworkViewSelectCompanyCount", companyDTO);
	}

	@Override
	public int SelectFileUploadCount(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".SelectFileUploadCount", companyDTO);
	}

	@Override
	public List<UserVO> SelectUserCompanyList(String companycode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectUserCompanyList", companycode);
	}

	@Override
	public int SelectUserCompanyCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".SelectUserCompanyCount");
	}

	@Override
	public List<CoworkVO> CoworkViewSelectCompanyList(String companycode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".CoworkViewSelectCompanyList", companycode);
	}

	@Override
	public int InsertContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".InsertContract", contractDTO);
	}

	@Override
	public List<ContractVO> SelectContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectContract", contractDTO);
	}

	@Override
	public ContractVO ViewContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".ViewContract", contractDTO);
	}

	@Override
	public int DeleteContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".DeleteContract", contractDTO);
	}

	@Override
	public int UpdateContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".UpdateContract", contractDTO);
	}

	@Override
	public List<ContractVO> ContractAllSelect() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".ContractAllSelect");
	}

	@Override
	public List<ContractVO> ExpiredContractSend() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".ExpiredContractSend");
	}

}
																																																																																																																																																																							