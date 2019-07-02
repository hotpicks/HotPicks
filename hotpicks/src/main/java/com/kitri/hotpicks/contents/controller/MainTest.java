package com.kitri.hotpicks.contents.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.hotpicks.contents.service.ContentsService;



@Controller
@RequestMapping("/contents")
public class MainTest {

	private static final Logger logger = LoggerFactory.getLogger(MainTest.class);
	
	private ContentsService contentsService; 

	@RequestMapping(value = "/enter", method = RequestMethod.GET)
	public String enter(Model model) {
		System.out.println("entered");
		String takapikey = "qldeV%2BL5Ff%2BFi%2BJisZxRFyc1KDitxcPmNkhuwOjk6c7xQDVITEe0oDrh3XFd98iqnW89ky8RMDhQkQIb48h3%2BQ%3D%3D";

		String periodurlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
				+ "numOfRows=10&" + "pageNo=1&" + "MobileOS=ETC&" + "MobileApp=AppTest&" + "listYN=Y&" + "arrange=A&"
				+ "contentTypeId=15&" + "cat1=A02&" + "cat2=A0207&" + "cat3=A02070100&"
				+ "_type=json&" + "ServiceKey=" + takapikey;


		logger.info("----------------------------------");
		List<Map<String, String>> list = contentsService.apiexc(periodurlStr);
		model.addAttribute("json", list);

		return "contents/result";

	}

	

}
