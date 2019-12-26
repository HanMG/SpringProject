package com.java.member.dto;

import java.util.Date;

public class MemberDto {
	private String memberCode;
	private Date memberDate;
	private String memberMail;
	private String memberPwd;
	private String memberName;
	private String memberPhone;
	private String memberStatus;
	

	public MemberDto() {
	}

	public MemberDto(String memberCode, Date memberDate, String memberMail, String memberPwd, String memberName,
			String memberPhone, String memberStatus) {
		this.memberCode = memberCode;
		this.memberDate = memberDate;
		this.memberMail = memberMail;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberStatus = memberStatus;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public Date getMemberDate() {
		return memberDate;
	}

	public void setMemberDate(Date memberDate) {
		this.memberDate = memberDate;
	}

	public String getMemberMail() {
		return memberMail;
	}

	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Override
	public String toString() {
		return "MemberDto [memberCode=" + memberCode + ", memberDate=" + memberDate + ", memberMail=" + memberMail
				+ ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", memberPhone=" + memberPhone
				+ ", memberStatus=" + memberStatus + "]";
	}

	
	
	

}
