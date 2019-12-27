package com.java.review.dto;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 21.
 * @설명 : 리뷰용 스코어별 카운트 VO
 */

public class ReviewCountDto {
	private int good;	// 맛있어요, 5점 의 개수 
	private int soso;	// 괜찮아요, 3점 의 개수
	private int bad;	// 별로에요, 1점 의 개수
	private int whole;	// 리뷰 전체 개수 
	
	public ReviewCountDto() {}	
	
	public ReviewCountDto(int good, int soso, int bad, int whole) {
		super();
		this.good = good;
		this.soso = soso;
		this.bad = bad;
		this.whole = whole;
	}
	
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getSoso() {
		return soso;
	}
	public void setSoso(int soso) {
		this.soso = soso;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public int getWhole() {
		return whole;
	}
	public void setWhole(int whole) {
		this.whole = whole;
	}

	@Override
	public String toString() {
		return "ReviewCountDto [good=" + good + ", soso=" + soso + ", bad=" + bad + ", whole=" + whole + "]";
	}
	
}
