package com.kitri.hotpicks.contents.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.contents.dao.ReviewDao;
import com.kitri.hotpicks.contents.model.ContentsDto;
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

	@Override
	public String reviewlist(int contentsId) {
//		System.out.println("리스트뽑으러 서비스 도착");
		return makeJson(contentsId);
		
	}
	
	private String makeJson(int contentsId) {
		List<ReviewDto> list = sqlSession.getMapper(ReviewDao.class).reviewlist(contentsId);
//		System.out.println("list : " + list);
		JSONArray array = new JSONArray(list);
		JSONObject json = new JSONObject();
		json.put("reviewlist", array);
		
		return json.toString();
	}
	
	

}
