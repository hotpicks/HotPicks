package com.kitri.hotpicks.contents.service;

import com.kitri.hotpicks.contents.model.ReviewDto;

public interface ReviewService {
	int writeArticle(ReviewDto reviewDto);
	String reviewlist(int contentsId);
}
