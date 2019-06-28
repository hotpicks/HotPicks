package com.kitri.hotpicks.mypicks.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.mypicks.dao.MypickMapDao;
import com.kitri.hotpicks.mypicks.model.MapContentsDto;

@Service
public class MypickMapServiceImpl implements MypickMapService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MapContentsDto> getContent() {
		System.out.println("service");
		return sqlSession.getMapper(MypickMapDao.class).getMapList();
	}

}
