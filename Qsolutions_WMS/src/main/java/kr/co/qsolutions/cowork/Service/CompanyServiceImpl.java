package kr.co.qsolutions.cowork.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.co.qsolutions.cowork.DAO.CompanyDao;
import kr.co.qsolutions.cowork.DAO.CoworkDao;
import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.ContractDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.FileDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.ContractVO;
import kr.co.qsolutions.cowork.VO.CoworkPagingVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.FileVO;
import kr.co.qsolutions.cowork.DAO.UserDao;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserPagingVO;
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

	@Override
	public List<CompanyVO> SelectCompanyListToExcel(PagingVO pagingVO) throws Exception {
	// TODO Auto-generated method stub
       return dao.SelectCompanyListToExcel(pagingVO);
	}

	@Override
	public int InsertFileUpload(FileDTO fileDTO) throws Exception {
		// TODO Auto-generated method stub
    	return dao.InsertFileUpload(fileDTO);
	}

	@Override
	public List<FileVO> SelectFileUpload(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectFileUpload(companyDTO);
	}

	@Override
	public int DeleteFile(FileDTO fileDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.DeleteFile(fileDTO);
	}

	@Override
	public int SelectUserCompanyCount(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectUserCompanyCount(companyDTO);
	}

	@Override
	public int CoworkViewSelectCompanyCount(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.CoworkViewSelectCompanyCount(companyDTO);
	}

	@Override
	public int SelectFileUploadCount(CompanyDTO companyDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectFileUploadCount(companyDTO);
	}

	@Override
	public List<UserVO> SelectUserCompanyList(String companycode) throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectUserCompanyList(companycode);
	}

	@Override
	public int SelectUserCompanyCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectUserCompanyCount(pagingVO);
	}

	@Override
	public List<CoworkVO> CoworkViewSelectCompanyList(String companycode) throws Exception {
		// TODO Auto-generated method stub
		return dao.CoworkViewSelectCompanyList(companycode);
	}

	@Override
	public int InsertContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.InsertContract(contractDTO);
	}

	@Override
	public List<ContractVO> SelectContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectContract(contractDTO);
	}

	@Override
	public ContractVO ViewContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.ViewContract(contractDTO);
	}

	@Override
	public int DeleteContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.DeleteContract(contractDTO);
	}

	@Override
	public int UpdateContract(ContractDTO contractDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.UpdateContract(contractDTO);
	}

	@Override
	public List<ContractVO> ContractAllSelect() throws Exception {
		// TODO Auto-generated method stub
		return dao.ContractAllSelect();
	}

	@Override
	public List<ContractVO> ExpiredContractSend() throws Exception {
		// TODO Auto-generated method stub
		return dao.ExpiredContractSend();
	}
	
}