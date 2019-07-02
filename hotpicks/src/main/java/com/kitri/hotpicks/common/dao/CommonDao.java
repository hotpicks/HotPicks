package com.kitri.hotpicks.common.dao;

import java.util.Map;

public interface CommonDao {

	// 1. 다음 글 번호(seq) 얻기
	public int getNextSeq();

	// 2. 조회수(hit) 올리기
	public void updateHit(int seq);
	//새글갯수
	public int getNewArticleCount(int bcode);
	//전체글갯수
	public int getTotalArticleCount(Map<String, String> parameter);

}
