package com.kitri.hotpicks.mypicks.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kitri.hotpicks.common.service.CommonService;
import com.kitri.hotpicks.member.model.MemberDto;
import com.kitri.hotpicks.mypicks.model.PickListDto;
import com.kitri.hotpicks.mypicks.service.MypickDamService;
import com.kitri.hotpicks.util.PageNavigation;

@Controller
@RequestMapping("/mypicklist")
@SessionAttributes("userInfo")
public class MypickDamController {
	
	@Autowired
	private MypickDamService mypickDamService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)	
	public String list(Model model,HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String userid = memberDto.getUserId();
		List<PickListDto> list = mypickDamService.listArticle(userid);
		System.out.println(list);
		model.addAttribute("articleList", list);
		return  "mypicks/listresult";
				
//		List<PickListDto> list= mypickDamService.listArticle(parameter);
//		PageNavigation pageNavigation = commonService.getPageNavigation(parameter);
//		pageNavigation.setRoot(request.getContextPath());
//		pageNavigation.makeNavigator();
//		model.addAttribute("parameter", parameter);
//		model.addAttribute("navigator", pageNavigation);
	}
	
	
	@RequestMapping(value = "/cal", method = RequestMethod.GET)	
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