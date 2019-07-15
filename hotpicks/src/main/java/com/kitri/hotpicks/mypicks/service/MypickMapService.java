package com.kitri.hotpicks.mypicks.service;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.mypicks.model.ViewPickMapDto;


public interface MypickMapService {
	List<ViewPickMapDto> getContent(Map<String, Object> map);
	List<ViewPickMapDto> selectContentsList(double x,double y,List<String> selectMarkers, int distance);
	
}
