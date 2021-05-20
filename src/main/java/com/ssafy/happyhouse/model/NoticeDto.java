package com.ssafy.happyhouse.model;

public class NoticeDto {
	int no;
	String userid;
	String date;
	String content;
	String title;
	
	public NoticeDto() {}
	
	public NoticeDto(int no, String userid, String date, String content, String title) {
		this.no = no;
		this.userid = userid;
		this.date = date;
		this.content = content;
		this.title = title;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "NoticeDto [no=" + no + ", userid=" + userid + ", date=" + date + ", content=" + content + ", title="
				+ title + "]";
	}
	
}
