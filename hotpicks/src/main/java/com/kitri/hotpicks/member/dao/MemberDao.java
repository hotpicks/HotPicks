package com.kitri.hotpicks.member.dao;

import com.kitri.hotpicks.member.model.MemberDto;

public interface MemberDao {

	public MemberDto login(MemberDto memberDto);
	public void join(MemberDto memberDto);
	public int idCheck(String userId);
	
}
