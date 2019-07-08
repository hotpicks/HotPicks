package com.kitri.hotpicks.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.hotpicks.admin.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	// 관리자 페이지 - HOME - 회원 관리 이동
	@RequestMapping("/mgmember")
	public String mvmember() {
		System.out.println("admin_c : 회원 관리 이동 메소드 들어옴");
		return "/admin/managemember";
	}
	
	// 관리자 페이지 - HOME - 회원 관리 이동 (회원 목록 세팅)
	@RequestMapping("/mgmember/{memberType}")
	public String getMember(@PathVariable("memberType") String memberType,
							Model model) {
		System.out.println("admin_c : 회원 관리 이동 (회원 목록 세팅) 메소드 들어옴");
		
		List<Map<String, String>> memberList = adminService.getMembers(memberType);
		
		model.addAttribute("members", memberList);
		
		return "/admin/result/mresult";
	}
	
	// 관리자 페이지 - HOME - 게시물 관리 메뉴 이동
	@RequestMapping("/mgreview")
	public String mvreview() {
		return "/admin/managereview";
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
