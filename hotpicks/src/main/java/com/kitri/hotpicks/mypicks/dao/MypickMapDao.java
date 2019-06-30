package com.kitri.hotpicks.mypicks.dao;

import java.util.List;

import com.kitri.hotpicks.mypicks.model.MapContentsDto;


public interface MypickMapDao {
	List<MapContentsDto> getMapList();
	List<MapContentsDto> selectContentsList(List<String> selectMarkers);
}
