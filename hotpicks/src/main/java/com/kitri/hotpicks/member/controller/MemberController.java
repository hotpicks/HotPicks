package com.kitri.hotpicks.member.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

	// 가입하기
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberDto memberDto, Model model) {
		System.out.println("c : 가입하기 메소드 들어옴");
		
		int isJoined = memberService.join(memberDto);
		
		if(isJoined == 1) {
			SimpleDateFormat format = new SimpleDateFormat ( "yyyy년 MM월 dd일");
			String today = format.format(System.currentTimeMillis());
			memberDto.setJoinDate(today);
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
		System.out.println(json);
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
	@RequestMapping(value = "/logout")
	public String logout(@ModelAttribute("userInfo") MemberDto memberDto, SessionStatus sessionStatus) {
		System.out.println("c : 로그아웃하기 메소드 들어옴");
		sessionStatus.setComplete();
		return "redirect:/index.jsp";
	}
	
	// 마이페이지 이동
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypage(@ModelAttribute("userInfo") MemberDto memberDto, Model model) {
		System.out.println("c : 마이페이지 이동 메소드 들어옴");
		// TODO 마이페이지 이동 이벤트 수정
		// : memberDto의 id값이 가진, 리뷰개수, 리뷰 정보들을 model에 add해주기
	}
	
	// 정보수정 페이지 이동
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void modify() {
		System.out.println("c : 정보수정 페이지 이동 메소드 들어옴");
	}
	
	// 정보수정하기
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modify(MemberDto memberDto, Model model) {
		System.out.println("c : 정보수정하기 메소드 들어옴");
		System.out.println("아이디 : " +memberDto.getUserId());
		System.out.println("비번    : " +memberDto.getPass());
		System.out.println("새비번 : " +memberDto.getNewpass());
		System.out.println("이름 : " +memberDto.getName());
		System.out.println("나이 : " +memberDto.getAge());

		memberService.modify(memberDto);
		
		model.addAttribute("userInfo", memberDto);
		
		return "member/mypage";
		
	}
	
	
	// 탈퇴하기
	@RequestMapping("/exit")
	public String exit(@ModelAttribute("userInfo") MemberDto memberDto, SessionStatus sessionStatus) {
		System.out.println("c : 탈퇴하기 메소드 들어옴");
		
		memberService.exit(memberDto);
		
		sessionStatus.setComplete();
		
		return "redirect:/index.jsp";
		
	}
}
