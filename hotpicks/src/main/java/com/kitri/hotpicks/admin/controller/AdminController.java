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
	
	//***************************************** [회원 관리] *****************************************
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
							Map<String, String> result,
							Model model) {
		System.out.println("admin_c : 회원 목록 세팅 메소드 들어옴");
		
		List<MemberDto> memberList = adminService.getMembers(memberType);
		result = adminService.getMemberCount();
				
		model.addAttribute("members", memberList);
		model.addAttribute("memberCount", result);
		
		return "/admin/result/mresult";
	}
	
	// 관리자 페이지 - HOME - 회원 강제탈퇴 처리
	@RequestMapping("/modifymember")
	public String getOutMember(@RequestParam("userIds") ArrayList<String> userIds,
											 Map<String, ArrayList<String>> map) {
		System.out.println("admin_c : 회원 강제탈퇴 처리 메소드 들어옴");
				
		map.put("userIds", userIds);
		
		adminService.getOutMember(map);
						
		return "/admin/managemember";
	}
	
	// 관리자 페이지 - HOME - 회원 탈퇴취소 처리
	@RequestMapping("/outcancelmember")
	public String outCancelMember(@RequestParam("userIds") ArrayList<String> userIds,
											 Map<String, ArrayList<String>> map) {
		System.out.println("admin_c : 회원 탈퇴취소 처리 메소드 들어옴");
				
		map.put("userIds", userIds);
		
		adminService.outCancelMember(map);
						
		return "/admin/managemember";
	}
	
	//***************************************** [리뷰 관리] *****************************************
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
							Map<String, String> result,
							Model model) {
		System.out.println("admin_c : 리뷰 목록 세팅 메소드 들어옴");
		
		List<Map<String, String>> reviewList = adminService.getReviews(reviewType);
		result = adminService.getReviewCount();
				
		model.addAttribute("articles", reviewList);
		model.addAttribute("reviewCount", result);
		
		return "/admin/result/rresult";
	}
	
	// 관리자 페이지 - HOME - 리뷰 삭제 처리
	@RequestMapping("/deletereview")
	public String deleteReview(@RequestParam("rseqs") ArrayList<String> rseqs,
											 Map<String, ArrayList<String>> map) {
		System.out.println("admin_c : 리뷰 삭제 처리 메소드 들어옴");
				
		map.put("rseqs", rseqs);
		
		adminService.deleteReview(map);
						
		return "/admin/managereview";
	}
	
	//***************************************** [회원 선호도 분석] *****************************************
	// 관리자 페이지 - HOME - 회원 선호도 분석 메뉴 이동
	@RequestMapping("/stlike")
	public String mvstatlike(Map<String, String> result,
							 Model model) {
		
		result = adminService.statDate();
		
		model.addAttribute("statDate", result);
		
		return "/admin/statlike";
	}
	
	// 관리자 페이지 - HOME - 회원 선호도 분석 메뉴 - 해시태그 랭킹 목록 세팅
	@RequestMapping("/stlike/{hashtagType}")
	public String getHashTag(@PathVariable("hashtagType") String hashtagType,
							Map<String, String> result,
							Model model) {
		System.out.println("admin_c : 해시태그 랭킹 목록 세팅 메소드 들어옴");
			
		List<Map<String, String>> hashTagList = adminService.getHashTags(hashtagType);
					
		model.addAttribute("tags", hashTagList);
			
		return "/admin/result/hresult";
	}
		
	//***************************************** [회원 방문 통계] *****************************************
	// 관리자 페이지 - HOME - 회원 방문 통계 메뉴 이동
	@RequestMapping("/stvisit")
	public String mvstatvisit() {
		return "/admin/statvisit";
	}
	
	//***************************************** [DB 메뉴] *****************************************
	// 관리자 페이지 - DB 메뉴 이동
	@RequestMapping("/db")
	public String movedb() {
		return "/admin/dbmenu";
	}
	
}
