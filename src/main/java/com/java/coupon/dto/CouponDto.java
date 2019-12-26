package com.java.coupon.dto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 13.
 * @작업 내용 :  couponStartdate, couponEnddate 데이터타입 String으로 변환
*/
public class CouponDto {
	private String couponCode;				// 쿠폰코드
	private String foodCode;				// 식당코드
	private String couponName;			// 쿠폰명(상품명)
	private String couponStartdate;		// 쿠폰유효기간(시작)
	private String couponEnddate;			// 쿠폰유효기간(마감)
	private String couponIntro;			// 쿠폰소개
	private int couponCostori;			// 쿠폰 원가
	private int couponCostsale;			// 쿠폰 할인가
	private int couponSalerate;				// 쿠폰 할인률
	private String couponStatus;				// 쿠폰 할인률
	private String imageCode;
	private String imageName;
	private long imageSize;
	private String imagePath;
	private String foodName;
	
	public CouponDto() {}

	public CouponDto(String couponCode, String foodCode, String couponName, String couponStartdate,
			String couponEnddate, String couponIntro, int couponCostori, int couponCostsale, int couponSalerate,
			String couponStatus, String imageCode, String imageName, long imageSize, String imagePath,
			String foodName) {
		this.couponCode = couponCode;
		this.foodCode = foodCode;
		this.couponName = couponName;
		this.couponStartdate = couponStartdate;
		this.couponEnddate = couponEnddate;
		this.couponIntro = couponIntro;
		this.couponCostori = couponCostori;
		this.couponCostsale = couponCostsale;
		this.couponSalerate = couponSalerate;
		this.couponStatus = couponStatus;
		this.imageCode = imageCode;
		this.imageName = imageName;
		this.imageSize = imageSize;
		this.imagePath = imagePath;
		this.foodName = foodName;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getFoodCode() {
		return foodCode;
	}

	public void setFoodCode(String foodCode) {
		this.foodCode = foodCode;
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

	public long getImageSize() {
		return imageSize;
	}

	public void setImageSize(long imageSize) {
		this.imageSize = imageSize;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getCouponStatus() {
		return couponStatus;
	}

	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}

	@Override
	public String toString() {
		return "CouponDto [couponCode=" + couponCode + ", foodCode=" + foodCode + ", couponName=" + couponName
				+ ", couponStartdate=" + couponStartdate + ", couponEnddate=" + couponEnddate + ", couponIntro="
				+ couponIntro + ", couponCostori=" + couponCostori + ", couponCostsale=" + couponCostsale
				+ ", couponSalerate=" + couponSalerate + ", couponStatus=" + couponStatus + ", imageCode=" + imageCode
				+ ", imageName=" + imageName + ", imageSize=" + imageSize + ", imagePath=" + imagePath + ", foodName="
				+ foodName + "]";
	}
}
