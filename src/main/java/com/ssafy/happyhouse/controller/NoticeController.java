package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.services.NoticeService;


@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/qna")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	NoticeService noticeService;

//	@GetMapping
//	public ResponseEntity<List<NoticeDto>> noticeList() throws SQLException {
//		logger.debug("listNotice - 호출");
//		return new ResponseEntity<>(noticeService.noticeList(), HttpStatus.OK);
//	}
	
	@GetMapping("/detail/{no}")
	public ResponseEntity<NoticeDto> searchNotice(@PathVariable int no) throws SQLException {
		logger.debug("searchBook - 호출");
		return new ResponseEntity<>(noticeService.search(no), HttpStatus.OK);
	}
	
	@PostMapping
	public ResponseEntity<String> createNotice(@RequestBody NoticeDto noticeDto, HttpSession session) throws SQLException {
		logger.debug("createNotice - 호출");
		
		if(noticeService.registNotice(noticeDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	@PutMapping("{no}")
	public ResponseEntity<String> modifyNotice(@RequestBody NoticeDto noticeDto, HttpSession session) throws SQLException {
		logger.debug("modifyNotice - 호출");
		logger.debug("" + noticeDto);
		
		if(noticeService.modifyNotice(noticeDto)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		
	}
	
	@DeleteMapping("{no}")
	public ResponseEntity<String> deleteNotice(@PathVariable("no") int no, HttpSession session) throws SQLException {
		logger.debug("deleteNotice - 호출");
		if(noticeService.deleteNotice(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
//	@GetMapping("/{cur}/{search}/{word}")
//	public ResponseEntity<Map<String,Object>> qnalist(@PathVariable String cur,@PathVariable String search, @PathVariable String word) throws SQLException{
//		int perpage = 5;
//		int curpage =  Integer.parseInt(cur);
//		int start = perpage*(curpage-1);
////		System.out.println(map.get("curpage"));
////		System.out.println(map.get("search"));
////		System.out.println(map.get("word"));
////		System.out.println(curpage+" "+search+" "+word);
//		
//		Map<String,Object> servicemap = new HashMap<String, Object>();
//		
//		Map<String,Object> resmap = new HashMap<String, Object>();
//		servicemap.put("search",search);
//		servicemap.put("word",word);
//		servicemap.put("start",start);
//		servicemap.put("end",perpage);
//		
//		List<NoticeDto> list = noticeService.qnalist(servicemap);
//		
//		resmap.put("list",list);
//		resmap.put("perpage",perpage);
//		resmap.put("curpage",curpage);
//		resmap.put("search",search);
//		resmap.put("word",word);
//		resmap.put("total", noticeService.totalCount());
//		
//		
//		return new ResponseEntity<Map<String,Object>>(resmap, HttpStatus.OK);
//		
//	}
	
	@GetMapping
	public ResponseEntity<Map<String,Object>> qnalist(@RequestParam Map<String, String> map) throws SQLException{
		int perpage = 5;
		int curpage =  Integer.parseInt(map.get("no"));
		int start = perpage*(curpage-1);
		System.out.println(map.get("no"));
		System.out.println(map.get("search"));
		System.out.println(map.get("word"));
//		System.out.println(curpage+" "+search+" "+word);
		
		Map<String,Object> servicemap = new HashMap<String, Object>();
//		
		Map<String,Object> resmap = new HashMap<String, Object>();
		servicemap.put("search",map.get("search"));
		servicemap.put("word",map.get("word"));
		servicemap.put("start",start);
		servicemap.put("end",perpage);
		
		List<NoticeDto> list = noticeService.qnalist(servicemap);
		
		resmap.put("list",list);
		resmap.put("perpage",perpage);
		resmap.put("curpage",curpage);
		resmap.put("search",map.get("search"));
		resmap.put("word",map.get("word"));
		resmap.put("total", noticeService.totalCount());
		
		
		return new ResponseEntity<Map<String,Object>>(resmap, HttpStatus.OK);
		
	}


}
