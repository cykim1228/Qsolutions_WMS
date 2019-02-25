package kr.co.qsolutions.cowork.DAO;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

public interface UserDao {
    
    public List<UserVO> SelectUserList(PagingVO pagingVO) throws Exception;
    

    public UserVO UserViewSelect(String userid) throws Exception;
    
    public int SelectUserCount() throws Exception;
   
	public UserVO UserCheckID(String userid) throws Exception;

	public UserVO UserCheckPW(String userid) throws Exception;

    public int InsertUser(UserDTO userDTO) throws Exception;
    public int UpdateUser(UserDTO userDTO) throws Exception;
    public int DeleteUser(UserDTO userDTO) throws Exception;
    
    public List<UserVO> SelectDeptList() throws Exception;
    public List<UserVO> SelectPositionList() throws Exception;
    
    // 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
    public void keepLogin(String uid, String sessionId, Date next);
     
    // 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
    public UserVO checkUserWithSessionKey(String sessionId);

	public int googleLogin(UserDTO userDTO) throws Exception;

	public List<CoworkVO> selectUserCowork(CoworkDTO coworkDTO) throws Exception;

	public List<CoworkVO> selectManagerCowork(CoworkDTO coworkDTO) throws Exception;

	public String UserIdSelect(String nowdate) throws Exception;

}