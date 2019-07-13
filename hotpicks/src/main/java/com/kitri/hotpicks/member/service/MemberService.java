package com.kitri.hotpicks.member.service;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.contents.model.ReviewDto;
import com.kitri.hotpicks.member.model.MemberDto;

public interface MemberService {
	
	public int join(MemberDto memberDto);
	public String idCheck(String userId);
	public MemberDto login(MemberDto memberDto);
	
	public void modify(MemberDto memberDto);
	public void exit(MemberDto memberDto);
	
	public List<Map<String, String>> getReview(Map<String, String> map);
	public int getReviewCnt(String userId);
}
