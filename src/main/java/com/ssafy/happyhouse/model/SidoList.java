package com.ssafy.happyhouse.model;

import java.util.List;

public class SidoList {
	private List<SidoDto> sidolist;
	private List<GugunDto> gugunlist;
	private List<DongDto> donglist;
	public SidoList(List<SidoDto> sidolist, List<GugunDto> gugunlist, List<DongDto> donglist) {
		this.sidolist = sidolist;
		this.gugunlist = gugunlist;
		this.donglist=donglist;
	}
	
	
	
	
}
