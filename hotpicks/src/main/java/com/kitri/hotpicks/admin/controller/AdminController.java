package com.kitri.hotpicks.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	// 관리자 페이지 - HOME - 회원 관리 이동
	@RequestMapping("/mgmember")
	public String mvmember() {
		return "/admin/managemember";
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
