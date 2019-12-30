package com.java.admin.dto;

public class AdminFoodDto {
	private int totalFoodCnt; // 전체 음식점 수
	private int	korFood;	//한식
	private int chnFood;	//중국식
	private int jpFood;		//일식
	private int wtFood;		//경양식
	private int bbq;		//고기집 
	private int cafe;		//카페
	private int fishFood;	//회집
	private int buffet;		//뷔페
	private int etc;		//기타	
	
	public AdminFoodDto() {}

	public AdminFoodDto(int totalFoodCnt, int korFood, int chnFood, int jpFood, int wtFood, int bbq, int cafe,
			int fishFood, int buffet, int etc) {
		super();
		this.totalFoodCnt = totalFoodCnt;
		this.korFood = korFood;
		this.chnFood = chnFood;
		this.jpFood = jpFood;
		this.wtFood = wtFood;
		this.bbq = bbq;
		this.cafe = cafe;
		this.fishFood = fishFood;
		this.buffet = buffet;
		this.etc = etc;
	}

	public int getTotalFoodCnt() {
		return totalFoodCnt;
	}

	public void setTotalFoodCnt(int totalFoodCnt) {
		this.totalFoodCnt = totalFoodCnt;
	}

	public int getKorFood() {
		return korFood;
	}

	public void setKorFood(int korFood) {
		this.korFood = korFood;
	}

	public int getChnFood() {
		return chnFood;
	}

	public void setChnFood(int chnFood) {
		this.chnFood = chnFood;
	}

	public int getJpFood() {
		return jpFood;
	}

	public void setJpFood(int jpFood) {
		this.jpFood = jpFood;
	}

	public int getWtFood() {
		return wtFood;
	}

	public void setWtFood(int wtFood) {
		this.wtFood = wtFood;
	}

	public int getBbq() {
		return bbq;
	}

	public void setBbq(int bbq) {
		this.bbq = bbq;
	}

	public int getCafe() {
		return cafe;
	}

	public void setCafe(int cafe) {
		this.cafe = cafe;
	}

	public int getFishFood() {
		return fishFood;
	}

	public void setFishFood(int fishFood) {
		this.fishFood = fishFood;
	}

	public int getBuffet() {
		return buffet;
	}

	public void setBuffet(int buffet) {
		this.buffet = buffet;
	}

	public int getEtc() {
		return etc;
	}

	public void setEtc(int etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "AdminFoodDto [totalFoodCnt=" + totalFoodCnt + ", korFood=" + korFood + ", chnFood=" + chnFood
				+ ", jpFood=" + jpFood + ", wtFood=" + wtFood + ", bbq=" + bbq + ", cafe=" + cafe + ", fishFood="
				+ fishFood + ", buffet=" + buffet + ", etc=" + etc + "]";
	}	
}
