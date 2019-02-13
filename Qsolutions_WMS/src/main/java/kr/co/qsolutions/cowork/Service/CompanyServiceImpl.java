package kr.co.qsolutions.cowork.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.qsolutions.cowork.DAO.CompanyDao;
import kr.co.qsolutions.cowork.DAO.CoworkDao;
import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.DAO.UserDao;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyServiceImpl.class);

   @Inject
   private CompanyDao dao;
   
	@Override
	public List<CompanyVO> SelectCompanyList(PagingVO pagingVO) throws Exception {
	// TODO Auto-generated method stub
		System.out.println("Service===="+pagingVO);
       return dao.SelectCompanyList(pagingVO);
	}

	@Override
	public int SelectCompanyCount(PagingVO pagingVO) throws Exception {
	// TODO Auto-generated method stub
       return dao.SelectCompanyCount(pagingVO);
	}
	
	@Override
    public CompanyVO SelectCompanyView(CompanyDTO companyDTO) throws Exception{
    	return dao.SelectCompanyView(companyDTO);
    }

	@Override
    public int InsertCompany(CompanyDTO companyDTO) throws Exception{
		System.out.println("CoworkServiceImpl");
    	return dao.InsertCompany(companyDTO);
    }

	@Override
    public int UpdateCompany(CompanyDTO companyDTO) throws Exception{
		System.out.println("CoworkServiceImpl");
    	return dao.UpdateCompany(companyDTO);
    }
	@Override
    public int DeleteCompany(CompanyDTO companyDTO) throws Exception{
		System.out.println("CoworkServiceImpl");
    	return dao.DeleteCompany(companyDTO);
    }

	@Override
    public String SelectCompanyCode() throws Exception{
    	return dao.SelectCompanyCode();
    }

	@Override
    public List<UserVO> SelectCompanyUser(CompanyDTO companyDTO) throws Exception{
    	return dao.SelectCompanyUser(companyDTO);
    }
	
	@Override
	public List<UserVO> SelectUser() throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectUser();
	}

	@Override
	public String CompanyCodeSelect(String nowdate) throws Exception{
		return dao.CompanyCodeSelect(nowdate);
	}
	@Override
	public List<CompanyVO> CompanyAllSelect() throws Exception{
		return dao.CompanyAllSelect();
	}

	@Override
	public List<CoworkVO> CoworkViewSelectCompany(String coworkcode) throws Exception {
		// TODO Auto-generated method stub
        return dao.CoworkViewSelectCompany(coworkcode);
	}

	@Override
	public int InsertManager(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.InsertManager(coworkDTO);
	}

	@Override
	public int DeleteManager(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.DeleteManager(coworkDTO);
	}

	@Override
	public List<UserVO> SelectUserCompany(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectUserCompany(companyDTO);
	}

	@Override
	public int DeleteCompanyCowork(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("CoworkServiceImpl");
    	return dao.DeleteCompanyCowork(companyDTO);
	}

	
	
}