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

	// 검색을 위한 부분
	@Override
	public List<UserVO> SelectUserList(PagingVO pagingVO) throws Exception {
		logger.info("오냐 안오냐?");
		return sqlSession.selectList(Namespace + ".SelectUserList", pagingVO);
	}

	@Override
	public UserVO UserViewSelect(String userid) throws Exception {
		logger.info("오냐 안오냐?");
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

	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	public void keepLogin(String uid, String sessionId, Date next) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", uid);
		map.put("sessionId", sessionId);
		map.put("next", next);

		// Mapper.xml로 데이터를 전달할 때 한 객체밖에 전달 못함으로 map으로 묶어서 보내줌 단... 주의할 점은
		// Mapper.xml 안에서 #{} 이 안에 지정한 이름이랑 같아야함.. 자동으로 매핑될 수 있도록
		// 아래가 수행되면서, 사용자 테이블에 세션id와 유효시간이 저장됨
		sqlSession.update(Namespace + ".keepLogin", map);

	}

	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	public UserVO checkUserWithSessionKey(String sessionId) {
		// 유효시간이 남아있고(>now()) 전달받은 세션 id와 일치하는 사용자 정보를 꺼낸다.
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
