package com.kitri.hotpicks.contents.dao;

import java.util.List;

import com.kitri.hotpicks.contents.model.ContentsDetailDto;
import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.ContentsImageDto;
import com.kitri.hotpicks.contents.model.HashTagDto;

public interface ContentsDetailDao {
	ContentsDto selectContents(int contentsId);
	List<ContentsImageDto> selectContentsImage(int contentsId);
	List<HashTagDto> selectHashTag(int contentsId);
	
	ContentsDetailDto selectContentsDetail(int contentsId);
	String selectContentsType(int contentsId);
	int selectpicklistNum(int contentsId);
	int selectreviewNum(int contentsId);
}
