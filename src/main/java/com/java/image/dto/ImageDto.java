package com.java.image.dto;

public class ImageDto {
	private String imageCode;
	private String referCode;
	private String imageName;
	private long imageSize;
	private String imagePath;
	public ImageDto() {}
	public ImageDto(String imageCode, String referCode, String imageName, long imageSize, String imagePath) {
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

	@Override
	public String toString() {
		return "ImageDto [imageCode=" + imageCode + ", referCode=" + referCode + ", imageName=" + imageName
				+ ", imageSize=" + imageSize + ", imagePath=" + imagePath + "]";
	}
}
