package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.DongDto;
import com.ssafy.happyhouse.model.GugunDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.SidoDto;
import com.ssafy.happyhouse.services.MainService;

@RestController
@RequestMapping("/code")
public class ArticleController {
	
	@Autowired
	private MainService mainservice;
	
	@RequestMapping(value="/load", method = RequestMethod.GET)
	public Map<String,Object> load(){
		List<SidoDto> sidolist = mainservice.SidoService();
		List<GugunDto> gugunlist = mainservice.gugunService("11");
		List<DongDto> donglist = mainservice.dongService("11110");
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("sidolist",sidolist);
		map.put("gugunlist",gugunlist);
		map.put("donglist",donglist);
		System.out.println(map);
		return map;
		
	}
	
	@RequestMapping(value="/load/{gugun}", method = RequestMethod.GET)
	public List<DongDto> dong(@PathVariable("gugun") String gugun){
		
		String s = gugun.substring(0,5);
		List<DongDto> donglist = mainservice.dongService(s);
		
		return donglist;
		
	} 
	@RequestMapping(value="/load/info/{dong}", method = RequestMethod.GET)
	public List<HouseInfoDto> dongsearch(@PathVariable("dong") String dong){
		
		return mainservice.houseInfoDao(dong);
	}
	
	@RequestMapping(value="/housedeal", method = RequestMethod.POST)
	public List<HouseDealDto> Aptdeal(@RequestBody Map <String,String> map){
		return mainservice.housedealService(map);
	}

}
