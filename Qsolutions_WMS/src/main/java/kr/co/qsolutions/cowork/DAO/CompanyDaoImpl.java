package kr.co.qsolutions.cowork.DAO;

import java.util.List;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
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

	
}
																																																																																																																																																																							