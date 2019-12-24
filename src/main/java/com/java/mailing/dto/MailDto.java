package com.java.mailing.dto;

public class MailDto {
	private String mailForm;		// 발신자 메일
	private String mailTo;			// 수신자 메일
	private String mailSubject;		// 제목
	private String mailContent;		// 본문
	public MailDto() {}
	public MailDto(String mailForm, String mailTo, String mailSubject, String mailContent) {
		this.mailForm = mailForm;
		this.mailTo = mailTo;
		this.mailSubject = mailSubject;
		this.mailContent = mailContent;
	}
	public String getMailForm() {
		return mailForm;
	}
	public void setMailForm(String mailForm) {
		this.mailForm = mailForm;
	}
	public String getMailTo() {
		return mailTo;
	}
	public void setMailTo(String mailTo) {
		this.mailTo = mailTo;
	}
	public String getMailSubject() {
		return mailSubject;
	}
	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	@Override
	public String toString() {
		return "MailDto [mailForm=" + mailForm + ", mailTo=" + mailTo + ", mailSubject=" + mailSubject
				+ ", mailContent=" + mailContent + "]";
	}
}


