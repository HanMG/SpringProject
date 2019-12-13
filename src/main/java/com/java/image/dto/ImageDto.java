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
	public String getimageCode() {
		return imageCode;
	}
	public void setimageCode(String imageCode) {
		this.imageCode = imageCode;
	}
	public String getreferCode() {
		return referCode;
	}
	public void setreferCode(String referCode) {
		this.referCode = referCode;
	}
	public String getimageName() {
		return imageName;
	}
	public void setimageName(String imageName) {
		this.imageName = imageName;
	}
	public int getimageSize() {
		return imageSize;
	}
	public void setimageSize(int imageSize) {
		this.imageSize = imageSize;
	}
	public String getimagePath() {
		return imagePath;
	}
	public void setimagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public ImageDto(String imageCode, String referCode, String imageName, int imageSize, String imagePath) {
		super();
		this.imageCode = imageCode;
		this.referCode = referCode;
		this.imageName = imageName;
		this.imageSize = imageSize;
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "imageDto [imageCode=" + imageCode + ", referCode=" + referCode + ", imageName=" + imageName
				+ ", imageSize=" + imageSize + ", imagePath=" + imagePath + "]";
	}
}
