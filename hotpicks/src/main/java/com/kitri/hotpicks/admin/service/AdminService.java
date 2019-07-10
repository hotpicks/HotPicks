package com.kitri.hotpicks.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.contents.model.ReviewDto;
import com.kitri.hotpicks.member.model.MemberDto;

public interface AdminService {

	Map<String, String> getMemberCount();
	List<MemberDto> getMembers(String memberType);
	void getOutMember(Map<String, ArrayList<String>> map);
	void outCancelMember(Map<String, ArrayList<String>> map);

	Map<String, String> getReviewCount();
	List<Map<String, String>> getReviews(String reviewType);
	void deleteReview(Map<String, ArrayList<String>> map);
	
	List<Map<String, String>> getHashTags(String hashtagType);
	Map<String, String> statDate();
	
}
