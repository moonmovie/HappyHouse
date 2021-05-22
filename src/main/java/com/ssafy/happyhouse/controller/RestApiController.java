package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.xml.sax.SAXException;

import com.ssafy.happyhouse.model.StoreDto;
import com.ssafy.happyhouse.services.MainService;
import com.ssafy.happyhouse.util.pharmacyData;
@RestController
@RequestMapping("/restapi")
public class RestApiController {
	
	@Autowired
	private MainService mainservice;
	
	@GetMapping("/{sido}/{gugun}/{dong}/{lat}/{lon}")
	public Map<String,Object> ApiExplorer(@PathVariable String sido,@PathVariable String gugun,@PathVariable String dong,@PathVariable String lat,@PathVariable String lon)  throws IOException, ParserConfigurationException, SAXException {
		System.out.println(sido+" "+gugun+" "+lat+" "+lon);	
		Map<String,Object> list = new HashMap<String, Object>();
		Map<String,Object> result = new pharmacyData().getPharmacy(sido, gugun,lat,lon);
		Map<String,Object> pha =new HashMap<String, Object>();
		pha.put("minpharmacy",result.get("minPharmacy"));
		pha.put("mindis",result.get("meter"));
		list.put("pharmacy",pha);
		
		String[] classifies= {"D","P","Q"};
		Map<String,String> daoparmas;
		
		for(int i=0;i<3;i++) {
			daoparmas = new HashMap<String, String>();
			daoparmas.put("dongcode",dong);
			daoparmas.put("classify",classifies[i]);
			daoparmas.put("lat",lat);
			daoparmas.put("lon",lon);
			//Q커피전문점  P운동시설  D마트편의점
			StoreDto sd =mainservice.storeinfo(daoparmas,"near").get(0);
			if(sd.getStoreid()==null) {
				list.put(classifies[i],null);
			}else {
				list.put(classifies[i],sd);
			}
			
		}
	        return list;
	    }
}
