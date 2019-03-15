package kr.co.qsolutions.cowork.DAO;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.FileDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.FileVO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserVO;

public interface CompanyDao {
    
    public List<CompanyVO> SelectCompanyList(PagingVO pagingVO) throws Exception;
    
    public int SelectCompanyCount(PagingVO pagingVO) throws Exception;

    public CompanyVO SelectCompanyView(CompanyDTO companyDTO) throws Exception;
    
    public int InsertCompany(CompanyDTO companyDTO) throws Exception;
    public int UpdateCompany(CompanyDTO companyDTO) throws Exception;
    public int DeleteCompany(CompanyDTO companyDTO) throws Exception;

    public String SelectCompanyCode() throws Exception;
    public List<UserVO> SelectCompanyUser(CompanyDTO companyDTO) throws Exception;
    
    public List<UserVO> SelectUser() throws Exception;
    
    public String CompanyCodeSelect(String nowdate) throws Exception;

	public List<CompanyVO> CompanyAllSelect() throws Exception;

	public List<CoworkVO> CoworkViewSelectCompany(String coworkcode) throws Exception;

	public int InsertManager(CoworkDTO coworkDTO) throws Exception;
	
	public int DeleteManager(CoworkDTO coworkDTO) throws Exception;

	public List<UserVO> SelectUserCompany(CompanyDTO companyDTO) throws Exception;

	public int DeleteCompanyCowork(CompanyDTO companyDTO) throws Exception;

	public List<CompanyVO> SelectCompanyListToExcel(PagingVO pagingVO) throws Exception;

	public int InsertFileUpload(FileDTO fileDTO) throws Exception;

	public List<FileVO> SelectFileUpload(CompanyDTO companyDTO) throws Exception;

	public int DeleteFile(FileDTO fileDTO) throws Exception;

}