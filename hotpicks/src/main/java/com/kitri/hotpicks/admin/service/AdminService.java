package com.kitri.hotpicks.admin.service;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.member.model.MemberDto;

public interface AdminService {

	Map<String, String> getMemberCount();
	List<MemberDto> getMembers(String memberType);

}
