package com.kitri.hotpicks.admin.dao;

import java.util.List;
import java.util.Map;

public interface AdminDao {
	
	public List<Map<String, String>> getMembers(String memberType);

}
