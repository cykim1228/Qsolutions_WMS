package kr.co.qsolutions.cowork.VO;


//1. PagingVo
public class PagingVO {
  
	private int pageCnt;          // 출력할 페이지번호 갯수
	private int index;            // 출력할 페이지번호
	private int pageStartNum;    // 출력할 페이지 시작 번호
	private int listCnt;          // 출력할 리스트 갯수
	private int total;            // 리스트 총 갯수
	private String searchType;	// 검색 내용
	private String searchData;	//
	private String startLogDate;
	private String endLogDate;
	
	{
		pageCnt = 10;
		index = 0;
		pageStartNum = 1;
		listCnt = 15;
	}
	public PagingVO() {}
	  
	public int getStart() {
		return index*listCnt;
	}
	
	public int getLast() {
		return listCnt;
	}
	  
	public int getPageLastNum() {
	int remainListCnt = total-listCnt*(pageStartNum-1);
	int remainPageCnt = remainListCnt/listCnt;
	if(remainListCnt%listCnt != 0) {
		remainPageCnt++;
	}
	int pageLastNum = 0;
	if(remainListCnt <= listCnt) {
		pageLastNum = pageStartNum;
		}else if(remainPageCnt <= pageCnt) {
			pageLastNum = remainPageCnt+pageStartNum-1;
		}else {
			pageLastNum = pageCnt+pageStartNum-1;
		}
		return pageLastNum;
	}
	public boolean getLastChk() {
		int n = (int)Math.ceil((double)total/listCnt);
		return getPageLastNum()==n ? false : n==0 ? false : true;
	}
	
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getPageStartNum() {
		return pageStartNum;
	}
	public void setPageStartNum(int pageStartNum) {
		this.pageStartNum = pageStartNum;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
  	public String getSearchType() {
  		return searchType;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getSearchData() {
		return searchData;
	}
	
	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
	public String getStartLogDate() {
		return startLogDate;
	}

	public void setStartLogDate(String startLogDate) {
		if(startLogDate == null || startLogDate == "") {
			startLogDate = "1990-01-01 00:00:00";
		}
		this.startLogDate = startLogDate;
	}

	public String getEndLogDate() {
		return endLogDate;
	}

	public void setEndLogDate(String endLogDate) {
		if(endLogDate == null || endLogDate == "") {
			endLogDate = "2999-12-31 12:59:59";
		}
		this.endLogDate = endLogDate;
	}
	//검색 일자 설정
	@Override
	public String toString() {
		return "PagingDto [pageCnt=" + pageCnt + ", index=" + index + ", pageStartNum=" + pageStartNum + ", listCnt="
				+ listCnt + ", total=" + total + ", searchType="+searchType+", searchData="+searchData+
				", startDate="+startLogDate+", endDate="+endLogDate+" getStart()=="+getStart()+" getLast()=="+getLast()+"]";
	}
	
}
