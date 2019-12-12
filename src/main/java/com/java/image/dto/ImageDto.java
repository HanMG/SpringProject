package com.java.image.dto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  imageDto 생성
 */
public class ImageDto {
	private String image_code;
	private String refer_code;
	private String image_name;
	private int image_size;
	private String image_path;
	public String getImage_code() {
		return image_code;
	}
	public void setImage_code(String image_code) {
		this.image_code = image_code;
	}
	public String getRefer_code() {
		return refer_code;
	}
	public void setRefer_code(String refer_code) {
		this.refer_code = refer_code;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	public int getImage_size() {
		return image_size;
	}
	public void setImage_size(int image_size) {
		this.image_size = image_size;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public ImageDto(String image_code, String refer_code, String image_name, int image_size, String image_path) {
		super();
		this.image_code = image_code;
		this.refer_code = refer_code;
		this.image_name = image_name;
		this.image_size = image_size;
		this.image_path = image_path;
	}
	@Override
	public String toString() {
		return "imageDto [image_code=" + image_code + ", refer_code=" + refer_code + ", image_name=" + image_name
				+ ", image_size=" + image_size + ", image_path=" + image_path + "]";
	}
}
