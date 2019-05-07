package kr.co.qsolutions.cowork.Service;

import java.util.Date;
import java.util.List;

import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.FileDTO;
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.FileVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

 
public interface UserService {
	//�˻��� ���� �׸�
    public List<UserVO> SelectUserList(PagingVO pagingVO) throws Exception;
    
    public UserVO UserViewSelect(String userid) throws Exception;
    
    public UserVO UserCheckID(String userid) throws Exception;

    public UserVO UserCheckPW(String userid) throws Exception;
    
    public int SelectUserCount() throws Exception;
    
    public int InsertUser(UserDTO userDTO) throws Exception;
    public int UpdateUser(UserDTO userDTO) throws Exception;
    public int DeleteUser(UserDTO userDTO) throws Exception;
    public List<UserVO> SelectDeptList() throws Exception;
    public List<UserVO> SelectPositionList() throws Exception;
    
    // �ڵ��α��� üũ�� ��쿡 ����� ���̺� ���ǰ� ��ȿ�ð��� �����ϱ� ���� �޼���
	public void keepLogin(String uid, String sessionId, Date next);
    
	// ������ �α����� ���� �ִ���, �� ��ȿ�ð��� ���� ���� ������ ������ �ִ��� üũ�Ѵ�.
	public UserVO checkUserWithSessionKey(String sessionId);
   
	public int googleLogin(UserDTO userDTO) throws Exception;

	public List<CoworkVO> selectUserCowork(CoworkDTO coworkDTO) throws Exception;

	public List<CoworkVO> selectManagerCowork(CoworkDTO coworkDTO) throws Exception;

	public String UserIdSelect(String nowdate) throws Exception;

	public int InsertProfileUpload(FileDTO fileDTO) throws Exception;

	public FileVO SelectProfile(String userid) throws Exception;

	public FileVO SelectUserColor(String userid) throws Exception;

	public int InsertUserColor(FileDTO fileDTO) throws Exception;

	public List<FileVO> SelectListUserColor() throws Exception;

	public List<CoworkVO> selectManagerCoworkList(String userid) throws Exception;
	
}