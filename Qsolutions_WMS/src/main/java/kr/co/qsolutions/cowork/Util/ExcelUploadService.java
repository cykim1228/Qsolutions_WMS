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
	
	// ���� �ٿ�ε�
	public void excelDown() throws Exception {
		
		/*
		// ������ VO�� �Ǵ� MAP��ü
		Map<String, Object>map = null;
		
		// ���� DArrayList<E> ���� LIST��ü
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>> ();
		ArrayList<String> columnList = new ArrayList<String> ();
		
		// DB��ȸ �� �����͸� ��Ҵٴ� ������ ������
		for(int i = 0 ; i < 10 ; i++) {
			map = new HashMap<String, Object> ();
			map.put("seq", i + 1);
			map.put("title", "�����̴�." + i);
			map.put("content", "�����Դϴ�." + i);
			list.add(map);
		}
		
		// MAP�� KEY���� �������
		if(list != null && list.size() > 0) {
			
			// LIST�� ù��° �������� KEY��
			Map<String, Object> m = list.get(0);
			
			// MAP�� KEY���� columnList ��ü�� �߰�
			for(String k : m.keySet()) {
				columnList.add(k);
			}
			
		}
		*/
		
		CompanyVO vo = new CompanyVO();
		List<CompanyVO> list = companyservice.CompanyAllSelect();
		
		ArrayList<String> columnList = new ArrayList<String> ();
		columnList.add("�÷� 1");
		columnList.add("�÷� 2");
		
		// 1���� workbook ������
		HSSFWorkbook workbook = new HSSFWorkbook();
		
		// 2�� sheet ����
		// HSSFSheet sheet = 
		
	}
	
}
