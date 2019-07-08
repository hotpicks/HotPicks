package com.kitri.hotpicks.contents.dao;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.contents.model.HashTagDto;
import com.kitri.hotpicks.contents.model.ReviewDto;

public interface ReviewDao {
	int writeArticle(ReviewDto reviewDto);
	HashTagDto getHashTag(Map<String, Object> map);
	void updHashList(Map<String, Object> map);
	void insNonHashList(Map<String, Object> map);
}
