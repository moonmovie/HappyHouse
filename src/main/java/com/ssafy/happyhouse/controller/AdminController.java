package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.ssafy.happyhouse.services.MemberService;


@RestController
@RequestMapping("/admin")
@CrossOrigin("*")
public class AdminController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value = "/member")
	public ResponseEntity<List<MemberDto>> memberList() throws SQLException {
		List<MemberDto> list = memberService.memberList();
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
		} else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
	
	@PostMapping(value = "/member")
	public ResponseEntity<List<MemberDto>> memberRegister(@RequestBody MemberDto memberDto) throws Exception {
		memberService.registerMember(memberDto);
		List<MemberDto> list = memberService.memberList();
		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);

	}
	
	@GetMapping(value = "/member/{userId}")
	public ResponseEntity<MemberDto> memberInfo(@PathVariable("userId") String userId) throws Exception {
		MemberDto memberDto = memberService.getMember(userId);
		if(memberDto != null)
			return new ResponseEntity<MemberDto>(memberDto, HttpStatus.OK);
		else
			return new ResponseEntity(HttpStatus.NO_CONTENT);
	}
	
	@PutMapping(value = "/member")
	public ResponseEntity<List<MemberDto>> memberModify(@RequestBody MemberDto memberDto) throws Exception {
		memberService.modifyMember(memberDto);
		List<MemberDto> list = memberService.memberList();
		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/member/{userId}")
	public ResponseEntity<List<MemberDto>> memberDelete(@PathVariable("userId") String userId) throws Exception {
		memberService.deleteMember(userId);
		List<MemberDto> list = memberService.memberList();
		return new ResponseEntity<List<MemberDto>>(list, HttpStatus.OK);

	}
}
