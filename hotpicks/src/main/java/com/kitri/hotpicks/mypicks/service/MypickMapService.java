package com.kitri.hotpicks.mypicks.service;

import java.util.List;

import com.kitri.hotpicks.mypicks.model.MapContentsDto;


public interface MypickMapService {
	List<MapContentsDto> getContent();
	List<MapContentsDto> selectContentsList(List<String> selectMarkers);
	
}
