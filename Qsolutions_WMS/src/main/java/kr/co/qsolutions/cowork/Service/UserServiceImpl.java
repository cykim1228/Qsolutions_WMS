package kr.co.qsolutions.cowork.Service;


import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.qsolutions.cowork.DAO.UserDao;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

   @Inject
   private UserDao dao;
   
   @Override
   public List<UserVO> SelectUserList(PagingVO pagingVO) throws Exception {
       return dao.SelectUserList(pagingVO);
   }
   @Override
   public UserVO UserViewSelect(String userid) throws Exception {
       return dao.UserViewSelect(userid);
   }
   
	@Override
	public int SelectUserCount() throws Exception {
		return dao.SelectUserCount();
	}
	
	@Override
	public UserVO UserCheckID(String userid) throws Exception {
		logger.info(""+userid);
		return dao.UserCheckID(userid);
	}

	@Override
	public UserVO UserCheckPW(String userid) throws Exception {
		logger.info(""+userid);
		return dao.UserCheckPW(userid);
	}

    @Override
    public int InsertUser(UserDTO userDTO) throws Exception{
    	return dao.InsertUser(userDTO);
    }
    @Override
    public int UpdateUser(UserDTO userDTO) throws Exception{
    	return dao.UpdateUser(userDTO);
    }    @Override
    public int DeleteUser(UserDTO userDTO) throws Exception{
    	return dao.DeleteUser(userDTO);
    }
    @Override
    public List<UserVO> SelectDeptList() throws Exception{
    	return dao.SelectDeptList();
    }
    @Override
    public List<UserVO> SelectPositionList() throws Exception{
    	return dao.SelectPositionList();
    }
    @Override
    public void keepLogin(String uid, String sessionId, Date next) {
        dao.keepLogin(uid, sessionId, next);
    }
 
    @Override
    public UserVO checkUserWithSessionKey(String sessionId) {
        return dao.checkUserWithSessionKey(sessionId);
    }

}