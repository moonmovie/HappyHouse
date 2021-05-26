package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.services.KakaoService;
import com.ssafy.happyhouse.services.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private KakaoService kakao;
	
	@GetMapping(value = "/wish")
	public String mv() throws SQLException {
		return "user/wish";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "user/list";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		try {
			MemberDto memberDto = memberService.login(map);
			if(memberDto != null) {
				session.setAttribute("user", memberDto);
				Cookie cookie = new Cookie("ssafy_id", memberDto.getUserId()); // 검색
				cookie.setPath("/");
				if("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);//40년간 저장.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
				
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요."); // 검색
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "/kakao/login", produces = "application/json", method = RequestMethod.GET)
	public String kakaologin(@RequestParam("code") String code, HttpSession session, HttpServletRequest request, HttpServletResponse httpServletResponse) {
		MemberDto member = new MemberDto();
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    System.out.println(userInfo.get("nickname"));
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
//	    if (userInfo.get("email") != null) {
//	    	member.setUserEmail((String) userInfo.get("email"));
//	    }
//	    session.setAttribute("userId", userInfo.get("nickname"));
	    member.setUserName((String) userInfo.get("nickname"));
	    member.setUserType("kakao");
	    session.setAttribute("user", member);
        session.setAttribute("access_Token", access_Token);
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "redirect:" + request.getHeader("Referer"); // 검색
	}
	
	@RequestMapping(value = "/kakao/logout", method = RequestMethod.GET)
	public String kakaologout(HttpSession session, HttpServletRequest request) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("user");
		return "redirect:" + request.getHeader("Referer"); // 검색
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist() {
		return "user/regist";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(MemberDto memberDto, Model model) {
		try {
			memberService.registerMember(memberDto);
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원가입 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String select(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("user");
		if(memberDto != null) {
			return "user/select";

		} else {
			model.addAttribute("msg", "로그인 후 조회 가능한 페이지입니다.");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(String userId, Model model) {
		try {
			MemberDto memberDto = memberService.getMember(userId);
			model.addAttribute("user", memberDto);
			return "user/modify";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글수정 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(MemberDto memberDto, Model model, HttpSession session) {
		if(memberDto != null) {
			try {
				memberService.modifyMember(memberDto);
				return "user/select";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "글수정중 문제가 발생했습니다.");
				return "error/error";
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(String userId, Model model, HttpSession session) {
		try {
			memberService.deleteMember(userId);
			session.invalidate();
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "아이디 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
}
