package kr.co.qsolutions.cowork.Service;

import java.util.Date;
import java.util.List;

import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.ManagerDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.ManagerVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

 
public interface ManagerService {
	//검색을 위한 항목
    public List<ManagerVO> SelectManagerList(PagingVO pagingVO) throws Exception;
    
    public ManagerVO ManagerViewSelect(String managerid) throws Exception;
    
    public ManagerVO ManagerCheckID(String managerid) throws Exception;

    public ManagerVO ManagerCheckPW(String managerid) throws Exception;
    
    public int SelectManagerCount() throws Exception;
    
    public int InsertManager(ManagerDTO managerDTO) throws Exception;
    public int UpdateManager(ManagerDTO managerDTO) throws Exception;
    public int DeleteManager(ManagerDTO managerDTO) throws Exception;
    public List<ManagerVO> SelectPositionList() throws Exception;
    
	public List<CoworkVO> selectUserCowork(CoworkDTO coworkDTO) throws Exception;

	public List<CoworkVO> selectManagerCowork(CoworkDTO coworkDTO) throws Exception;

	public List<ManagerVO> SelectManager() throws Exception;
    
}