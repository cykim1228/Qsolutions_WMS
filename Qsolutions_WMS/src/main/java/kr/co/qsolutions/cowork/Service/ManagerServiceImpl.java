package kr.co.qsolutions.cowork.Service;


import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.qsolutions.cowork.DAO.ManagerDao;
import kr.co.qsolutions.cowork.DAO.UserDao;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.ManagerDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.ManagerVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerServiceImpl.class);

	@Inject
	private UserDao userdao;
	
	@Inject
	private ManagerDao dao;
	
	@Override
	public List<ManagerVO> SelectManagerList(PagingVO pagingVO) throws Exception {
		return dao.SelectManagerList(pagingVO);
	}
	@Override
	public ManagerVO ManagerViewSelect(String managerid) throws Exception {
		return dao.ManagerViewSelect(managerid);
	}
	@Override
	public ManagerVO ManagerCheckID(String managerid) throws Exception {
		// TODO Auto-generated method stub
		return dao.ManagerCheckID(managerid);
	}
	@Override
	public ManagerVO ManagerCheckPW(String managerid) throws Exception {
		// TODO Auto-generated method stub
		return dao.ManagerCheckPW(managerid);
	}
	@Override
	public int SelectManagerCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectManagerCount();
	}
	@Override
	public int InsertManager(ManagerDTO managerDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.InsertManager(managerDTO);
	}
	@Override
	public int UpdateManager(ManagerDTO managerDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.UpdateManager(managerDTO);
	}
	@Override
	public int DeleteManager(ManagerDTO managerDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.DeleteManager(managerDTO);
	}
	@Override
	public List<ManagerVO> SelectPositionList() throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectPositionList();
	}
	@Override
	public List<CoworkVO> selectUserCowork(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectUserCowork(coworkDTO);
	}
	@Override
	public List<CoworkVO> selectManagerCowork(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectManagerCowork(coworkDTO);
	}
	@Override
	public List<ManagerVO> SelectManager() throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectManager();
	}
	
}