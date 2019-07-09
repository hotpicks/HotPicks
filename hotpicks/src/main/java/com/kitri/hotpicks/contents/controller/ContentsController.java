package com.kitri.hotpicks.contents.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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

		
		List<ContentsDto> contentsList = contentsService.selectContentsList();
		
		model.addAttribute("dbContentsList", contentsList);
		
		logger.info("set----------------------------------");

		// SelectLocation@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		List<SidoDto> sidoList = contentsService.selectSido();
		model.addAttribute("sidoList", sidoList);

		
		
		// PullApi@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		//List<Map<String, String>> list = contentsService.apiexc(areaUrlStr);
		//model.addAttribute("apiContentsList", list);

		
		return "contents/result";

	}
	
	@RequestMapping(value = "/changesgg", method = RequestMethod.GET)
	public @ResponseBody String changeLocation(@RequestParam int sdcode) {
		
		System.out.println("sdcode : " + sdcode);
		List<SigunguDto> sigunguList = contentsService.selectSigungu(sdcode);
//		System.out.println(sigunguList.toString());
//		JSONArray sigunguArr = (JSONArray)sigunguList;
		org.json.JSONArray sigunguArr = new org.json.JSONArray(sigunguList);
//		System.out.println(sigunguArr.toJSONString());
//		JSONObject sigunguJson = new JSONObject();
		org.json.JSONObject sigunguJson = new org.json.JSONObject(sigunguArr);
//		sigunguJson.put("sigunguJson", sigunguArr);
		sigunguJson.put("sigunguJson", sigunguArr);
		return sigunguJson.toString();
	}

	
	
	
	
	
	
	
	
	@RequestMapping(value = "/apiinsert", method = RequestMethod.GET)
	public @ResponseBody String apiInsertProcess() {

		String takapikey = "qldeV%2BL5Ff%2BFi%2BJisZxRFyc1KDitxcPmNkhuwOjk6c7xQDVITEe0oDrh3XFd98iqnW89ky8RMDhQkQIb48h3%2BQ%3D%3D";

		//locationInsertProcess
		String locationUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?" + "MobileOS=ETC&"
				+ "MobileApp=AppTest&" + "numOfRows=50&" + "_type=json&" + "ServiceKey=" + takapikey;
		
		System.out.println(locationUrl);
		//String resultMsg = contentsService.locationProcess(locationUrl);
		logger.info("insert location process complete");
	
		//apiInsertProcess
		String areaUrlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
				+ "numOfRows=10000&" + "pageNo=1&" + "MobileOS=ETC&" + "MobileApp=AppTest&" + "listYN=Y&" + "arrange=A&"
				+ "contentTypeId=15&" + "_type=json&" + "ServiceKey=" + takapikey;
			//InsertApicontents
		 contentsService.insertApiProcess(areaUrlStr);
		 logger.info("insert api process complete");

		
		
		
		return "successed api";
	}

}
