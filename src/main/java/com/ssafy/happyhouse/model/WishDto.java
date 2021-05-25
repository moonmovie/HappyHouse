package com.ssafy.happyhouse.model;

public class WishDto {
	String userId;
	String AptName;
	String dong;
	String buildYear;

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAptName() {
		return AptName;
	}
	public void setAptName(String aptName) {
		AptName = aptName;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBuildYear() {
		return buildYear;
	}
	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}
	@Override
	public String toString() {
		return "WishDto [userId=" + userId + ", AptName=" + AptName + ", dong=" + dong + ", buildYear=" + buildYear
				+ "]";
	}
	
	
}
