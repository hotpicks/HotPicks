package com.kitri.hotpicks.contents.dao;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.contents.model.CommentDto;
import com.kitri.hotpicks.contents.model.ReviewDto;

public interface ReviewDao {
	int writeArticle(ReviewDto reviewDto);
	List<ReviewDto> reviewlist(int contentsId);
	
	int writeMemo(CommentDto commentDto);
	List<CommentDto> listMemo(int rceq); 
	
	void insHashList(Map<String, Object> map);
}
