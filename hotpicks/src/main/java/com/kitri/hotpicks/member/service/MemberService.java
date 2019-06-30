package com.kitri.hotpicks.member.service;

import com.kitri.hotpicks.member.model.MemberDto;

public interface MemberService {
	
	public void join(MemberDto memberDto);
	public MemberDto login(MemberDto memberDto);
	
}
