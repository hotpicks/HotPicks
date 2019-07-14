package com.kitri.hotpicks.member.dao;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.member.model.MemberDto;

public interface MemberDao {

	public MemberDto login(MemberDto memberDto);
	public void join(MemberDto memberDto);
	public int idCheck(String userId);
	
	public void modify(MemberDto memberDto);	//비밀번호 유지 + 정보 수정
	public void modifynew(MemberDto memberDto); //비밀번호 변경 + 정보 수정
	public void exit(MemberDto memberDto);
	
	public List<Map<String, String>> getReview(Map<String, String> parameter);
	public int getReviewCnt(String userId);
	public Map<String, String> getCurrentMember(String userId);
	
}
