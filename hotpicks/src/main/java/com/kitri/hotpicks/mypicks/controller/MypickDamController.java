package com.kitri.hotpicks.mypicks.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	
	@RequestMapping(value = "/enter", method = RequestMethod.GET)	
	public String enter() {
		return  "mypicks/mypicklist";
	}
	
	
	@RequestMapping(value = "/list/{a}", method = RequestMethod.GET)
	public String list(@PathVariable("a") String a, Model model,@ModelAttribute("userInfo") MemberDto memberDto, Map<String,String> map) {
		String path = "";
		if(memberDto !=null) {
		String userid = memberDto.getUserId();
		map.put("a", a);
		map.put("userid", userid);
		List<PickListDto> list = mypickDamService.listArticle(map);
		System.out.println(list);
		model.addAttribute("articleList", list);
		
			path = "mypicks/listresult";
			
		}else {
			
			path = "redirect:/index.jsp";
			
		}
			return path;
		
//		List<PickListDto> list= mypickDamService.listArticle(parameter);
//		PageNavigation pageNavigation = commonService.getPageNavigation(parameter);
//		pageNavigation.setRoot(request.getContextPath());
//		pageNavigation.makeNavigator();
//		model.addAttribute("parameter", parameter);
//		model.addAttribute("navigator", pageNavigation);
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify( Model model, @ModelAttribute("userInfo") MemberDto memberDto,HttpSession session,Map<String,String> map) {
		String path = "";
		if(memberDto !=null) {
		String userid = memberDto.getUserId();
		PickListDto pickListDto = mypickDamService.getArticle(userid);
		System.out.println(pickListDto);
		model.addAttribute("modifyArticle", pickListDto);
		
			path = "mypicks/listresult";
			
		}else {
			
			path = "redirect:/index.jsp";
			
		}
			return path;
	}
	
	
//	@RequestMapping(value = "/cal", method = RequestMethod.GET)	
//	public String calendar(Model model, HttpSession session) {
//		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
//		String userid = memberDto.getUserId();
//		List<PickListDto> list = mypickDamService.listArticle(userid);
//		model.addAttribute("articleList2", list);
//		return  "mypicks/mypickcalendar";
				
//		List<PickListDto> list= mypickDamService.listArticle(parameter);
//		PageNavigation pageNavigation = commonService.getPageNavigation(parameter);
//		pageNavigation.setRoot(request.getContextPath());
//		pageNavigation.makeNavigator();
//		model.addAttribute("parameter", parameter);
//		model.addAttribute("navigator", pageNavigation);
//	}

}