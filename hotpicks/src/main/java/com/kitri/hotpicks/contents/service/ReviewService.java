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

	//review 수정
	void modify(int rseq, String subject, int starPoint, String content);
	
	//review 삭제
	void delete(int rseq);
	
	//comment all 삭제
	void deleteMemoAll(int rceq);
	
	String deleteMemo(int rceq, String logId, int logTime);
	
	String modifyMemo(int rceq, String logId, int logTime, String content);
}
