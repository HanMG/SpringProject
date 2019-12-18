package com.java.purchase.dto;

import java.util.Date;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 17.
 * @작업 내용 : PurchaseDto
*/
public class PurchaseDto {
	private String purchaseCode;
	private String couponCode;
	private String memberCode;
	private String purchasePhone;
	private Date purchaseDate;
	private int purchaseCost;
	
	public PurchaseDto() {}
	
	public PurchaseDto(String purchaseCode, String couponCode, String memberCode, String purchasePhone,
			Date purchaseDate, int purchaseCost) {
		this.purchaseCode = purchaseCode;
		this.couponCode = couponCode;
		this.memberCode = memberCode;
		this.purchasePhone = purchasePhone;
		this.purchaseDate = purchaseDate;
		this.purchaseCost = purchaseCost;
	}
	
	public String getPurchaseCode() {
		return purchaseCode;
	}
	public void setPurchaseCode(String purchaseCode) {
		this.purchaseCode = purchaseCode;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getPurchasePhone() {
		return purchasePhone;
	}
	public void setPurchasePhone(String purchasePhone) {
		this.purchasePhone = purchasePhone;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public int getPurchaseCost() {
		return purchaseCost;
	}
	public void setPurchaseCost(int purchaseCost) {
		this.purchaseCost = purchaseCost;
	}
	@Override
	public String toString() {
		return "PurchaseDto [purchaseCode=" + purchaseCode + ", couponCode=" + couponCode + ", memberCode=" + memberCode
				+ ", purchasePhone=" + purchasePhone + ", purchaseDate=" + purchaseDate + ", purchaseCost="
				+ purchaseCost + "]";
	}
	
	
}
