package com.kitri.hotpicks.mypicks.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.hotpicks.common.service.CommonService;
import com.kitri.hotpicks.member.model.MemberDto;
import com.kitri.hotpicks.mypicks.model.PickListDto;
import com.kitri.hotpicks.mypicks.service.MypickDamService;
import com.kitri.hotpicks.util.PageNavigation;

@Controller
@RequestMapping("/mypicklist")
public class MypickDamController {
	
	@Autowired
	private MypickDamService mypickDamService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)	// 단순 페이지 이동 (void 시, 클래스의 Mapping/메소드의Mapping으로 감)
	public String list(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String userid = memberDto.getUserId();
		List<PickListDto> list = mypickDamService.listArticle(userid);
		model.addAttribute("articleList", list);
		return  "mypicks/mypicklist";
				
//		List<PickListDto> list= mypickDamService.listArticle(parameter);
//		PageNavigation pageNavigation = commonService.getPageNavigation(parameter);
//		pageNavigation.setRoot(request.getContextPath());
//		pageNavigation.makeNavigator();
//		model.addAttribute("parameter", parameter);
//		model.addAttribute("navigator", pageNavigation);
	}
	
	@RequestMapping(value = "/cal", method = RequestMethod.GET)	// 단순 페이지 이동 (void 시, 클래스의 Mapping/메소드의Mapping으로 감)
	public String calendar(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String userid = memberDto.getUserId();
		List<PickListDto> list = mypickDamService.listArticle(userid);
		model.addAttribute("articleList2", list);
		return  "mypicks/mypickcalendar";
				
//		List<PickListDto> list= mypickDamService.listArticle(parameter);
//		PageNavigation pageNavigation = commonService.getPageNavigation(parameter);
//		pageNavigation.setRoot(request.getContextPath());
//		pageNavigation.makeNavigator();
//		model.addAttribute("parameter", parameter);
//		model.addAttribute("navigator", pageNavigation);
	}

}