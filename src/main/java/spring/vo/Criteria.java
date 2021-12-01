package spring.vo;

import java.util.Arrays;

public class Criteria {

	
	 // 현재 페이지 
    private int pageNum;
    
    // 한 페이지 당 보여질 게시물 갯수 
    private int amount;
    
    
    //검색키워드
    private String keywordName;
    
    //검색타입
    private String type;
    
    //검색타입배열
    private String[] typeArr;
    
    //기본 생성자 -> 기본 세팅 : pageNum = 1, amount = 10 
    public Criteria() {
    	this(1,10);
        
    }
   
    //생성자 => 원하는 pageNum, 원하는 amount 
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
      
    }

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeywordName() {
		return keywordName;
	}

	public void setKeywordName(String keywordName) {
		this.keywordName = keywordName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr=type.split("");
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keywordName=" + keywordName + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + "]";
	}

	



	
	

	


    
}
