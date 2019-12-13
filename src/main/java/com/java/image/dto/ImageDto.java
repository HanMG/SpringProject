package com.java.image.dto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  imageDto 생성
 */
public class ImageDto {
	private String imageCode;
	private String referCode;
	private String imageName;
	private int imageSize;
	private String imagePath;
	public ImageDto() {
	}
	public ImageDto(String imageCode, String referCode, String imageName, int imageSize, String imagePath) {
		super();
		this.imageCode = imageCode;
		this.referCode = referCode;
		this.imageName = imageName;
		this.imageSize = imageSize;
		this.imagePath = imagePath;
	}
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}
	public String getReferCode() {
		return referCode;
	}
	public void setReferCode(String referCode) {
		this.referCode = referCode;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getImageSize() {
		return imageSize;
	}
	public void setImageSize(int imageSize) {
		this.imageSize = imageSize;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@Override
	public String toString() {
		return "ImageDto [imageCode=" + imageCode + ", referCode=" + referCode + ", imageName=" + imageName
				+ ", imageSize=" + imageSize + ", imagePath=" + imagePath + "]";
	}
	
}
