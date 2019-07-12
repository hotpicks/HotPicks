package com.kitri.hotpicks.contents.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kitri.hotpicks.contents.model.ContentsDetailDto;
import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.ContentsImageDto;
import com.kitri.hotpicks.contents.model.ContentsTypeDto;
import com.kitri.hotpicks.contents.model.HashTagDto;
import com.kitri.hotpicks.contents.service.ContentsDetailService;

@Controller
@RequestMapping("/contents")
public class ContentsDetailController {
	
	@Autowired
	private ContentsDetailService contentsDetailService;
	
//	@RequestMapping(value = "/contentdetail", method = RequestMethod.GET)
//	public void contentdetail() {
////		System.out.println("상세일정들어옴");
////		return "/contents/contentdetail";
//	}
	@RequestMapping(value = "/contentdetail", method = RequestMethod.GET)
	public void contentdetail(Model model) {
//		System.out.println("상세일정들어옴");
//		return "/contents/contentdetail";
		model.addAttribute("contentsid", "140682");

	}
	
	@RequestMapping(value = "/viewdetail", method = RequestMethod.GET)
	public String viewdetail(@RequestParam int contentsId, Model model) {
		
		//Contents
		ContentsDto contentsDto= contentsDetailService.selectContents(contentsId);
		model.addAttribute("contentsDto", contentsDto);
		System.out.println("contentsDto : "+contentsDto);
		
		//ContentsDetail
		ContentsDetailDto contentsDetailDto= contentsDetailService.selectContentsDetail(contentsId);
		model.addAttribute("contentsDetailDto", contentsDetailDto);
		System.out.println("contentsDetailDto : "+contentsDetailDto);
		
		//Contents카테고리 이름
		String contentsType = contentsDetailService.selectContentsType(contentsId);
		model.addAttribute("contentsType", contentsType);
		System.out.println("contentsType : "+contentsType);
		
		//Picklist갯수
		int picklistNum = contentsDetailService.selectpicklistNum(contentsId);
		model.addAttribute("picklistNum", picklistNum);
		System.out.println("picklistNum : "+picklistNum);
		
		//review갯수
		int reviewNum = contentsDetailService.selectreviewNum(contentsId);
		model.addAttribute("reviewNum", reviewNum);
		System.out.println("reviewNum : "+reviewNum);
		
		//HashTag
		List<HashTagDto> hashTagDto = contentsDetailService.selectHashTag(contentsId);
		model.addAttribute("hashTagDto",hashTagDto);
		System.out.println("hashTagDto : "+hashTagDto);
		
		//Contents Image
		List<ContentsImageDto> contentsImageDto = contentsDetailService.selectContentsImage(contentsId);
		model.addAttribute("contentsImageDto",contentsImageDto);
		System.out.println("contentsImageDto : "+contentsImageDto);
		
		
		
		return "contents/contentdetail";
	}
}
