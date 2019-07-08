package com.kitri.hotpicks.contents.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.contents.dao.ReviewDao;
import com.kitri.hotpicks.contents.model.HashTagDto;
import com.kitri.hotpicks.contents.model.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int writeArticle(ReviewDto reviewDto, List<String> hstg) {
		System.out.println("ReviewService 들어옴");
		String hstgTag = "";
		for (int i = 0; i < hstg.size(); i++) {
			hstgTag += "#"+hstg.get(i)+" ";
		}
		System.out.println(hstgTag);
		reviewDto.setHashTag(hstgTag);
		int cnt = sqlSession.getMapper(ReviewDao.class).writeArticle(reviewDto);
		return cnt != 0 ? reviewDto.getRseq() : 0;
	}

	@Override
	public HashTagDto getHashList(String hashtag, int rseq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hashtag", hashtag);
		map.put("rseq", rseq);
		HashTagDto hashTagDto = sqlSession.getMapper(ReviewDao.class).getHashTag(map);
		return hashTagDto;
	}

	@Override
	public void updHashList(List<HashTagDto> hashList) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hashList", hashList);
		sqlSession.getMapper(ReviewDao.class).updHashList(map);
		
	}

	@Override
	public void insNonHashList(List<String> nonHashList,int contentsid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nonHashList", nonHashList);
		map.put("contentsid", contentsid);
		sqlSession.getMapper(ReviewDao.class).insNonHashList(map);
		
	}
}
