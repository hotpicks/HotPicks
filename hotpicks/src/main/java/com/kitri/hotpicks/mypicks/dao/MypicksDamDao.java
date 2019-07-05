package com.kitri.hotpicks.mypicks.dao;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.mypicks.model.PickListDto;

public interface MypicksDamDao {

	// 글 목록 
			List<PickListDto> listArticle(String userid);
			
	// 글 보기 | 인자 : 글 번호
			PickListDto viewArticle(int seq);
			
	// 글 수정 | 리턴 : 수정한 글 번호
			int modifyArticle(PickListDto pickListDto);

	// 글 삭제 | 인자 : 글 번호
			void deleteArticle(int seq);
			
}
