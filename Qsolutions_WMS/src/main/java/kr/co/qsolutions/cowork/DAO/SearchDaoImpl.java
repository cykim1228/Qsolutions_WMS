package kr.co.qsolutions.cowork.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SearchVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Repository
public class SearchDaoImpl implements SearchDao {
	
	@Autowired
    private SqlSession sqlSession;

    private static final String Namespace = "co.kr.qsolutions.mapper.searchMapper";
    
	private static final Logger logger = LoggerFactory.getLogger(SearchDaoImpl.class);
	
	@Override
	public List<CompanyVO> SearchCompanyAll(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SearchCompanyAll",pagingVO);
	}

	@Override
	public int SearchCompanyCount(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		System.out.println("company2 : " + sqlSession.selectOne(Namespace+".SearchCompanyCount"));
		return sqlSession.selectOne(Namespace+".SearchCompanyCount");
	}
	
	@Override
	public int SearchCompanyCount() {
		// TODO Auto-generated method stub
		System.out.println("company4 : " + sqlSession.selectOne(Namespace+".SearchCompanyCount"));
		return sqlSession.selectOne(Namespace+".SearchCompanyCount");
	}
	
	@Override
	public List<CoworkVO> SearchCoworkAll(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SearchCoworkAll",pagingVO);
	}

	@Override
	public int SearchCoworkCount(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		System.out.println("cowork2 : " + sqlSession.selectOne(Namespace+".SearchCoworkCount"));
		return sqlSession.selectOne(Namespace+".SearchCoworkCount");
	}
	
	@Override
	public int SearchCoworkCount() {
		// TODO Auto-generated method stub
		System.out.println("cowork4 : " + sqlSession.selectOne(Namespace+".SearchCoworkCount"));
		return sqlSession.selectOne(Namespace+".SearchCoworkCount");
	}
	
	@Override
	public List<UserVO> SearchUserAll(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SearchUserAll", pagingVO);
	}
	
	@Override
	public int SearchUserCount(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		System.out.println("user2 : " + sqlSession.selectOne(Namespace+".SearchUserCount"));
		return sqlSession.selectOne(Namespace+".SearchUserCount");
	}
	
	@Override
	public int SearchUserCount() {
		// TODO Auto-generated method stub
		System.out.println("user4 : " + sqlSession.selectOne(Namespace+".SearchUserCount"));
		return sqlSession.selectOne(Namespace+".SearchUserCount");
	}
	
	@Override
	public List<SearchVO> SearchCompanyCountvo(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		System.out.println("company4 : " + sqlSession.selectList(Namespace+".SearchCompanyCountvo"));
		return sqlSession.selectList(Namespace+".SearchCompanyCountvo",pagingVO);
	}
	
	@Override
	public List<SearchVO> SearchCoworkCountvo(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		System.out.println("cowork4 : " + sqlSession.selectList(Namespace+".SearchCoworkCountvo"));
		return sqlSession.selectList(Namespace+".SearchCoworkCountvo",pagingVO);
	}
	
	@Override
	public List<SearchVO> SearchUserCountvo(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		System.out.println("user4 : " + sqlSession.selectList(Namespace+".SearchUserCountvo"));
		return sqlSession.selectList(Namespace+".SearchUserCountvo",pagingVO);
	}
	
}
