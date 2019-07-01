package com.kitri.hotpicks.member.service;

import com.kitri.hotpicks.member.model.MemberDto;

public interface MemberService {
	
	public int join(MemberDto memberDto);
	public String idCheck(String userId);
	public MemberDto login(MemberDto memberDto);
	public void modify(MemberDto memberDto);
	public void exit(MemberDto memberDto);
}
