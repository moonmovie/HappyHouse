package com.ssafy.happyhouse.model;

public class SidoDto {
	private String sido_code;
	private String sido_name;
	
	public String getSido_code() {
		return sido_code;
	}
	public void setSido_code(String sido_code) {
		this.sido_code = sido_code;
	}
	public String getSido_name() {
		return sido_name;
	}
	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}
	@Override
	public String toString() {
		return "SidoDto [sido_code=" + sido_code + ", sido_name=" + sido_name + "]";
	}
	
	
}
