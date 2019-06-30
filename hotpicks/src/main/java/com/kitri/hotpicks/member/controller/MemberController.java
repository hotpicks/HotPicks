package com.kitri.hotpicks.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kitri.hotpicks.member.model.MemberDto;
import com.kitri.hotpicks.member.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes("userInfo")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void join() {
		System.out.println("c : 가입 페이지 이동 메소드 들어옴");
	}

	// TODO 가입하기 메소드 구현
	// 가입하기
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberDto memberDto, Model model) {
		System.out.println("c : 가입하기 메소드 들어옴");
		
		int isJoined = memberService.join(memberDto);
		
		if(isJoined == 1) {
			model.addAttribute("joinInfo", memberDto);
			return "/member/joinok";			
		} else {
			return "/member/joinfail";
		}
				
	}
	
	// id 중복 체크하기
	@RequestMapping("/idcheck")
	@ResponseBody
	public String idcheck(@RequestParam(name="checkid", defaultValue = "") String userId) {
		String json = memberService.idCheck(userId);
		return json;
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
		System.out.println("c : 로그인 페이지 이동 메소드 들어옴");
	}

	// 로그인하기
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDto memberDto, Model model) {
		System.out.println("c : 로그인하기 메소드 들어옴");
				
		MemberDto loginMember = memberService.login(memberDto);
		
		if(loginMember != null) {
			model.addAttribute("userInfo", loginMember);
			return "redirect:/index.jsp";
		} else {
			model.addAttribute("loginfail", "fail");
			return "member/login";
		}
		
	}
	
	// 로그아웃하기
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(@ModelAttribute("userInfo") MemberDto memberDto, SessionStatus sessionStatus) {
		System.out.println("c : 로그아웃하기 메소드 들어옴");
		sessionStatus.setComplete();
		return "redirect:/index.jsp";
	}
	
	
}
