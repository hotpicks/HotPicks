package com.kitri.hotpicks.contents.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.kitri.hotpicks.contents.model.ContentsDetailDto;
import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.ContentsImageDto;
import com.kitri.hotpicks.contents.model.HashTagDto;

public interface ContentsDetailService {
	ContentsDto selectContents(int contentsId);
	
	List<ContentsImageDto> selectContentsImage(int contentsId);
	
	List<HashTagDto> selectHashTag(int contentsId);
	
	ContentsDetailDto selectContentsDetail(int contentsId);
	String selectContentsType(int contentsId);
	int selectpicklistNum(int contentsId);
	int selectreviewNum(int contentsId);
	
	int getPick(Map<String, Object> map);

	int insertPick(Map<String, Object> map);

	int deletePick(Map<String, Object> map);
	
	void updatehitCount(int contentsId);
}
