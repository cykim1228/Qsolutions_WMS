package kr.co.qsolutions.cowork.Service;

import java.util.List;

import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SearchVO;
import kr.co.qsolutions.cowork.VO.UserVO;

public interface SearchService {

	public List<CompanyVO> SearchCompanyAll(PagingVO pagingVO) throws Exception;

	public List<UserVO> SearchUserAll(PagingVO pagingVO) throws Exception;

	public List<CoworkVO> SearchCoworkAll(PagingVO pagingVO) throws Exception;

	public int SearchCompanyCount(PagingVO pagingVO) throws Exception;

	public int SearchUserCount(PagingVO pagingVO) throws Exception;

	public int SearchCoworkCount(PagingVO pagingVO) throws Exception;
	
	public int SearchCompanyCount() throws Exception;

	public int SearchUserCount() throws Exception;

	public int SearchCoworkCount() throws Exception;
	
	public List<SearchVO> SearchCompanyCountvo(PagingVO pagingVO) throws Exception;

	public List<SearchVO> SearchUserCountvo(PagingVO pagingVO) throws Exception;

	public List<SearchVO> SearchCoworkCountvo(PagingVO pagingVO) throws Exception;

}
