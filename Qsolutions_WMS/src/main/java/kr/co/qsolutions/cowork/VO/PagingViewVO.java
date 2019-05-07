package kr.co.qsolutions.cowork.VO;

public class PagingViewVO {

	/** �� �������� �Խñ� �� **/
    private int pageSize = 10;
    
    /** �� ��(range)�� ������ �� **/
    private int rangeSize = 5;
    
    /** ���� ������ **/
    private int curPage = 1;
    
    /** ���� ��(range) **/
    private int curRange = 1;
    
    /** �� �Խñ� �� **/
    private int listCnt;
    
    /** �� ���� �� **/
    private int userCnt;
    
    /** �� ������ �� **/
    private int pageCnt;
    
    /** �� ��(range) �� **/
    private int rangeCnt;
    
    /** ���� ������ **/
    private int startPage = 1;
    
    /** �� ������ **/
    private int endPage = 1;
    
    /** ���� index **/
    private int startIndex = 0;
    
    /** ���� ������ **/
    private int prevPage;
    
    /** ���� ������ **/
    private int nextPage;
    
	public int getUserCnt() {
		return userCnt;
	}

	public void setUserCnt(int userCnt) {
		this.userCnt = userCnt;
	}

	public PagingViewVO(int userCnt, int curPage) {
		// TODO Auto-generated constructor stub
		/**
         * ����¡ ó�� ����
         * 1. �� ��������
         * 2. �� ��(range)��
         * 3. range setting
         */
        
        // �� �Խù� ���� ���� �������� Controller�� ���� �޾ƿ´�.
        /** ���������� **/
        setCurPage(curPage);
        /** �� �Խù� �� **/
        setListCnt(userCnt);
        
        /** 1. �� ������ �� **/
        setPageCnt(userCnt);
        /** 2. �� ��(range)�� **/
        setRangeCnt(pageCnt);
        /** 3. ��(range) setting **/
        rangeSetting(curPage);
        
        /** DB ���Ǹ� ���� startIndex ���� **/
        setStartIndex(curPage);
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getCurRange() {
		return curRange;
	}

	public void setCurRange(int curPage) {
		this.curRange = (int)((curPage-1)/rangeSize) + 1;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int userCnt) {
		this.pageCnt = (int) Math.ceil(userCnt*1.0/pageSize);
	}

	public int getRangeCnt() {
		return rangeCnt;
	}

	public void setRangeCnt(int pageCnt) {
		this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
	}
	
	public void rangeSetting(int curPage) {
        
        setCurRange(curPage);        
        this.startPage = (curRange - 1) * rangeSize + 1;
        this.endPage = startPage + rangeSize - 1;
        
        if(endPage > pageCnt){
            this.endPage = pageCnt;
        }
        
        this.prevPage = curPage - 1;
        this.nextPage = curPage + 1;
    }

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int curPage) {
		this.startIndex = (curPage-1) * pageSize;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	@Override
	public String toString() {
		return "PagingViewVO [pageSize=" + pageSize + ", rangeSize=" + rangeSize + ", curPage=" + curPage
				+ ", curRange=" + curRange + ", listCnt=" + listCnt + ", pageCnt=" + pageCnt + ", rangeCnt=" + rangeCnt
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", startIndex=" + startIndex + ", prevPage="
				+ prevPage + ", nextPage=" + nextPage + "]";
	}
    
}
