package com.kitri.hotpicks.contents.service;

import java.util.List;
import java.util.Map;

public interface ContentsService {

	List<Map<String, String>> apiexc(String urlStr);

	
	
	//시도,시군구 api 자료 DB에 insert
	String locationProcess(String locationUrl);
	//시도
	List<Integer> insertSido(String sidoUrl);
	//시군구
	void insertSigungu(String sigunguUrl, List<Integer> sdList);
}
