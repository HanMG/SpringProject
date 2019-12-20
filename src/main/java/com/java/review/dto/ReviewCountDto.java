package com.java.review.dto;

public class ReviewCountDto {
	private int good;
	private int soso;
	private int bad;
	private int whole;
	
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
