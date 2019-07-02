package com.kitri.hotpicks.common.service;

import java.util.Map;

import com.kitri.hotpicks.util.PageNavigation;


// 게시판의 공통 기능
public interface CommonService {

	// 1. 다음 글 번호(seq) 얻기
	public int getNextSeq();
	
	//페이지정보받기
	PageNavigation getPageNavigation(Map<String, String> parameter);
	
	
}
