package com.kitri.hotpicks.admin.dao;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.member.model.MemberDto;

public interface AdminDao {
	
	public Map<String , String> getMemberCount();
	public List<MemberDto> getAllMembers();
	public List<MemberDto> getBlockMembers();

}
