package com.kitri.hotpicks.contents.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.contents.dao.ReviewDao;
import com.kitri.hotpicks.contents.model.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int writeArticle(ReviewDto reviewDto) {
		System.out.println("ReviewService 들어옴");
		int cnt = sqlSession.getMapper(ReviewDao.class).writeArticle(reviewDto);
		return cnt != 0 ? reviewDto.getSeq() : 0;
	}

}
