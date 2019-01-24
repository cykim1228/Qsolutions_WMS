package kr.co.qsolutions.cowork.DAO;

import java.util.List;

import javax.inject.Inject;
 
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.qsolutions.cowork.DTO.CompanyDTO;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.SubCoworkDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
 
@Repository
public class CoworkDaoImpl implements CoworkDao  {
 
    @Autowired
    private SqlSession sqlSession;

    private static final String Namespace = "co.kr.qsolutions.mapper.coworkMapper";
    
	private static final Logger logger = LoggerFactory.getLogger(CoworkDaoImpl.class);
	
	@Override
	public List<CoworkVO> CoworkViewListSelect(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectList(Namespace+".CoworkViewListSelect",pagingVO);
	}

	@Override
	public int CoworkViewListCount(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectOne(Namespace+".CoworkViewListCount");
	}
	@Override
	public CoworkVO CoworkViewSelect(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectOne(Namespace+".CoworkViewSelect",coworkDTO);
	}
	@Override
	public int CoworkViewInsert(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.insert(Namespace+".CoworkViewInsert", coworkDTO);
	}
	@Override
	public int CoworkViewUpdate(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.update(Namespace+".CoworkViewUpdate",coworkDTO);
	}
	@Override
	public int CoworkViewDelete(String coworkcode) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.update(Namespace+".CoworkViewDelete",coworkcode);
	}
	@Override
	public String CoworkCodeSelect(String nowdate) throws Exception{
		return sqlSession.selectOne(Namespace+".CoworkCodeSelect",nowdate);
	}
	
	@Override
	public List<CompanyVO> CompanyAllSelect() throws Exception{
		return sqlSession.selectList(Namespace+".CompanyAllSelect");
	}
	//====SUBCOWORKList 
	@Override
	public List<SubCoworkVO> SubCoworkListSelect(String coworkcode) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectList(Namespace+".SubCoworkListSelect",coworkcode);
	}
	@Override
	public int SubCoworkListInsert(SubCoworkDTO subcoworkDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.insert(Namespace+".SubCoworkListInsert", subcoworkDTO);
	}
	@Override
	public int SubCoworkListUpdate(SubCoworkDTO subcoworkDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.update(Namespace+".SubCoworkListUpdate",subcoworkDTO);
	}
	@Override
	public int SubCoworkListDelete(SubCoworkDTO subcoworkDTO) throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.update(Namespace+".SubCoworkListDelete",subcoworkDTO);
	}
	@Override
	public int SubCoworkCount() throws Exception {
		// TODO Auto-generated method stub
        return sqlSession.selectOne(Namespace+".SubCoworkCount");
	}

	@Override
	public List<CoworkVO> CoworkViewSelectCompany(String companycode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".CoworkViewSelectCompany");
	}

	@Override
	public List<CoworkVO> SearchCoworkAll(PagingVO pagingVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".SearchCoworkAll",pagingVO);
	}

	@Override
	public int SearchCoworkCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".SearchCoworkCount");
	}

}