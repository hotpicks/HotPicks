package com.kitri.hotpicks.mypicks.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		return sqlSession.getMapper(MypickMapDao.class).getMapList();
	}

	@Override
	public List<MapContentsDto> selectContentsList(double x,double y,List<String> selectMarkers, int distance) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selectMarkers", selectMarkers);
		map.put("x", x);
		map.put("y", y);
		map.put("distance", distance);
		System.out.println("service" + map);
		return sqlSession.getMapper(MypickMapDao.class).selectContentsList(map);
	}

}
