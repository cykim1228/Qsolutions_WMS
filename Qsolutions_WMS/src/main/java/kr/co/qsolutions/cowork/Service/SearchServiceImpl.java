package kr.co.qsolutions.cowork.Service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.qsolutions.cowork.DAO.CompanyDao;
import kr.co.qsolutions.cowork.DAO.CoworkDao;
import kr.co.qsolutions.cowork.DAO.UserDao;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Service
public class SearchServiceImpl implements SearchService {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchServiceImpl.class);
	
	@Inject
	   private CompanyDao companydao;
	
	@Inject
	   private UserDao userdao;
	
	@Inject
	   private CoworkDao coworkdao;

	@Override
	public List<CompanyVO> SearchCompanyAll(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return companydao.SearchCompanyAll(pagingVO);
	}

	@Override
	public List<UserVO> SearchUserAll(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return userdao.SearchUserAll(pagingVO);
	}

	@Override
	public List<CoworkVO> SearchCoworkAll(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return coworkdao.SearchCoworkAll(pagingVO);
	}

	@Override
	public int SearchCompanyCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return companydao.SearchCompanyCount();
	}

	@Override
	public int SearchUserCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return userdao.SearchUserCount();
	}

	@Override
	public int SearchCoworkCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return coworkdao.SearchCoworkCount();
	}
	
	
	
}
