package com.kitri.hotpicks.contents.dao;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.contents.model.ReviewDto;

public interface ReviewDao {
	int writeArticle(Map<String, Object> map);
}
