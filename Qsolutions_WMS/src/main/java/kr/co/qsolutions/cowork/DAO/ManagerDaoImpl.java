package kr.co.qsolutions.cowork.DAO;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.ManagerDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.ManagerVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;
 
@Repository
public class ManagerDaoImpl implements ManagerDao  {
 
    @Inject
    private SqlSession sqlSession;

    private static final String Namespace = "co.kr.qsolutions.mapper.accountMapper";
    
	private static final Logger logger = LoggerFactory.getLogger(ManagerDaoImpl.class);
	
    @Override
	public List<ManagerVO> SelectManagerList(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
    	return sqlSession.selectList(Namespace+".SelectManagerList", pagingVO);
	}
	@Override
	public ManagerVO ManagerViewSelect(String managerid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".ManagerViewSelect", managerid);
	}
	@Override
	public ManagerVO ManagerCheckID(String managerid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".ManagerCheckID", managerid);
	}
	@Override
	public ManagerVO ManagerCheckPW(String managerid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".ManagerCheckPW", managerid);
	}
	@Override
	public int SelectManagerCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".SelectManagerCount");
	}
	@Override
	public int InsertManager(ManagerDTO managerDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".InsertManager", managerDTO);
	}
	@Override
	public int UpdateManager(ManagerDTO managerDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".UpdateManager", managerDTO);
	}
	@Override
	public int DeleteManager(ManagerDTO managerDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(Namespace+".DeleteManager", managerDTO);
	}
	
	@Override
	public List<CoworkVO> selectUserCowork(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".selectUserCowork", coworkDTO);
	}
	@Override
	public List<CoworkVO> selectManagerCowork(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".selectManagerCowork", coworkDTO);
	}
	@Override
	public List<ManagerVO> SelectPositionList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectPositionList");
	}
	@Override
	public List<ManagerVO> SelectManager() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SelectManager");
	}
    
}
																																																																																																																																																																							