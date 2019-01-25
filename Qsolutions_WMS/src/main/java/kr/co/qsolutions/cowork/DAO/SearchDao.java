package kr.co.qsolutions.cowork.DAO;

import java.util.List;

import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SearchVO;
import kr.co.qsolutions.cowork.VO.UserVO;

public interface SearchDao {
	
	public List<CompanyVO> SearchCompanyAll(PagingVO pagingVO);
	
	public int SearchCompanyCount(PagingVO pagingVO);

	public int SearchCompanyCount();
	
	public List<CoworkVO> SearchCoworkAll(PagingVO pagingVO);

	public int SearchCoworkCount(PagingVO pagingVO);
	
	public int SearchCoworkCount();

	public List<UserVO> SearchUserAll(PagingVO pagingVO);

	public int SearchUserCount(PagingVO pagingVO);
	
	public int SearchUserCount();
	
	public List<SearchVO> SearchCompanyCountvo(PagingVO pagingVO);
	
	public List<SearchVO> SearchCoworkCountvo(PagingVO pagingVO);
	
	public List<SearchVO> SearchUserCountvo(PagingVO pagingVO);
	
}
