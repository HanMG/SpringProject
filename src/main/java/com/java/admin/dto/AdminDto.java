package com.java.admin.dto;

public class AdminDto {

	private String adminId;
	private String adminPwd;
	
	
	public AdminDto() {
	}


	public AdminDto(String adminId, String adminPwd) {
		this.adminId = adminId;
		this.adminPwd = adminPwd;
	}


	String getAdminId() {
		return adminId;
	}


	void setAdminId(String adminId) {
		this.adminId = adminId;
	}


	String getAdminPwd() {
		return adminPwd;
	}


	void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}


	@Override
	public String toString() {
		return "AdminDto [adminId=" + adminId + ", adminPwd=" + adminPwd + "]";
	}
	
	
}
