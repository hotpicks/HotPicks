package com.kitri.hotpicks.mypicks.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.hotpicks.mypicks.model.MapContentsDto;
import com.kitri.hotpicks.mypicks.service.MypickMapService;

@Controller
@RequestMapping("/mypickmap")
public class MypickMapController {
	
	@Autowired
	private MypickMapService mypickMapService;
	
	@RequestMapping("/getmaplist")
	public String mypicksMap(Model model) {
		System.out.println("controller");
		String path ="mypickmap";
		List<MapContentsDto> list = mypickMapService.getContent();
		model.addAttribute("maplist", list);
		return path;
	}
	
}
