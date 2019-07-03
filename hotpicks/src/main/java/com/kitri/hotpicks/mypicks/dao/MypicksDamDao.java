package com.kitri.hotpicks.mypicks.dao;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.mypicks.model.PickListDto;

public interface MypicksDamDao {

	// 글 목록 
			List<PickListDto> listArticle(Map<String, String> pamameter);
			
	// 글 보기 | 인자 : 글 번호
			PickListDto viewArticle(int seq);
			
}
