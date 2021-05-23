package com.ssafy.happyhouse.services;

import java.util.ArrayList;
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
import com.ssafy.happyhouse.util.LocDistance;

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
	public List<StoreDto> storeinfo(Map<String,String>map,String mode) {
		if(mode.equals("near")) {
			List<StoreDto> res = new ArrayList<StoreDto>();
			List<StoreDto> list = sqlsession.getMapper(MainDao.class).storeinfo(map);
			StoreDto cur;
			LocDistance dis = new LocDistance();
			double mindis = Double.MAX_VALUE;
			StoreDto store=new StoreDto();
			
			for(int i=0;i<list.size();i++) {
				
				cur = list.get(i);
				if(map.get("classify").equals("P")) {
					//헬스클럽,실내운동시설,스포츠시설
					if(cur.getDetail().contains("헬스클럽")||cur.getDetail().contains("실내운동시설")||cur.getDetail().contains("스포츠센터")||cur.getDetail().contains("체육관")) {
						
					}else {
						continue;
					}
					
				}else if(map.get("classify").equals("D")) {
					//마켓 편의점 식료품점 식자재판매, 시장
					if(cur.getDetail().contains("마켓")||cur.getDetail().contains("편의점")||cur.getDetail().contains("식자재판매")||cur.getDetail().contains("시장")) {
						
					}else {
						continue;
					}
				}
				double temp = dis.distance(Double.parseDouble(map.get("lat")), Double.parseDouble(map.get("lon")), Double.parseDouble(cur.getLat()), Double.parseDouble(cur.getLon()), "meter");
				
				if(mindis>temp) {
					mindis=temp;
					cur.setMindis(temp);
					store =cur;
				}
			}
			
			res.add(store);
			return res;
		}else {
			return sqlsession.getMapper(MainDao.class).storeinfo(map);
		}
		
	}
	

}
