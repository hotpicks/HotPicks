package com.kitri.hotpicks.mypicks.service;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.mypicks.model.PickListDto;


public interface MypickDamService {

	// 글 목록 
		List<PickListDto> listArticle(Map<String, String> map);
		
	// 글 보기 | 인자 : 글 번호
		PickListDto viewArticle(String userid);
		
	// 글 수정 | 리턴 : 수정한 글 번호
		int modifyArticle(PickListDto pickListDto);
		PickListDto getArticle(String userid);
		
		
	// 글 삭제 | 인자 : 글 번호
		void deleteArticle(int seq);
	
}
