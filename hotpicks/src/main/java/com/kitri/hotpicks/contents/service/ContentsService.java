package com.kitri.hotpicks.contents.service;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.contents.model.ContentsTypeDto;
import com.kitri.hotpicks.contents.model.SidoDto;
import com.kitri.hotpicks.contents.model.SigunguDto;

public interface ContentsService {

	//temp(api로 불러온 자료 화면에 출력)
	List<Map<String, String>> apiexc(String urlStr);

	void insertApiProcess(String urlStr);
	List<Integer> insertApiContents(String urlStr, List<ContentsTypeDto> typeList);
	void insertApiContentsDetail(List<Integer> contentsIdList);
	
	//view 단에 sido, sigungu selecter
	//sido
	List<SidoDto> selectSido();
	Map<Integer, List<SigunguDto>> selectSigungu(List<SidoDto> sidoList);
	
	
	//시도,시군구 api 자료 DB에 insert
	String locationProcess(String locationUrl);
	//시도
	List<Integer> insertSido(String sidoUrl);
	//시군구
	void insertSigungu(String sigunguUrl, List<Integer> sdList);
	
	
}
