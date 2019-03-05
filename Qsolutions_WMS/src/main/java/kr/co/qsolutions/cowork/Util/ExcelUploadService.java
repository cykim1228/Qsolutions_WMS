package kr.co.qsolutions.cowork.Util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.co.qsolutions.cowork.Service.CompanyService;
import kr.co.qsolutions.cowork.VO.CompanyVO;

@Component
public class ExcelUploadService {
	
	@Autowired
	private CompanyService companyservice;
	
	// 엑셀 다운로드
	public void excelDown() throws Exception {
		
		/*
		// 임의의 VO가 되는 MAP객체
		Map<String, Object>map = null;
		
		// 가상 DArrayList<E> 담을 LIST객체
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>> ();
		ArrayList<String> columnList = new ArrayList<String> ();
		
		// DB조회 후 데이터를 담았다는 가상의 데이터
		for(int i = 0 ; i < 10 ; i++) {
			map = new HashMap<String, Object> ();
			map.put("seq", i + 1);
			map.put("title", "제목이다." + i);
			map.put("content", "내용입니다." + i);
			list.add(map);
		}
		
		// MAP의 KEY값을 담기위함
		if(list != null && list.size() > 0) {
			
			// LIST의 첫번째 데이터의 KEY값
			Map<String, Object> m = list.get(0);
			
			// MAP의 KEY값을 columnList 객체에 추가
			for(String k : m.keySet()) {
				columnList.add(k);
			}
			
		}
		*/
		
		CompanyVO vo = new CompanyVO();
		List<CompanyVO> list = companyservice.CompanyAllSelect();
		
		ArrayList<String> columnList = new ArrayList<String> ();
		columnList.add("컬럼 1");
		columnList.add("컬럼 2");
		
		// 1차로 workbook 생성ㄱ
		HSSFWorkbook workbook = new HSSFWorkbook();
		
		// 2차 sheet 생성
		// HSSFSheet sheet = 
		
	}
	
}
