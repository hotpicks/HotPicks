package com.kitri.hotpicks.mypicks.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.hotpicks.mypicks.model.MapContentsDto;
import com.kitri.hotpicks.mypicks.model.SelectMapContentsDto;
import com.kitri.hotpicks.mypicks.service.MypickMapService;

@Controller
@RequestMapping("/mypickmap")
public class MypickMapController {
	
	@Autowired
	private MypickMapService mypickMapService;
	
	@RequestMapping("/mvmypickmap")
	public String mvMap() {
		System.out.println("1");
		return "/mypicks/mypickmap";
	}
	
	@RequestMapping("/getmaplist")
	@ResponseBody
	public String mypicksMap() {
		System.out.println("controller");
		System.out.println("controller");
		List<MapContentsDto> list = mypickMapService.getContent();
		JSONArray array = new JSONArray(list);
		return array.toString();
		
	}
	//@RequestParam(value = "selectMarkers") List<String> selectMarkers,@RequestParam("x") double x, @RequestParam("y") double y,@RequestParam("distance") int distance
	@RequestMapping("/getcontentslist")
	public String selectContentsList(@RequestParam(value = "selectMarkers") List<String> selectMarkers,@RequestParam("x") double x, @RequestParam("y") double y,@RequestParam("selectDistance") int distance, Model model) {
		System.out.println(selectMarkers);
		if (selectMarkers.size() != 0) {
			List<MapContentsDto> list = mypickMapService.selectContentsList(x, y, selectMarkers,distance);
			model.addAttribute("list",list);
		}
		String path = "/mypicks/selectcontents";
		return path;
	}
	
}
