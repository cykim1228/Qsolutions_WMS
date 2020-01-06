package kr.co.qsolutions.cowork.Util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import kr.co.qsolutions.cowork.VO.ModelVO;

public class CustomerExcelReader {
	
	/**
     * XLS ������ �м��Ͽ� List<CustomerVo> ��ü�� ��ȯ
     * @param filePath
     * @return
     */
    @SuppressWarnings("resource")
    public List<ModelVO> xlsToCustomerVoList(String filePath) {
        
        // ��ȯ�� ��ü�� ����
        List<ModelVO> list = new ArrayList<ModelVO>();
        
        FileInputStream fis = null;
        HSSFWorkbook workbook = null;
        
        try {
            
            fis= new FileInputStream(filePath);
            // HSSFWorkbook�� �������� ��ü ������ ��� �ִ� ��ü
            workbook = new HSSFWorkbook(fis);
            
            // Ž���� ����� Sheet, Row, Cell ��ü
            HSSFSheet curSheet;
            HSSFRow   curRow;
            HSSFCell  curCell;
            ModelVO vo;
            
            // Sheet Ž�� for��
            for(int sheetIndex = 0 ; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
                // ���� Sheet ��ȯ
                curSheet = workbook.getSheetAt(sheetIndex);
                // row Ž�� for��
                for(int rowIndex=0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
                    // row 0�� ��������̱� ������ ����
                    if(rowIndex != 0) {
                        // ���� row ��ȯ
                        curRow = curSheet.getRow(rowIndex);
                        vo = new ModelVO();
                        String value;
                        
                        // row�� ù��° cell���� ������� ���� ��� �� cellŽ��
                        if(!"".equals(curRow.getCell(0).getStringCellValue())) {
                            
                            // cell Ž�� for ��
                            for(int cellIndex=0;cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
                                curCell = curRow.getCell(cellIndex);
                                
                                if(true) {
                                    value = "";
                                    // cell ��Ÿ���� �ٸ����� String���� ��ȯ ����
                                    switch (curCell.getCellType()){
                                    case FORMULA:
                                        value = curCell.getCellFormula();
                                        break;
                                    case NUMERIC:
                                        value = curCell.getNumericCellValue()+"";
                                        break;
                                    case STRING:
                                        value = curCell.getStringCellValue()+"";
                                        break;
                                    case BLANK:
                                        value = curCell.getBooleanCellValue()+"";
                                        break;
                                    case ERROR:
                                        value = curCell.getErrorCellValue()+"";
                                        break;
                                    default:
                                        value = new String();
                                        break;
                                    }
                                    
                                    // ���� column index�� ���� vo�� �Է�
                                    switch (cellIndex) {
                                    case 0: // ����ڵ�
                                        vo.setEquipmentcode(value);;
                                        break;
                                        
                                    case 1: // �� ��
                                        vo.setModelname(value);;
                                        break;
                                        
                                    case 2: // �� �ø���
                                        vo.setModelserial(value);
                                        break;
                                        
                                    case 3: // �� ���ּ�
                                        vo.setModelmac(value);
                                        break;
        
                                    default:
                                        break;
                                    }
                                }
                            }
                            // cell Ž�� ���� vo �߰�
                            list.add(vo);
                        }
                    }
                }
            }
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        } finally {
            try {
                // ����� �ڿ��� finally���� ����
                if( workbook!= null) workbook.close();
                if( fis!= null) fis.close();
                
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return list;
    }
    
    /**
     * XLSX ������ �м��Ͽ� List<CustomerVo> ��ü�� ��ȯ
     * @param filePath
     * @return
     */
    public List<ModelVO> xlsxToCustomerVoList(String filePath) {
        // ��ȯ�� ��ü�� ����
        List<ModelVO> list = new ArrayList<ModelVO>();
        
        FileInputStream fis = null;
        XSSFWorkbook workbook = null;
        
        try {
            
            fis= new FileInputStream(filePath);
            // HSSFWorkbook�� �������� ��ü ������ ��� �ִ� ��ü
            workbook = new XSSFWorkbook(fis);
            
            // Ž���� ����� Sheet, Row, Cell ��ü
            XSSFSheet curSheet;
            XSSFRow   curRow;
            XSSFCell  curCell;
            ModelVO vo;
            
            // Sheet Ž�� for��
            for(int sheetIndex = 0 ; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
                // ���� Sheet ��ȯ
                curSheet = workbook.getSheetAt(sheetIndex);
                // row Ž�� for��
                for(int rowIndex=0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
                    // row 0�� ��������̱� ������ ����
                    if(rowIndex != 0) {
                        // ���� row ��ȯ
                        curRow = curSheet.getRow(rowIndex);
                        vo = new ModelVO();
                        String value;
                        
                        // row�� ù��° cell���� ������� ���� ��� �� cellŽ��
                        if(!"".equals(curRow.getCell(0).getStringCellValue())) {
                            
                            // cell Ž�� for ��
                            for(int cellIndex=0;cellIndex<curRow.getPhysicalNumberOfCells(); cellIndex++) {
                                curCell = curRow.getCell(cellIndex);
                                
                                if(true) {
                                    value = "";
                                    // cell ��Ÿ���� �ٸ����� String���� ��ȯ ����
                                    switch (curCell.getCellType()){
                                    case FORMULA:
                                        value = curCell.getCellFormula();
                                        break;
                                    case NUMERIC:
                                        value = curCell.getNumericCellValue()+"";
                                        break;
                                    case STRING:
                                        value = curCell.getStringCellValue()+"";
                                        break;
                                    case BLANK:
                                        value = curCell.getBooleanCellValue()+"";
                                        break;
                                    case ERROR:
                                        value = curCell.getErrorCellValue()+"";
                                        break;
                                    default:
                                        value = new String();
                                        break;
                                    }
                                    
                                    // ���� column index�� ���� vo�� �Է�
                                    switch (cellIndex) {
                                    case 0: // ����ڵ�
                                        vo.setEquipmentcode(value);;
                                        break;
                                        
                                    case 1: // �� ��
                                        vo.setModelname(value);;
                                        break;
                                        
                                    case 2: // �� �ø���
                                        vo.setModelserial(value);
                                        break;
                                        
                                    case 3: // �� ���ּ�
                                        vo.setModelmac(value);
                                        break;
        
                                    default:
                                        break;
                                    }
                                }
                            }
                            // cell Ž�� ���� vo �߰�
                            list.add(vo);
                        }
                    }
                }
            }
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            
        } finally {
            try {
                // ����� �ڿ��� finally���� ����
                if( workbook!= null) workbook.close();
                if( fis!= null) fis.close();
                
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return list;
    }

}
