package com.kitri.hotpicks.contents.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int writeArticle(ReviewDto reviewDto, List<String> hstg) {
		System.out.println("ReviewService 들어옴");
		Map<String, Object> map = new HashMap<String, Object>();
		String hstgTag = "";
		for (int i = 0; i < hstg.size(); i++) {
			hstgTag += "#"+hstg.get(i)+" ";
		}
		System.out.println(hstgTag);
		reviewDto.setHashTag(hstgTag);
		map.put("hstg", hstg);
		map.put("ReviewDto", reviewDto);
		int cnt = sqlSession.getMapper(ReviewDao.class).writeArticle(map);
		return cnt != 0 ? reviewDto.getRseq() : 0;
	}
}
