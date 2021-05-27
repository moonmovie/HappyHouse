package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.WishDto;
import com.ssafy.happyhouse.services.WishService;

@RestController
@RequestMapping("/wish")
@CrossOrigin("*")
public class WishController {
	
	@Autowired
	private WishService wishService;
	
	@GetMapping(value = "/check/{AptName}")
	public int check(@PathVariable("AptName") String AptName, HttpSession session) throws SQLException {
		System.out.println(AptName);
		MemberDto memberDto = (MemberDto) session.getAttribute("user");
		if(memberDto == null) {
			return 1;
		}else {
			int result = wishService.checkWish(memberDto.getUserId(), AptName);
			if(result == 0) return 2;
			else return 3;
		}

	}
	
	@GetMapping(value = "/list")
	public ResponseEntity<List<WishDto>> wishList(HttpSession session) throws SQLException {
		MemberDto memberDto = (MemberDto) session.getAttribute("user");
		List<WishDto> list = wishService.wishList(memberDto.getUserId());
		System.out.println(list);
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<WishDto>>(list, HttpStatus.OK);
		} else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
	
	@GetMapping(value = "/regist/{AptName}")
	public ResponseEntity registWish(@PathVariable("AptName") String AptName, HttpSession session, Model model) throws Exception {
		MemberDto memberDto = (MemberDto) session.getAttribute("user");
		System.out.println(AptName + " sd");
		if(memberDto != null) {
			wishService.registWish(memberDto.getUserId(), AptName);
			return new ResponseEntity(HttpStatus.OK);
		}else {
			model.addAttribute("msg", "로그인 후 찜할수 있음.");
			return new ResponseEntity("redirect:/", HttpStatus.NO_CONTENT);
		}
		
	}
	
	@DeleteMapping(value = "/delete/{AptName}")
	public ResponseEntity<List<WishDto>> deleteWish(@PathVariable("AptName") String AptName, HttpSession session) throws Exception {
		System.out.println(AptName + "sdf");
		MemberDto memberDto = (MemberDto) session.getAttribute("user");
		if(memberDto != null) {
			wishService.deleteWish(memberDto.getUserId(), AptName);
			List<WishDto> list = wishService.wishList(memberDto.getUserId());
			return new ResponseEntity(list, HttpStatus.OK);
		}else {
			return new ResponseEntity("redirect:/", HttpStatus.NO_CONTENT);
		}
	}
}
