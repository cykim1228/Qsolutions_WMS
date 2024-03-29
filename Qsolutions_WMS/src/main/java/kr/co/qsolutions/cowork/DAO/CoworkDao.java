package kr.co.qsolutions.cowork.DAO;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.SubCoworkDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.ManagerVO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserVO;

public interface CoworkDao {
    
    public List<CoworkVO> CoworkViewListSelect(PagingVO pagingVO) throws Exception;
    
    public int CoworkViewListCount(PagingVO pagingVO) throws Exception;

    public CoworkVO CoworkViewSelect(CoworkDTO coworkDTO) throws Exception;
    
    public int CoworkViewInsert(CoworkDTO coworkDTO) throws Exception;
    public int CoworkViewUpdate(CoworkDTO coworkDTO) throws Exception;
    public int CoworkViewDelete(String coworkcode) throws Exception;

    public String CoworkCodeSelect(String nowdate) throws Exception;

	public List<CompanyVO> CompanyAllSelect() throws Exception;

	public List<SubCoworkVO> SubCoworkListSelect(String coworkcode) throws Exception;
    public int SubCoworkListInsert(SubCoworkDTO subcoworkDTO) throws Exception;
    public int SubCoworkListUpdate(SubCoworkDTO subcoworkDTO) throws Exception;
    public int SubCoworkListDelete(SubCoworkDTO subcoworkDTO) throws Exception;
    public int SubCoworkCount() throws Exception;

    public List<CoworkVO> CoworkViewSelectCompany(String companycode) throws Exception;

	public CoworkVO CoworkCalendarSelect(CoworkDTO coworkDTO) throws Exception;

	public List<CoworkVO> CoworkViewListCalendar(PagingVO pagingVO) throws Exception;

	public String SelectCoworkCode() throws Exception;

	public List<UserVO> SelectCoworkUser(CoworkDTO coworkDTO) throws Exception;

	public int InsertCoworkManager(CoworkDTO coworkDTO) throws Exception;

	public int DeleteCoworkManager(CoworkDTO coworkDTO) throws Exception;

	public List<CoworkVO> CoworkMyList(CoworkDTO coworkDTO) throws Exception;

	public List<SubCoworkVO> SubCoworkDashboardList() throws Exception;

	public List<ManagerVO> SelectCoworkManager() throws Exception;

	public List<CoworkVO> CoworkDashboardList() throws Exception;

	public int CountTodayCowork(CoworkDTO coworkDTO) throws Exception;

	public CoworkVO InsertCoworkLast() throws Exception;

}