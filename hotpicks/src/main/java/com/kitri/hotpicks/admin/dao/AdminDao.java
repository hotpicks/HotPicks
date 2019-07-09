package com.kitri.hotpicks.admin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.contents.model.ReviewDto;
import com.kitri.hotpicks.member.model.MemberDto;

public interface AdminDao {
	
	public Map<String , String> getMemberCount();
	public List<MemberDto> getAllMembers();
	public List<MemberDto> getBlockMembers();
	public void getOutMember(Map<String, ArrayList<String>> map);

	public Map<String, String> getReviewCount();
	public List<Map<String, String>> getAllReviews();
	public List<Map<String, String>> getBlockReviews();

}
