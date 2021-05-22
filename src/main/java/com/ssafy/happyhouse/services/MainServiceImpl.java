package com.ssafy.happyhouse.services;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.MainDao;
import com.ssafy.happyhouse.model.DongDto;
import com.ssafy.happyhouse.model.GugunDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoDto;
import com.ssafy.happyhouse.model.StoreDto;
import com.ssafy.happyhouse.model.WishDto;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<DongDto> dongService(String gugun) {
		// TODO Auto-generated method stub
		return sqlsession.getMapper(MainDao.class).dongDao(gugun);
	}

	@Override
	public List<SidoDto> SidoService() {
		// TODO Auto-generated method stub
		return sqlsession.getMapper(MainDao.class).SidoDao();
	}

	@Override
	public List<GugunDto> gugunService(String sido) {
		// TODO Auto-generated method stub
		return sqlsession.getMapper(MainDao.class).gugunDao(sido);
	}

	@Override
	public List<HouseDealDto> housedealService(Map<String,String> map) {
		// TODO Auto-generated method stub
		return sqlsession.getMapper(MainDao.class).housedealDao(map);
	}
	@Override
	public int wishSearchService(WishDto wishdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int wishInsertService(WishDto wishdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int wishDeleteService(WishDto wishdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HouseInfoDto> houseInfoDao(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.getMapper(MainDao.class).houseInfoDao(map);
	}

	@Override
	public int totalList(String dong) {
		// TODO Auto-generated method stub
		return sqlsession.getMapper(MainDao.class).totalList(dong);
	}

	@Override
	public List<StoreDto> storeinfo(Map<String,String>map) {
		
		return sqlsession.getMapper(MainDao.class).storeinfo(map);
	}
	

}
