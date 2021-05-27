package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.services.MainService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private MainService mainservice;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<HouseInfoDto> list =mainservice.hotlike();
		model.addAttribute("infolist", list);
		System.out.println(list);
		return "main";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String goindex(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "index";
	}
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detailpage(Locale locale, Model model) {
		
		return "detail";
	}
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String noticepage(Locale locale, Model model) {
		
		return "notice";
	}
	
	
}
