package com.java.admin.dto;

public class AdminCouponDto {
	private int totalCouponCnt; // 전체 음식점 수
	private int	korCoupon;	//한식
	private int chnCoupon;	//중국식
	private int jpCoupon;		//일식
	private int wtCoupon;		//양식	
	private int cafe;		//카페
	private int etc;		//기타	
	public AdminCouponDto() {}
	public AdminCouponDto(int totalCouponCnt, int korCoupon, int chnCoupon, int jpCoupon, int wtCoupon, int cafe,
			int etc) {
		super();
		this.totalCouponCnt = totalCouponCnt;
		this.korCoupon = korCoupon;
		this.chnCoupon = chnCoupon;
		this.jpCoupon = jpCoupon;
		this.wtCoupon = wtCoupon;
		this.cafe = cafe;
		this.etc = etc;
	}
	public int getTotalCouponCnt() {
		return totalCouponCnt;
	}
	public void setTotalCouponCnt(int totalCouponCnt) {
		this.totalCouponCnt = totalCouponCnt;
	}
	public int getKorCoupon() {
		return korCoupon;
	}
	public void setKorCoupon(int korCoupon) {
		this.korCoupon = korCoupon;
	}
	public int getChnCoupon() {
		return chnCoupon;
	}
	public void setChnCoupon(int chnCoupon) {
		this.chnCoupon = chnCoupon;
	}
	public int getJpCoupon() {
		return jpCoupon;
	}
	public void setJpCoupon(int jpCoupon) {
		this.jpCoupon = jpCoupon;
	}
	public int getWtCoupon() {
		return wtCoupon;
	}
	public void setWtCoupon(int wtCoupon) {
		this.wtCoupon = wtCoupon;
	}
	public int getCafe() {
		return cafe;
	}
	public void setCafe(int cafe) {
		this.cafe = cafe;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "AdminCouponDto [totalCouponCnt=" + totalCouponCnt + ", korCoupon=" + korCoupon + ", chnCoupon="
				+ chnCoupon + ", jpCoupon=" + jpCoupon + ", wtCoupon=" + wtCoupon + ", cafe=" + cafe + ", etc=" + etc
				+ "]";
	}
}
