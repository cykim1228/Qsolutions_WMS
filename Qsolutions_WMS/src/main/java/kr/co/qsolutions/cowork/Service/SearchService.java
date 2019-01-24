package kr.co.qsolutions.cowork.Service;

import java.util.List;

import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.UserVO;

public interface SearchService {

	public List<CompanyVO> SearchCompanyAll(PagingVO pagingVO) throws Exception;

	public List<UserVO> SearchUserAll(PagingVO pagingVO) throws Exception;

	public List<CoworkVO> SearchCoworkAll(PagingVO pagingVO) throws Exception;

	public int SearchCompanyCount(PagingVO pagingVO) throws Exception;

	public int SearchUserCount(PagingVO pagingVO) throws Exception;

	public int SearchCoworkCount(PagingVO pagingVO) throws Exception;

}
