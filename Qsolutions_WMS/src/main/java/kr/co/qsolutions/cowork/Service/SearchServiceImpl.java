package kr.co.qsolutions.cowork.Service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.qsolutions.cowork.DAO.SearchDao;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SearchVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Service
public class SearchServiceImpl implements SearchService {
	
	private static final Logger logger = LoggerFactory.getLogger(SearchServiceImpl.class);
	
	@Inject
	private SearchDao searchdao;

	@Override
	public List<CompanyVO> SearchCompanyAll(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return searchdao.SearchCompanyAll(pagingVO);
	}

	@Override
	public List<UserVO> SearchUserAll(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return searchdao.SearchUserAll(pagingVO);
	}

	@Override
	public List<CoworkVO> SearchCoworkAll(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return searchdao.SearchCoworkAll(pagingVO);
	}

	@Override
	public int SearchCompanyCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("company1 : " + searchdao.SearchCompanyCount(pagingVO));
		return searchdao.SearchCompanyCount(pagingVO);
	}

	@Override
	public int SearchUserCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("user1 : " + searchdao.SearchUserCount(pagingVO));
		return searchdao.SearchUserCount(pagingVO);
	}

	@Override
	public int SearchCoworkCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("cowork1 : " + searchdao.SearchCoworkCount(pagingVO));
		return searchdao.SearchCoworkCount(pagingVO);
	}
	
	@Override
	public int SearchCompanyCount() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("company3 : " + searchdao.SearchCompanyCount());
		return searchdao.SearchCompanyCount();
	}

	@Override
	public int SearchUserCount() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("user3 : " + searchdao.SearchUserCount());
		return searchdao.SearchUserCount();
	}

	@Override
	public int SearchCoworkCount() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("cowork3 : " + searchdao.SearchCoworkCount());
		return searchdao.SearchCoworkCount();
	}
	
	@Override
	public List<SearchVO> SearchCompanyCountvo(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("company3 : " + searchdao.SearchCompanyCountvo(pagingVO));
		return searchdao.SearchCompanyCountvo(pagingVO);
	}

	@Override
	public List<SearchVO> SearchUserCountvo(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("user3 : " + searchdao.SearchUserCountvo(pagingVO));
		return searchdao.SearchUserCountvo(pagingVO);
	}

	@Override
	public List<SearchVO> SearchCoworkCountvo(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("cowork3 : " + searchdao.SearchCoworkCountvo(pagingVO));
		return searchdao.SearchCoworkCountvo(pagingVO);
	}
	
}
