package com.kitri.hotpicks.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.hotpicks.admin.service.AdminService;
import com.kitri.hotpicks.contents.model.ReviewDto;
import com.kitri.hotpicks.member.model.MemberDto;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	// 관리자 페이지 - HOME - 회원 관리 이동
	@RequestMapping("/mgmember")
	public String mvmember(Map<String, String> result,
							Model model) {
		System.out.println("admin_c : 회원 관리 이동 메소드 들어옴");
		
		result = adminService.getMemberCount();
		
		model.addAttribute("memberCount", result);
		
		return "/admin/managemember";
	}
	
	// 관리자 페이지 - HOME - 회원 목록 세팅
	@RequestMapping("/mgmember/{memberType}")
	public String getMember(@PathVariable("memberType") String memberType,
							Model model) {
		System.out.println("admin_c : 회원 목록 세팅 메소드 들어옴");
		
		List<MemberDto> memberList = adminService.getMembers(memberType);
		
		model.addAttribute("members", memberList);
		
		return "/admin/result/mresult";
	}
	
	// 관리자 페이지 - HOME - 회원 강제탈퇴 처리
	@RequestMapping("/modifymember")
	public String getOutMember(@RequestParam("userIds") ArrayList<String> userIds,
											 Map<String, ArrayList<String>> map, Model model) {
		System.out.println("admin_c : 회원 강제탈퇴 처리 메소드 들어옴");
		
		System.out.println("뭘 받아오니>"+ userIds);
		
		map.put("userIds", userIds);
		
		adminService.getOutMember(map);
						
		return "/admin/managemember";
	}
	
	// 관리자 페이지 - HOME - 리뷰 관리 메뉴 이동
	@RequestMapping("/mgreview")
	public String mvreview(Map<String, String> result,
						   Model model) {
		
		result = adminService.getReviewCount();
		
		model.addAttribute("reviewCount", result);
		
		return "/admin/managereview";
	}
	
	// 관리자 페이지 - HOME - 리뷰 목록 세팅
	@RequestMapping("/mgreview/{reviewType}")
	public String getReview(@PathVariable("reviewType") String reviewType,
							Model model) {
		System.out.println("admin_c : 리뷰 목록 세팅 메소드 들어옴");
		
		List<Map<String, String>> reviewList = adminService.getReviews(reviewType);
		
		model.addAttribute("articles", reviewList);
		
		return "/admin/result/rresult";
	}
	
	// 관리자 페이지 - HOME - 회원 선호도 분석 메뉴 이동
	@RequestMapping("/stlike")
	public String mvstatlike() {
		return "/admin/statlike";
	}
		
	// 관리자 페이지 - HOME - 회원 방문 통계 메뉴 이동
	@RequestMapping("/stvisit")
	public String mvstatvisit() {
		return "/admin/statvisit";
	}
	
	// 관리자 페이지 - DB 메뉴 이동
	@RequestMapping("/db")
	public String movedb() {
		return "/admin/dbmenu";
	}
	
}
