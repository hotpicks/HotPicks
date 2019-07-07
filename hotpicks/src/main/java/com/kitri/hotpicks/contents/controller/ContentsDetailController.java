package com.kitri.hotpicks.contents.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/contents")
public class ContentsDetailController {
	
	@RequestMapping(value = "/contentdetail", method = RequestMethod.GET)
	public String contentdetail() {
		String path = "contents/tpgus_contentsdetail";
		return path;
//		System.out.println("상세일정들어옴");
//		return "/contents/contentdetail";
	}
}
