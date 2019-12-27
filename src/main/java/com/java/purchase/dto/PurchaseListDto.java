package com.java.purchase.dto;

import java.util.Date;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 17.
 * @작업 내용 : PurchaseDto
*/
public class PurchaseListDto {
	private String purchaseCode;
	private String couponCode;
	private String memberCode;
	private String purchasePhone;
	private Date purchaseDate;
	private String purchaseStatus;
	
	private String couponName;
	private String couponStartdate;	
	private String couponEnddate;
	private String couponIntro;	
	private int couponCostori;
	private int couponCostsale;	
	private int couponSalerate;	
	
	private String imageCode;
	private String imageName;
	private String imagePath;
	
	public PurchaseListDto() {}

	public PurchaseListDto(String purchaseCode, String couponCode, String memberCode, String purchasePhone,
			Date purchaseDate, String purchaseStatus, String couponName, String couponStartdate, String couponEnddate,
			String couponIntro, int couponCostori, int couponCostsale, int couponSalerate, String imageCode,
			String imageName, String imagePath) {
		this.purchaseCode = purchaseCode;
		this.couponCode = couponCode;
		this.memberCode = memberCode;
		this.purchasePhone = purchasePhone;
		this.purchaseDate = purchaseDate;
		this.purchaseStatus = purchaseStatus;
		this.couponName = couponName;
		this.couponStartdate = couponStartdate;
		this.couponEnddate = couponEnddate;
		this.couponIntro = couponIntro;
		this.couponCostori = couponCostori;
		this.couponCostsale = couponCostsale;
		this.couponSalerate = couponSalerate;
		this.imageCode = imageCode;
		this.imageName = imageName;
		this.imagePath = imagePath;
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

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getCouponStartdate() {
		return couponStartdate;
	}

	public void setCouponStartdate(String couponStartdate) {
		this.couponStartdate = couponStartdate;
	}

	public String getCouponEnddate() {
		return couponEnddate;
	}

	public void setCouponEnddate(String couponEnddate) {
		this.couponEnddate = couponEnddate;
	}

	public String getCouponIntro() {
		return couponIntro;
	}

	public void setCouponIntro(String couponIntro) {
		this.couponIntro = couponIntro;
	}

	public int getCouponCostori() {
		return couponCostori;
	}

	public void setCouponCostori(int couponCostori) {
		this.couponCostori = couponCostori;
	}

	public int getCouponCostsale() {
		return couponCostsale;
	}

	public void setCouponCostsale(int couponCostsale) {
		this.couponCostsale = couponCostsale;
	}

	public int getCouponSalerate() {
		return couponSalerate;
	}

	public void setCouponSalerate(int couponSalerate) {
		this.couponSalerate = couponSalerate;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	
	public String getPurchaseStatus() {
		return purchaseStatus;
	}

	public void setPurchaseStatus(String purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}

	@Override
	public String toString() {
		return "PurchaseListDto [purchaseCode=" + purchaseCode + ", couponCode=" + couponCode + ", memberCode="
				+ memberCode + ", purchasePhone=" + purchasePhone + ", purchaseDate=" + purchaseDate
				+ ", purchaseStatus=" + purchaseStatus + ", couponName=" + couponName + ", couponStartdate="
				+ couponStartdate + ", couponEnddate=" + couponEnddate + ", couponIntro=" + couponIntro
				+ ", couponCostori=" + couponCostori + ", couponCostsale=" + couponCostsale + ", couponSalerate="
				+ couponSalerate + ", imageCode=" + imageCode + ", imageName=" + imageName + ", imagePath=" + imagePath
				+ "]";
	}
	
}
