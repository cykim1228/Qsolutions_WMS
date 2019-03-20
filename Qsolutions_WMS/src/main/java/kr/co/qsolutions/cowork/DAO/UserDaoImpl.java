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
import kr.co.qsolutions.cowork.DTO.UserDTO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "co.kr.qsolutions.mapper.accountMapper";

	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	// �˻��� ���� �κ�
	@Override
	public List<UserVO> SelectUserList(PagingVO pagingVO) throws Exception {
		logger.info("���� �ȿ���?");
		return sqlSession.selectList(Namespace + ".SelectUserList", pagingVO);
	}

	@Override
	public UserVO UserViewSelect(String userid) throws Exception {
		logger.info("���� �ȿ���?");
		return sqlSession.selectOne(Namespace + ".UserViewSelect", userid);
	}

	@Override
	public int SelectUserCount() throws Exception {
		return sqlSession.selectOne(Namespace + ".SelectUserCount");
	}

	@Override
	public UserVO UserCheckID(String userid) throws Exception {

		logger.info("" + userid);
		return sqlSession.selectOne(Namespace + ".UserCheckID", userid);
	}

	@Override
	public UserVO UserCheckPW(String userid) throws Exception {

		logger.info("" + userid);
		return sqlSession.selectOne(Namespace + ".UserCheckPW", userid);
	}

	@Override
	public int InsertUser(UserDTO userDTO) throws Exception {
		return sqlSession.insert(Namespace + ".InsertUser", userDTO);
	}

	@Override
	public int UpdateUser(UserDTO userDTO) throws Exception {
		return sqlSession.insert(Namespace + ".UpdateUser", userDTO);
	}

	@Override
	public int DeleteUser(UserDTO userDTO) throws Exception {
		return sqlSession.insert(Namespace + ".DeleteUser", userDTO);
	}

	@Override
	public List<UserVO> SelectDeptList() throws Exception {
		return sqlSession.selectList(Namespace + ".SelectDeptList");
	}

	@Override
	public List<UserVO> SelectPositionList() throws Exception {
		return sqlSession.selectList(Namespace + ".SelectPositionList");
	}

	// �ڵ��α��� üũ�� ��쿡 ����� ���̺� ���ǰ� ��ȿ�ð��� �����ϱ� ���� �޼���
	public void keepLogin(String uid, String sessionId, Date next) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", uid);
		map.put("sessionId", sessionId);
		map.put("next", next);

		// Mapper.xml�� �����͸� ������ �� �� ��ü�ۿ� ���� �������� map���� ��� ������ ��... ������ ����
		// Mapper.xml �ȿ��� #{} �� �ȿ� ������ �̸��̶� ���ƾ���.. �ڵ����� ���ε� �� �ֵ���
		// �Ʒ��� ����Ǹ鼭, ����� ���̺� ����id�� ��ȿ�ð��� �����
		sqlSession.update(Namespace + ".keepLogin", map);

	}

	// ������ �α����� ���� �ִ���, �� ��ȿ�ð��� ���� ���� ������ ������ �ִ��� üũ�Ѵ�.
	public UserVO checkUserWithSessionKey(String sessionId) {
		// ��ȿ�ð��� �����ְ�(>now()) ���޹��� ���� id�� ��ġ�ϴ� ����� ������ ������.
		return sqlSession.selectOne(Namespace + ".checkUserWithSessionKey", sessionId);
	}

	@Override
	public int googleLogin(UserDTO userDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace + ".googleLogin");
	}

	@Override
	public List<CoworkVO> selectUserCowork(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectUserCowork", coworkDTO);
	}

	@Override
	public List<CoworkVO> selectManagerCowork(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectManagerCowork", coworkDTO);
	}

	@Override
	public String UserIdSelect(String nowdate) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".UserIdSelect", nowdate);
	}

}
