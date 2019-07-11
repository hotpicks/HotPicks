package com.kitri.hotpicks.contents.dao;

import java.util.Map;

public interface tempPickDao {
	int tempPick(Map<String, Object> map);

	int insertPick(Map<String, Object> map);

	int deletePick(Map<String, Object> map);
}
