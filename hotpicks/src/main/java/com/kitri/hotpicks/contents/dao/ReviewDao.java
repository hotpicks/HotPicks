package com.kitri.hotpicks.contents.dao;

import java.util.List;

import com.kitri.hotpicks.contents.model.ReviewDto;

public interface ReviewDao {
	int writeArticle(ReviewDto reviewDto);
	List<ReviewDto> reviewlist(int contentsId);
}
