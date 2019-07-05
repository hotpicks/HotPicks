package com.kitri.hotpicks.contents.dao;

import com.kitri.hotpicks.contents.model.ReviewDto;

public interface ReviewDao {
	int writeArticle(ReviewDto reviewDto);
}
