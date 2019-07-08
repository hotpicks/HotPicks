package com.kitri.hotpicks.contents.service;

import java.util.List;

import com.kitri.hotpicks.contents.model.HashTagDto;
import com.kitri.hotpicks.contents.model.ReviewDto;

public interface ReviewService {
	int writeArticle(ReviewDto reviewDto,List<String> hstg);

	HashTagDto getHashList(String tag, int rseq);

	void updHashList(List<HashTagDto> hashList);

	void insNonHashList(List<String> nonHashList,int contentsid);
}
