package com.kitri.hotpicks.contents.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
//	public void contentdetail(Model model) {
////		System.out.println("상세일정들어옴");
////		return "/contents/contentdetail";
//		model.addAttribute("contentsid", "140682");
//
//	}
	
//	//조회수 올리기
//	@RequestMapping(value = "/hit", method = RequestMethod.GET)
//	public void updatehitCount(@RequestParam int contentsId) {
//		contentsDetailService.updatehitCount(contentsId);
//	}
	
	//ContentsDetail 페이지 정보 가져오기
	@RequestMapping(value = "/viewdetail", method = RequestMethod.GET)
	public String viewdetail(@RequestParam int contentsId, Model model) {
		
		//조회수 올리기
		contentsDetailService.updatehitCount(contentsId);
		
		//Contents
		ContentsDto contentsDto= contentsDetailService.selectContents(contentsId);
		model.addAttribute("contentsDto", contentsDto);
		//System.out.println("contentsDto : "+contentsDto);
		
		//ContentsDetail
		ContentsDetailDto contentsDetailDto= contentsDetailService.selectContentsDetail(contentsId);
		model.addAttribute("contentsDetailDto", contentsDetailDto);
		//System.out.println("contentsDetailDto : "+contentsDetailDto);
		
		//Contents카테고리 이름
		String contentsType = contentsDetailService.selectContentsType(contentsId);
		model.addAttribute("contentsType", contentsType);
		//System.out.println("contentsType : "+contentsType);
		
		//Picklist갯수
		int picklistNum = contentsDetailService.selectpicklistNum(contentsId);
		model.addAttribute("picklistNum", picklistNum);
		//System.out.println("picklistNum : "+picklistNum);
		
		//review갯수
		int reviewNum = contentsDetailService.selectreviewNum(contentsId);
		model.addAttribute("reviewNum", reviewNum);
		//System.out.println("reviewNum : "+reviewNum);
		
		//HashTag
		List<HashTagDto> hashTagDto = contentsDetailService.selectHashTag(contentsId);
		model.addAttribute("hashTagDto",hashTagDto);
		//System.out.println("hashTagDto : "+hashTagDto);
		
		//Contents Image
		List<ContentsImageDto> contentsImageDto = contentsDetailService.selectContentsImage(contentsId);
		model.addAttribute("contentsImageDto",contentsImageDto);
		//System.out.println("contentsImageDto : "+contentsImageDto);
		
		
		
		return "contents/contentdetail";
	}
	
	//좋아요
	@RequestMapping(value = "/getpick",method = RequestMethod.GET)
	@ResponseBody
	public int getPick(@RequestParam Map<String, Object> map) {
		System.out.println(map);
		int cnt = contentsDetailService.getPick(map);
		return cnt;
	}
	
	@RequestMapping("/insertpick")
	@ResponseBody
	public int insertPick(@RequestParam Map<String, Object> map) {
		System.out.println("ins : "+ map);
		int cnt = contentsDetailService.insertPick(map);
		return cnt;
	}
	
	@RequestMapping("/deletepick")
	@ResponseBody
	public int deletePick(@RequestParam Map<String, Object> map) {
		System.out.println("del : "+ map);
		int cnt = contentsDetailService.deletePick(map);
		return cnt;
	}
}
