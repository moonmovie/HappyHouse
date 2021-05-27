package com.ssafy.happyhouse.services;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.DongDto;
import com.ssafy.happyhouse.model.GugunDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoDto;
import com.ssafy.happyhouse.model.StoreDto;
import com.ssafy.happyhouse.model.WishDto;

public interface MainService {
	List<DongDto> dongService(String gugun);
	List<SidoDto> SidoService();
	List<GugunDto> gugunService(String sido);
	List<HouseDealDto> housedealService(Map<String,String> map);
	List<HouseInfoDto> houseInfoDao(Map<String, Object> map);
	int wishSearchService(WishDto wishdto);
	int wishInsertService(WishDto wishdto);
	int wishDeleteService(WishDto wishdto);
	int totalList(String dong);
	List<StoreDto> storeinfo(Map<String,String>map,String mode);
	List<HouseInfoDto> hotlike();
	
}
