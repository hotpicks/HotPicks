package com.kitri.hotpicks.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	List<Map<String, String>> getMembers(String memberType);

}
