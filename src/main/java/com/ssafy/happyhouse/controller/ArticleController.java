package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
import com.ssafy.happyhouse.model.StoreDto;
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
		Map<String, Object> servicedata = new HashMap<String, Object>();
		servicedata.put("dong",dong);
		return  mainservice.houseInfoDao(servicedata);
	}
	
	@RequestMapping(value="/house/{dong}/{cur}", method = RequestMethod.GET)
	public Map<String,Object> dongAptsearch(@PathVariable("dong") String dong, @PathVariable("cur") int cur){
		Map<String, Object> servicedata = new HashMap<String, Object>();
		int perpage = 5;
		int start=perpage*(cur-1);
		int end=perpage;
		servicedata.put("start",start);
		servicedata.put("end",end);
		servicedata.put("dong",dong);
		
		Map<String,Object> result =new HashMap<String, Object>();
		result.put("list",mainservice.houseInfoDao(servicedata));
		result.put("perpage",perpage);
		result.put("total",mainservice.totalList(dong));
		return result;
	}
	
	@RequestMapping(value="/housedeal", method = RequestMethod.POST)
	public List<HouseDealDto> Aptdeal(@RequestBody Map <String,String> map){
		return mainservice.housedealService(map);
	}
	
	@GetMapping("/store/{dongcode}")
	public Map<String,List<StoreDto>> storedong(@PathVariable("dongcode") String dong){
//		DFPQR
		String[] classifies= {"D","F","P","Q","R"};
		Map<String,List<StoreDto>> res = new HashMap<String, List<StoreDto>>();
		Map<String,String> daoparmas;
		
		for(int i=0;i<5;i++) {
			daoparmas = new HashMap<String, String>();
			daoparmas.put("dongcode",dong);
			daoparmas.put("classify",classifies[i]);
			res.put(classifies[i],mainservice.storeinfo(daoparmas,"all"));
		}
		return res;
	}
	@GetMapping("/hotdeal")
	public List<HouseInfoDto> hothousedto(){
		
		
		return null;
	}

}
