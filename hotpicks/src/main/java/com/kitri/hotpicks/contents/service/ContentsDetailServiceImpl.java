package com.kitri.hotpicks.contents.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.contents.dao.ContentsDao;
import com.kitri.hotpicks.contents.dao.ContentsDetailDao;
import com.kitri.hotpicks.contents.model.ContentsDetailDto;
import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.ContentsImageDto;
import com.kitri.hotpicks.contents.model.HashTagDto;

@Service
public class ContentsDetailServiceImpl implements ContentsDetailService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ContentsDto selectContents(int contentsId) {
		ContentsDto contentsDto = sqlSession.getMapper(ContentsDetailDao.class).selectContents(contentsId);

		return contentsDto;
	}

	@Override
	public List<ContentsImageDto> selectContentsImage(int contentsId) {
		List<ContentsImageDto> list = sqlSession.getMapper(ContentsDetailDao.class).selectContentsImage(contentsId);

		return list;
	}

	@Override
	public List<HashTagDto> selectHashTag(int contentsId) {
		List<HashTagDto> list = sqlSession.getMapper(ContentsDetailDao.class).selectHashTag(contentsId);

		return list;
	}

	@Override
	public ContentsDetailDto selectContentsDetail(int contentsId) {
		ContentsDetailDto contentsDetailDto = sqlSession.getMapper(ContentsDetailDao.class).selectContentsDetail(contentsId);

		return contentsDetailDto;
	}

	@Override
	public String selectContentsType(int contentsId) {
		String contentsType = sqlSession.getMapper(ContentsDetailDao.class).selectContentsType(contentsId);

		return contentsType;
	}

	@Override
	public int selectpicklistNum(int contentsId) {
		int picklistNum = sqlSession.getMapper(ContentsDetailDao.class).selectpicklistNum(contentsId);

		return picklistNum;
	}

	@Override
	public int selectreviewNum(int contentsId) {
		int reviewNum = sqlSession.getMapper(ContentsDetailDao.class).selectreviewNum(contentsId);

		return reviewNum;
	}

	@Override
	public int getPick(Map<String, Object> map) {
		int cnt =  sqlSession.getMapper(ContentsDetailDao.class).getPick(map);
		return cnt;
	}

	@Override
	public int insertPick(Map<String, Object> map) {
		int cnt =  sqlSession.getMapper(ContentsDetailDao.class).insertPick(map);
		return cnt;
	}

	@Override
	public int deletePick(Map<String, Object> map) {
		int cnt =  sqlSession.getMapper(ContentsDetailDao.class).deletePick(map);
		return cnt;
	}

	@Override
	public void updatehitCount(int contentsId) {
		sqlSession.getMapper(ContentsDetailDao.class).updatehitCount(contentsId);
		
	}

	

	
}
