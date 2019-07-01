package com.kitri.hotpicks.mypicks.dao;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.mypicks.model.MapContentsDto;


public interface MypickMapDao {
	List<MapContentsDto> getMapList();
	List<MapContentsDto> selectContentsList(Map<String, Object> map);
}
