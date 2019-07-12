package com.kitri.hotpicks.mypicks.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kitri.hotpicks.common.service.CommonService;
import com.kitri.hotpicks.member.model.MemberDto;
import com.kitri.hotpicks.mypicks.model.PickListDto;
import com.kitri.hotpicks.mypicks.service.MypickDamService;

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
		System.out.println(list.get(0).getContentsId());
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
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteArticle(@RequestParam("contentsId") ArrayList<String> contentsId) {
		Map<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
		System.out.println("리스트삭제 메소드");
		map.put("contentsId", contentsId);
		System.out.println(map.get("contentsId"));
		mypickDamService.deleteArticle(map);
		
		return "mypicks/mypicklist";
		
	}
	

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyArticle(@RequestParam("contentsId") List<Integer> list, @RequestParam("wanna") int wanna) {
		System.out.println("리스트수정 메소드");
		System.out.println(list);
		System.out.println(wanna);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("contentsId", list);
		map.put("wanna", wanna);
		mypickDamService.modifyArticle(map);
		
		return "mypicks/mypicklist";
		
	}
	
	
	@RequestMapping(value = "/cal", method = RequestMethod.GET)
	public String calendar(Model model,@ModelAttribute("userInfo") MemberDto memberDto, Map<String,String> map) {
		System.out.println("달력메소드 들어옴");
		String path = "";
		if(memberDto !=null) {
		String userid = memberDto.getUserId();
		map.put("userid", userid);
		List<PickListDto> callist = mypickDamService.calArticle(map);
		System.out.println(callist);
		model.addAttribute("articleCal", callist);
		
			path = "mypicks/mypickcalendar";
			
		}else {
			
			path = "redirect:/index.jsp";
			
		}
			return path;
	}

}