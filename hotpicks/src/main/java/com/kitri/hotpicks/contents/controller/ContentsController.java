package com.kitri.hotpicks.contents.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.SidoDto;
import com.kitri.hotpicks.contents.model.SigunguDto;
import com.kitri.hotpicks.contents.service.ContentsService;

@Controller
@RequestMapping("/contents")
public class ContentsController {

	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Autowired
	private ContentsService contentsService;

	@RequestMapping(value = "/enter", method = RequestMethod.GET)
	public String enter(Model model) {
		System.out.println("entered");
		String takapikey = "qldeV%2BL5Ff%2BFi%2BJisZxRFyc1KDitxcPmNkhuwOjk6c7xQDVITEe0oDrh3XFd98iqnW89ky8RMDhQkQIb48h3%2BQ%3D%3D";

		String areaUrlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
				+ "numOfRows=10000&" + "pageNo=1&" + "MobileOS=ETC&" + "MobileApp=AppTest&" + "listYN=Y&" + "arrange=A&"
				+ "contentTypeId=15&" + "_type=json&" + "ServiceKey=" + takapikey;
				//+ "&cat2=A0207";

		
		List<ContentsDto> contentsList = contentsService.selectContentsList();
		
		model.addAttribute("dbContentsList", contentsList);
		
		
		// InsertApi@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		// contentsService.insertApiProcess(areaUrlStr);

		// InsertLocation@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//String resultMsg = locationProcess();
		//System.out.println(resultMsg);
		// model.addAttribute("msg", resultMsg);

		//System.out.println(areaUrlStr);
		logger.info("set----------------------------------");

		// PullApi@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//List<Map<String, String>> list = contentsService.apiexc(areaUrlStr);
		//model.addAttribute("apiContentsList", list);

		// SelectLocation@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		List<SidoDto> sidoList = contentsService.selectSido();
		//System.out.println("size" + sidoList.size());
		model.addAttribute("sidoList", sidoList);

		return "contents/result";

	}
	
	@RequestMapping(value = "/changesgg", method = RequestMethod.GET)
	public @ResponseBody List<SigunguDto> changeLocation(@RequestParam int sdcode) {
		
		System.out.println("sdcode : " + sdcode);
		List<SigunguDto> sigunguList = contentsService.selectSigungu(sdcode);
		System.out.println(sigunguList.toString());
		
		
		
		return sigunguList;
	}

	
	
	
	
	
	
	
	
	@RequestMapping(value = "/insertlocation", method = RequestMethod.GET)
	public String locationProcess() {

		String takapikey = "qldeV%2BL5Ff%2BFi%2BJisZxRFyc1KDitxcPmNkhuwOjk6c7xQDVITEe0oDrh3XFd98iqnW89ky8RMDhQkQIb48h3%2BQ%3D%3D";

		String locationUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?" + "MobileOS=ETC&"
				+ "MobileApp=AppTest&" + "numOfRows=50&" + "_type=json&" + "ServiceKey=" + takapikey;

		System.out.println(locationUrl);
		logger.info("set----------------------------------");
		String resultMsg = contentsService.locationProcess(locationUrl);

		return resultMsg;
	}

}
