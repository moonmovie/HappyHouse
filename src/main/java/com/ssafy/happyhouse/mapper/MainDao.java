package com.ssafy.happyhouse.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.DongDto;
import com.ssafy.happyhouse.model.GugunDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoDto;
import com.ssafy.happyhouse.model.StoreDto;
import com.ssafy.happyhouse.model.WishDto;

public interface MainDao {
	List<DongDto> dongDao(String gugun);
	List<SidoDto> SidoDao();
	List<GugunDto> gugunDao(String sido);
	List<HouseDealDto> housedealDao(Map<String,String> map);
	List<HouseInfoDto> houseInfoDao(Map<String,Object> map);
	int wishSearchDao(WishDto wishdto);
	int wishDeleteDao(WishDto wishdto);
	int wishInsertDao(WishDto wishdto);
	int totalList(String dong);
	List<StoreDto> storeinfo(Map<String,String>map);
}
