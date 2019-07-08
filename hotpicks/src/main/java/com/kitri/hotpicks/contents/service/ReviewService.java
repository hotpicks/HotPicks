package com.kitri.hotpicks.contents.service;

import java.util.List;

import com.kitri.hotpicks.contents.model.ReviewDto;

public interface ReviewService {
	int writeArticle(ReviewDto reviewDto,List<String> hstg);
}
