package kr.co.qsolutions.cowork.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.qsolutions.cowork.DAO.CoworkDao;
import kr.co.qsolutions.cowork.DTO.CoworkDTO;
import kr.co.qsolutions.cowork.DTO.SubCoworkDTO;
import kr.co.qsolutions.cowork.VO.CompanyVO;
import kr.co.qsolutions.cowork.VO.CoworkVO;
import kr.co.qsolutions.cowork.DAO.UserDao;
import kr.co.qsolutions.cowork.VO.PagingVO;
import kr.co.qsolutions.cowork.VO.SubCoworkVO;
import kr.co.qsolutions.cowork.VO.UserVO;

@Service
public class CoworkServiceImpl implements CoworkService {
	
	private static final Logger logger = LoggerFactory.getLogger(CoworkServiceImpl.class);

   @Inject
   private CoworkDao dao;
   
	@Override
	public List<CoworkVO> CoworkViewListSelect(PagingVO pagingVO) throws Exception {
	// TODO Auto-generated method stub
		System.out.println("Service===="+pagingVO);
       return dao.CoworkViewListSelect(pagingVO);
	}

	@Override
	public int CoworkViewListCount(PagingVO pagingVO) throws Exception {
	// TODO Auto-generated method stub
       return dao.CoworkViewListCount(pagingVO);
	}
	
	@Override
    public CoworkVO CoworkViewSelect(CoworkDTO coworkDTO) throws Exception{
		System.out.println("CoworkServiceImpl");
    	return dao.CoworkViewSelect(coworkDTO);
    }

	@Override
    public int CoworkViewInsert(CoworkDTO coworkDTO) throws Exception{
		System.out.println("CoworkServiceImpl");
    	return dao.CoworkViewInsert(coworkDTO);
    }
	@Override
    public int CoworkViewUpdate(CoworkDTO coworkDTO) throws Exception{
		System.out.println("CoworkServiceImpl");
    	return dao.CoworkViewUpdate(coworkDTO);
    }	
	@Override
    public int CoworkViewDelete(String coworkcode) throws Exception{
		System.out.println("CoworkServiceImpl");
    	return dao.CoworkViewDelete(coworkcode);
    }	
	@Override
	public String CoworkCodeSelect(String nowdate) throws Exception{
		return dao.CoworkCodeSelect(nowdate);
	}
	@Override
	public List<CompanyVO> CompanyAllSelect() throws Exception{
		return dao.CompanyAllSelect();
	}
	//====SUBCOWORKList 
	@Override
	public List<SubCoworkVO> SubCoworkListSelect(String coworkcode) throws Exception {
		// TODO Auto-generated method stub
        return dao.SubCoworkListSelect(coworkcode);
	}
	@Override
	public int SubCoworkListInsert(SubCoworkDTO subcoworkDTO) throws Exception {
		// TODO Auto-generated method stub
        return dao.SubCoworkListInsert(subcoworkDTO);
	}
	@Override
	public int SubCoworkListUpdate(SubCoworkDTO subcoworkDTO) throws Exception {
		// TODO Auto-generated method stub
        return dao.SubCoworkListUpdate(subcoworkDTO);
	}
	@Override
	public int SubCoworkListDelete(SubCoworkDTO subcoworkDTO) throws Exception {
		// TODO Auto-generated method stub
        return dao.SubCoworkListDelete(subcoworkDTO);
	}
	@Override
	public int SubCoworkCount() throws Exception {
		// TODO Auto-generated method stub
        return dao.SubCoworkCount();
	}

	@Override
	public List<CoworkVO> CoworkViewSelectCompany(String companycode) throws Exception {
		// TODO Auto-generated method stub
		return dao.CoworkViewSelectCompany(companycode);
	}

	@Override
	public CoworkVO CoworkCalendarSelect(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.CoworkCalendarSelect(coworkDTO);
	}

	@Override
	public List<CoworkVO> CoworkViewListCalendar(PagingVO pagingVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.CoworkViewListCalendar(pagingVO);
	}

	@Override
	public String SelectCoworkCode() throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectCoworkCode();
	}

	@Override
	public List<UserVO> SelectCoworkUser(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.SelectCoworkUser(coworkDTO);
	}

	@Override
	public int InsertCoworkManager(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.InsertCoworkManager(coworkDTO);
	}

	@Override
	public int DeleteCoworkManager(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.DeleteCoworkManager(coworkDTO);
	}

	@Override
	public List<CoworkVO> CoworkMyList(CoworkDTO coworkDTO) throws Exception {
		// TODO Auto-generated method stub
		return dao.CoworkMyList(coworkDTO);
	}
	
	
}