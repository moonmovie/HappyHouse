package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.xml.sax.SAXException;

import com.ssafy.happyhouse.model.Pharmacy;
import com.ssafy.happyhouse.util.pharmacyData;
@RestController
@RequestMapping("/restapi")
public class RestApiController {
	
	final String SERVICE_KEY="";
	final String KEY="=TItOQLvPUcnyuPeLw3e%2BdxVNgUj5vgXfDuQFDjMvvRm%2FpoVEoFNNp%2B%2B4N6EGOXg3POHwnNLEXYX%2FKi5l8IN0yg%3D%3D"; //encoding
	@GetMapping("/{sido}/{gugun}/{lat}/{lon}")
	public Map<String,Object> ApiExplorer(@PathVariable String sido,@PathVariable String gugun,@PathVariable String lat,@PathVariable String lon)  throws IOException, ParserConfigurationException, SAXException {
		System.out.println(sido+" "+gugun+" "+lat+" "+lon);	
		Map<String,Object> list = new pharmacyData().getPharmacy(sido, gugun,lat,lon);
		 
	        
	        return list;
	    }
}
