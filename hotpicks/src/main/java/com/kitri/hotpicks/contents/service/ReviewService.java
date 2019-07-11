package com.kitri.hotpicks.contents.service;


import java.util.List;

import com.kitri.hotpicks.contents.model.CommentDto;
import com.kitri.hotpicks.contents.model.ReviewDto;

public interface ReviewService {
	int writeArticle(ReviewDto reviewDto);
	String reviewlist(int contentsId);
	
	void writeMemo(CommentDto commentDto);
	String listMemo(int rceq); 
	
	
	void insHashList(List<String> nonHashList, int rseq, int contentsid);
}
